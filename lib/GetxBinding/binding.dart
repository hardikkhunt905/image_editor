import 'package:image_editor/Ui/Home/Controller/home_controller.dart';
import 'package:get/get.dart';


class Binding extends Bindings {
  @override 
  void dependencies() { 
    // Get.lazyPut(() => HomeController());
    Get.put(() => HomeController());
  } 
}