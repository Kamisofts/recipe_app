
import 'package:recipe_app/core/utils/injections.dart'as di;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MainMethods {
  static Future<void> init() async {
    // init binding
    WidgetsFlutterBinding.ensureInitialized();




    // set the orientation to portrait only (there is no need for landscape)
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    await di.init();

  }
}
