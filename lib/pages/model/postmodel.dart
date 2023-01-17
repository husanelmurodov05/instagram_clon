class Post{
  String? image_url;
  String? caption;

  Post(this.image_url,this.caption);

Post.fromJson(Map<String,dynamic>json){
  image_url= json["image_url"];
  caption=json["caption"];
}
Map toJson(){
  return  {
    "image_url":image_url,
    "caption":caption,
  };
}
}