import 'package:boat_rent_project/logic/model/table_modle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'boat_controller.dart';
import '../model/boat_model.dart';

class BoatController extends GetxController {
  // TableModel model;
  // BoatController(this.model);

  // // =
  // FirebaseFirestore.instance.collection("$COLLECTION_NAME")
  // ValueNotifier<bool> get loding=>_loding;
  // ValueNotifier<bool> _loding=ValueNotifier(false);

  // final CollectionReference _collectionReference =
  //     FirebaseFirestore.instance.collection(s.val.);
  // late CollectionReference _collectionReference ;
  //List<BoatModel> get boatModel => boatModel;
  List<BoatModel> boatModel = [];

  List<BoatModel> _favoriteList = [];
  List<BoatModel> get favoriteList => _favoriteList;
  var storage = GetStorage();
  late final fireStore = FirebaseFirestore.instance;
  late String COLLECTION_NAME;
  late CollectionReference collectionReference;
  BoatController() {
    COLLECTION_NAME = "Hydro cycle";
    collectionReference =
        FirebaseFirestore.instance.collection(COLLECTION_NAME);

    // getBoat();
    List? storedShoppings = storage.read<List>('isFavourites');

    if (storedShoppings != null) {
      _favoriteList =
          storedShoppings.map((e) => BoatModel.fromJson(e)).toList();
      update();
    }

    // _collectionReference =
    //     FirebaseFirestore.instance.collection(s);
  }
  @override
  void onInit() {
    // TODO: implement onInit
    getBoat();
    COLLECTION_NAME = "Hydro cycle";
    collectionReference =
        FirebaseFirestore.instance.collection(COLLECTION_NAME);
    List? storedShoppings = storage.read<List>('isFavourites');

    if (storedShoppings != null) {
      _favoriteList =
          storedShoppings.map((name) => BoatModel.fromJson(name)).toList().obs;
      update();
    }

    super.onInit();
  }

  getBoat() async {
    //  _loding.value=true;
    collectionReference.get().then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        boatModel.add(
            BoatModel.fromJson(value.docs[i].data() as Map<dynamic, dynamic>));
        print(boatModel.length);
        //  _loding.value=true;
      }
      update();
    });
  }

  Future<void> manageFavorite(String prodectid) async {
    var existIndex =
        _favoriteList.indexWhere((element) => element.name == prodectid);
    print("///////////////////////////////");
    print(existIndex);
    if (existIndex >= 0) {
      _favoriteList.removeAt(existIndex);
      await storage.remove('isFavourites');
      update();
    } else {
      favoriteList
          .add(boatModel.firstWhere((element) => element.name == prodectid));

      await storage.write('isFavourites', favoriteList);
      update();
    }

//print(v);
  }

  bool isFavorite(String prodectid) {
    return favoriteList.any((element) => element.name == prodectid);
  }
}
