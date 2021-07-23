import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:whatsappclone/initialbindings.dart';
import 'package:whatsappclone/models/providers/user_provider.dart';
import 'package:whatsappclone/pages/camerascreen.dart';
import 'package:whatsappclone/pages/mywpstatus.dart';

import 'Pages/homepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]);
 // var modes = await FlutterDisplayMode.supported;
 
  await FlutterDisplayMode.setHighRefreshRate();
  //final DisplayMode m = await FlutterDisplayMode.preferred;
 // print(m);
  //run flutter app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //used getmaterial app for context less navigations
    return GetMaterialApp(
      title: 'Whatsapp Clone',
      debugShowCheckedModeBanner: false,
      //whatsapp specific color declaration
      theme: ThemeData(
          primaryColor: const Color(0xff075E54),
          colorScheme: ThemeData()
              .colorScheme
              .copyWith(secondary: const Color(0xff25D366))),
      //responsive framework for showing same design in al device
      builder: (context, widget) => ResponsiveWrapper.builder(widget,
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: false,
          breakpoints: [
            const ResponsiveBreakpoint.autoScale(480, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
      //call the api when app opened
      onInit: () async {
        await UserProvider().getUser();
      },
      getPages: [
        GetPage(name: "/", page: () => const HomePage()),
        GetPage(
          name: "/wpstatus",
          page: () => WPStatus(),
        ),
        GetPage(
            name: "/camera",
            page: () => const CameraScreen(),
            transition: Transition.leftToRight),
      ],
      //declare the dependency bindings here for initialize at start
      initialRoute: "/",
      //  home: const HomePage(),
      initialBinding: InitialBinding(),
    );
  }
}
