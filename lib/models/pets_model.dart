import 'package:petology/models/login_model.dart';

class ListPet
{
  List<Pet> date=[];
  ListPet();
  ListPet.fromJson(List json)
  {
    json.forEach((element) {
      date.add(Pet.fromJson(element));
    });
  }
}

class Pet
{
  late int id;
  String? name;
  String? phone;
  List<String> images=[];
  int? year;
  int? month;
  String? size;
  String? breed;
  bool? gender;
  String? hairLength;
  String? color;
  String? careBehavior;
  bool? houseTrained;
  String? description;
  String? location;
  bool? vaccinated;
  int? categoryId;
  int? userId;
  Map<String,dynamic>? user;
  String? category;

  Pet();
  Pet.fromJson(Map<String, dynamic> json){
    id=json['id'];
    name=json['name'];
    phone=json['phone'];
    year=json['year'];
    month=json['month'];
    size=json['size'];
    breed=json['breed'];
    gender=json['gender'];
    hairLength=json['hairLength'];
    color=json['color'];
    careBehavior=json['careBehavior'];
    houseTrained=json['houseTrained'];
    description=json['description'];
    location=json['location'];
    vaccinated=json['vaccinated'];
    categoryId=json['categoryId'];
    userId=json['userId'];
    category=json['category'];
    json['image'].forEach((element){
      images.add(element);
    });
    user={
      'fName':json['user']['firstName'],
      'lName' : json['user']['lastName'],
    };
  }
}