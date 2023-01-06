class TableModel{
  String ? name;


  TableModel(this.name);


  TableModel.fromJson(Map<dynamic,dynamic> map){
    // ignore: unnecessary_null_comparison
    if(map == null){
      return ;
    }else{
      name=map['Name'];

    }
    toJson(){
      return {
        'Name':name,
      };
    }

  }

}