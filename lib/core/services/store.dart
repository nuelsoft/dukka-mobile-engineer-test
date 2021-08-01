import 'package:dukka/core/models/__base.dart';
import 'package:get_storage/get_storage.dart';

class Store<T extends Model> {
  Map<String, Map<String, dynamic>?> _data = {};

  T? findById(String id) {
    Map<String, dynamic>? entry = _data[id];
    return entry == null ? null : serializer(entry);
  }

  T? findByEmailOrPhone(String email, String phone) {
    for (String key in _data.keys)
      if (_data[key]?["email"] == email || _data[key]?["phone"] == phone)
        return serializer(_data[key]!);
  }

  Future<T> create(T entry) async {
    assert(entry.id == null);
    String id = _generateIdWithTimeStamp();
    entry..id = id;
    _data[id] = entry.json;

    await _syncData();
    return entry;
  }

  Future<T> update(String id, T entry) async {
    _data[id] = entry.json;

    await _syncData();
    return entry;
  }

  Future<bool> delete(String id) async {
    if (_data[id] == null) return false;
    _data.remove(id);

    await _syncData();
    return true;
  }

  List<T> all() {
    List<T> out = [];
    for (String key in _data.keys)
      if (_data[key] == null)
        continue;
      else
        out.add(serializer(_data[key]!));

    return out;
  }

  String _generateIdWithTimeStamp() =>
      DateTime.now().millisecondsSinceEpoch.toString();

  /// This function is to help convert json data into the
  /// store specific model.
  final T Function(Map<String, dynamic> json) serializer;

  /// Database namespace for the model.
  final String namespace;

  Store({required this.serializer, this.namespace = "Database!"});

  Future<void> initialize() async {
    await GetStorage.init(namespace);
    _data = Map<String, Map<String, dynamic>>.from(
        GetStorage(namespace).read(namespace) ?? {});
  }

  Future<void> _syncData() async {
    await GetStorage(namespace)
        .write(namespace, _data..removeWhere((key, value) => value == null));
  }
}
