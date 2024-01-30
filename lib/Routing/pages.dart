import 'package:image_editor/Routing/Routes.dart';
import 'package:get/get.dart';
import '../Ui/Home/Component/home_screen.dart';

class Pages {
  Pages._();

  static final pages = [
    GetPage(name: Routes.homeScreen, page: () => HomeScreen(), popGesture: false),
    // GetPage(name: Routes.homeScreen, page: () => AdDemoScreen(), popGesture: false),
  ];
}
