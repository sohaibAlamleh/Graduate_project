class  BoatItemModel{
  String ? name,desc,image,image1,image2,image3;

  BoatItemModel(this.name,this.desc,this.image,this.image1,this.image2,this.image3);

  BoatItemModel.fromJson(Map<dynamic,dynamic> map){
    // ignore: unnecessary_null_comparison
    if(map == null){
      return ;
    }else{
      name=map['Name'];
      image=map['Image'];
      desc=map['Desc'];
      image1=map['image1'];
      image2=map['image2'];
      image3=map['image3'];
    }
    toJson(){
      return {
        'Name':name,
        'Image':image,
        'Desc':desc,
        'image1':image1,
        'image2':image2,
        'image3':image3,
      };
    }

  }




}