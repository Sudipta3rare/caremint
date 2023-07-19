import 'package:get/get.dart';

class SignUpController extends GetxController {

  List<String> toggleButtonString = ["Provider","Customer"];
  RxInt tabTextIndexSelected = 0.obs;
  RxBool isLoading = false.obs;
  toggle(int index) => tabTextIndexSelected.value = index;
  String dropdownValueCategory= 'Category';
  String dropdownValuePackage= 'Package';
  List<String> listOfCategory = ['Ceramic Coating', 'Deep Cleaning', 'Exterior + Interior Service', 'Exterior Service', 'Interior Service','Monthly Subscription'];
  List<String> listOfPackage = ['Silver','Gold','Platinum','Titanium'];
}