class FirstSectionModel
{
    String? title;
    String? body;
  FirstSectionModel();
  FirstSectionModel.fromJson(Map<String,dynamic> json)
  {
    title=json['title'];
    body=json['body'];
  }
}