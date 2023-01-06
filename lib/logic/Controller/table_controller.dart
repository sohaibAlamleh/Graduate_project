import 'package:boat_rent_project/logic/model/table_modle.dart';
import 'package:boat_rent_project/services/table_services.dart';
import 'package:get/get.dart';

class TableController extends GetxController {
  List<TableModel> get tableModel => _tableModel;
  List<TableModel> _tableModel = [];

  TableController() {
    getTable();
  }

  getTable() async {
    // _lodaing.value=true;
    TableServices().getTable().then((value) {
      for (int i = 0; i < value.length; i++) {
        _tableModel
            .add(TableModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        print(_tableModel.length);
      }
      update();
    });
  }
}
