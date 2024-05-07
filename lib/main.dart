import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_roadmap/REST_APIs/get_Api/drop_down_api.dart';
import 'package:flutter_roadmap/REST_APIs/post_api/sign_up_screen.dart';
import 'package:flutter_roadmap/REST_APIs/rest_api_home_screen.dart';
import 'package:flutter_roadmap/basics/calcultor_app/calculator_screen.dart';
import 'package:flutter_roadmap/basics/calcultor_app/components/check_component.dart';
import 'package:flutter_roadmap/basics/navigation/home_screen.dart';
import 'package:flutter_roadmap/basics/navigation/screen_three.dart';
import 'package:flutter_roadmap/basics/navigation/screen_two.dart';
import 'package:flutter_roadmap/basics/ui/badges_screen.dart';
import 'package:flutter_roadmap/basics/ui/login_screen.dart';
import 'package:flutter_roadmap/basics/ui/my_app_screen.dart';
import 'package:flutter_roadmap/basics/ui/my_gp.dart';
import 'package:flutter_roadmap/basics/ui/text_read_more.dart';
import 'package:flutter_roadmap/basics/ui/time_picker.dart';
import 'package:flutter_roadmap/basics/ui/whatsapp_home.dart';
import 'package:flutter_roadmap/basics/ui/whatsapp_ui.dart';
import 'package:flutter_roadmap/coivd_tracker_apps/splash_screen.dart';
import 'package:flutter_roadmap/firebase_core_concept/ui/firbase_splash_screen.dart';
import 'package:flutter_roadmap/firebase_options.dart';

import 'package:flutter_roadmap/lottery_app/lottery_screen.dart';
import 'package:flutter_roadmap/multi_role_apps/multi_role_home_screen.dart';
import 'package:flutter_roadmap/multi_role_apps/splash_screen.dart';
import 'package:flutter_roadmap/navigation_routing/navigation_home_screen.dart';
import 'package:flutter_roadmap/navigation_routing/navigation_screen-two.dart';
import 'package:flutter_roadmap/navigation_routing/navigation_screen_one.dart';
import 'package:flutter_roadmap/navigation_routing/routes.dart';
import 'package:flutter_roadmap/top_10_widgets/Columns_practice.dart';
import 'package:flutter_roadmap/top_10_widgets/circular_avatar_practice.dart';
import 'package:flutter_roadmap/top_10_widgets/container.dart';
import 'package:flutter_roadmap/top_10_widgets/expande_practice.dart';
import 'package:flutter_roadmap/top_10_widgets/practice_list_tile.dart';
import 'package:flutter_roadmap/top_10_widgets/rich_text_practice.dart';
import 'package:flutter_roadmap/top_10_widgets/text_form_field_practice.dart';

import 'navigation_routing/route_names.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  // print('Hello World');
  /// Int Data Type
  /*int numberOne = 20;
  int numberTwo = 30;
  int add = (numberOne + numberTwo);
  int sub = (numberOne - numberTwo);
  int mul = (numberOne * numberTwo);
  double div = (numberOne / numberTwo);
  */ /*print(numberOne);
  print(numberTwo);*/ /*
  print(add);
  print(sub);
  print(mul);
  print(div.ceil());*/
  /// String Data Type
  /*String a = '20';
  String name = 'Research Hacks Subscribe Now';
  print(a);
  print(name.length);
  print(name[5]);
  print(name.substring(0, 8));
  print(name.replaceAll('s', '*'));*/

  /// Conditional Statements

  /*const int numberOne = 50;
  int numberTwo = 30;
  //numberOne = 10;
  if (numberOne > numberTwo) {
    print('Yes');
  } else {
    print(numberTwo);
  }*/
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FireBaseSplashScreen(),
      //initialRoute: RouteName.homeScreen,
     //onGenerateRoute: Routes.generateRoute,
     /* initialRoute: NavigationHomeScreen.routeName,
      routes: {
        NavigationHomeScreen.routeName: (context) => const NavigationHomeScreen(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        MultiRolesAppsHomeScreen.routeName: (context) => const MultiRolesAppsHomeScreen(),
        CheckComponentScreen.routeName: (context)=> const CheckComponentScreen(),
        CalculatorApps.routeName: (context) => const CalculatorApps(),
        BadgesScreen.routeName: (context) => const BadgesScreen(),
        TextMoreReadScreen.routeName: (context) => const TextMoreReadScreen(),
        WhatsAppsUIDesign.routeName: (context) => const WhatsAppsUIDesign(),
        CreateHomeScreen.routeName: (context) => const CreateHomeScreen(),
        ScreenTwo.routeName: (context) => const ScreenTwo(),
        ScreenThree.routeName: (context) => const ScreenThree(),
        NavigationScreenOne.routeName: (context) => const NavigationScreenOne(),
        NavigationScreenOne.routeName: (context) => const NavigationScreenOne(),
        NavigationScreenTwo.routeName: (context) => const NavigationScreenTwo()

      },*/
    );
  }
}
