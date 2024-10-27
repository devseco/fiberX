import 'package:fiber/config/constant.dart';

class SetDataController extends GetxController {
  RxInt left = 59.obs;
  Rx<int> indexPage = 0.obs;
  Rx<int> page = 0.obs;
  Rx<int> selectIndex = 0.obs;
  Rx<int> selectProduct = 0.obs;
  Rx<int> count = 1.obs;
  Rx<double> height = 100.0.obs;
  RxBool isDark = false.obs;
  PageController pagesController = PageController();
}
