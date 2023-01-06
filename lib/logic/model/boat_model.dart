class BoatModel {
  String? name;
  String? image, image1, image2, image3;
  String? desc;
  String? id;
  int? priceAdult, priceChild, pricekid;
  dynamic e = [];
  BoatModel(this.name, this.image, this.desc, this.id, this.image1, this.image2,
      this.image3, this.priceAdult, this.priceChild, this.pricekid, this.e);

  BoatModel.fromJson(Map<dynamic, dynamic> map) {
    // ignore: unnecessary_null_comparison
    if (map == null) {
      return;
    } else {
      name = map['Name'];
      image = map['Image'];
      desc = map['Desc'];
      // id=map['id'];
      image1 = map['images1'];
      image2 = map['images2'];
      image3 = map['images3'];
      priceAdult = map['price'];
      priceChild = map['price2'];
      pricekid = map['pricekid'];
      //e=map['id'];
    }
    toJson() {
      return {
        'Name': name,
        'Image': image,
        'Desc': desc,
        // 'id':id,
        'image1': image1,
        'image2': image2,
        'image3': image3,
        'price': priceAdult,
        'price2': priceChild,
        'pricekid': pricekid,
        // 'id':e
      };
    }
  }
}
