import 'package:flutter/material.dart';
import 'package:image_editor/Elements/Widgets/toast.dart';
import 'package:image_editor/Values/values.dart';
import 'package:get/get.dart';

import '../../Constants/constants.dart';
import '../../Constants/preferences.dart';
import '../../Routing/Routes.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  bool isInternet = false;

  @override
  void initState() {
    super.initState();
    _toHomeScreen();
  }

  Future<void> _toHomeScreen() async {
    await Future.delayed(const Duration(seconds: 5), () async => Get.offNamed(Routes.homeScreen));
  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 5000),
    vsync: this,
  )..repeat(reverse: false);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      body: Center(
        child: FadeTransition(
            opacity: _animation,
            child: Image.asset(
              ImagePath.appLogo,
              height: screenHeightOrg/3,
            )),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

