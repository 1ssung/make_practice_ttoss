import 'package:fast_app_base/common/util/local_json.dart';
import 'package:fast_app_base/screen/main/tab/stock/vo_simple_stock.dart';
import 'package:get/get.dart';

class SearchStockData extends GetxController {
  List<SimpleStock> stocks = [];

  //화면에 자동으로 갱신되는 리스트를 표현하기 위한 리스트 RxList
  RxList<String> serchHistoryList = <String>[].obs;
  RxList<SimpleStock> autoCompleteList = <SimpleStock>[].obs;

  //GetxController가 최초에 호출이 될때에 생성되는 함수.
  @override
  void inInit() {
    serchHistoryList.addAll(['삼성전자', 'LG전자', '현대차', '넷플릭스']);
    loadLocalStockJson();

    super.onInit();
  }

  Future<void> loadLocalStockJson() async {
    final jsonList =
        await LocalJson.getObjectList<SimpleStock>('stock_list.json');
    stocks.addAll(jsonList);
  }
}
