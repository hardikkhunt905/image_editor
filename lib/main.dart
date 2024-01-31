import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'Constants/Utils/utils.dart';
import 'Constants/constants.dart';
import 'GetxBinding/binding.dart';
import 'Routing/pages.dart';
import 'Ui/Splash/splash_screen.dart';
import 'Values/values.dart';
import 'themes/theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

void Function()? onInitMain(BuildContext context){
  MediaQuery.sizeOf(context).width > 450
      ? Utils.isTablet = true
      : Utils.isTablet = false;
  Debug.setLog('is tablate : ${Utils.isTablet}');
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ScreenUtilInit(
      ensureScreenSize: true,
      designSize: appScreenSize,
      builder: (BuildContext context, Widget? homeChild) => ValueListenableBuilder(
          valueListenable: Utils.appLocal,
          builder: (BuildContext context,Locale value, Widget? child) => GetMaterialApp(
              initialBinding: Binding(),
              navigatorKey: navigatorKey,
              title: MyString.appName,
              //theme
              theme:Get.isDarkMode ? CustomThemes.darkTheme : CustomThemes.lightTheme,
              home: homeChild,
              scrollBehavior: MyCustomScrollBehavior(),
              getPages: Pages.pages,
              onInit: () => onInitMain(context),
              debugShowCheckedModeBanner: false,
              defaultTransition: Transition.cupertino,
              fallbackLocale: const Locale('en', 'US'),
            ),
        ),
      child: const SplashScreen(),
    );

}
