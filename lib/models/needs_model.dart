class NeedsModel
{
  List<Data> date=[];
  NeedsModel();
   NeedsModel.fromJson(List json)
  {
    json.forEach((element) {
      date.add(Data.fromJson(element));
    });


  }
}
class Data
{
  String? title;
  String? imageUrl;
  Data.fromJson(Map<String, dynamic> json){
    title=json['title'];
    imageUrl=json['imageUrl'];
  }
}