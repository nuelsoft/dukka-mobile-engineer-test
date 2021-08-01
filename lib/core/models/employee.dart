import 'dart:math';

import 'package:dukka/core/models/__base.dart';

class Employee extends Model {
  String? id;
  String? fullName;
  String? phone;
  String? email;
  String? position;
  String? salary;
  String? image;

  Employee.from(Map<String, dynamic> json)
      : id = json["id"],
        fullName = json["full_name"],
        phone = json["phone"],
        email = json["email"],
        position = json["position"],
        salary = json["salary"],
        image = json["image"];

  Map<String, dynamic> get json => {
        "id": id,
        "full_name": fullName,
        "phone": phone,
        "email": email,
        "position": position,
        "salary": salary,
        "image": image
      };

  Employee({bool generateRandomImage = true}) {
    image = generateRandomImage ? _randomImage() : null;
  }

  String _randomImage() {
    const List<String> images = [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFtSlXm-TVOBFUcz9Uj3xjGG1iaZ7WyoFu0kJaaYSNvLJg0xyk9bndM-AxHKndgaof3sE&usqp=CAU",
      "https://www.joancanto.com/wp-content/uploads/2017/04/H10B1582-Edit.jpg",
      "https://media.istockphoto.com/photos/young-woman-portrait-in-the-city-picture-id1009749608?k=6&m=1009749608&s=612x612&w=0&h=ckLkBgedCLmhG-TBvm48s6pc8kBfHt7Ppec13IgA6bo=",
      "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXwyMzQ5ODgwfHxlbnwwfHx8fA%3D%3D&w=1000&q=80",
      "https://c.wallhere.com/photos/db/86/Pawe_Paoro_Witkowski_portrait_display_women_portrait_looking_at_viewer_face_depth_of_field_brown_eyes-1459817.jpg!d"
    ];
    final _random = new Random();
    int randomIndex = _random.nextInt(images.length);

    return images[randomIndex];
  }
}
