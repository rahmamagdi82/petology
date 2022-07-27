class InformationModel
{
  String? email;
  String? phone;
  String? location;
  String? location2;
  InformationModel();
  InformationModel.fromJson(Map<String,dynamic> json)
  {
    email=json['email'];
    phone=json['phone'];
    location=json['location'];
    location2=json['location2'];

  }
}