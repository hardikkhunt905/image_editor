import 'package:image_editor/Constants/preferences.dart';


Future<void> logout() async{
  // Get.offAllNamed(Routes.loginScreen);
  await Preferences.clearAllPrefs();
}
