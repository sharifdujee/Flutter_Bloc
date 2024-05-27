import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_roadmap/age_calculator/age_screen.dart';

import 'package:flutter_roadmap/firebase_messaging/view/chat_splash.dart';
import 'package:flutter_roadmap/firebase_notification/notification_home_screen.dart';
import 'package:flutter_roadmap/firebase_options.dart';
import 'package:flutter_roadmap/google_map/convert_latlang_to_address.dart';
import 'package:flutter_roadmap/google_map/custom_info_window.dart';
import 'package:flutter_roadmap/google_map/custom_marker.dart';
import 'package:flutter_roadmap/google_map/get_user_current_location.dart';
import 'package:flutter_roadmap/google_map/google_map_theme.dart';
import 'package:flutter_roadmap/google_map/map_home_screen.dart';
import 'package:flutter_roadmap/google_map/network_image_marker_screen.dart';
import 'package:flutter_roadmap/google_map/polygone_screen.dart';
import 'package:flutter_roadmap/google_map/polyline_screen.dart';
import 'package:flutter_roadmap/google_map/search_place.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firbaseMessagingBackgroundHandler);

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
@pragma('vm:entry-point')
Future<void> _firbaseMessagingBackgroundHandler(RemoteMessage message) async{
  await Firebase.initializeApp();
  print(message.notification!.title.toString());
  print(message.notification!.body.toString());
  print(message.data.toString());

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
        //primarySwatch: AppColor.primaryMaterialColor,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          //color: AppColor.whiteColor,
          centerTitle: true,
        ),
        textTheme: const TextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CustomMapTheme (),
      //home : const CalculateAgeScreen
      //Work for Home
      /* initialRoute: RouteNames.splashScreen,
      onGenerateRoute: Routes.generateRoute,*/
      //initialRoute: RouteName.homeScreen,*/
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

///
/// live chat apps
/*

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
 SharedPreferences prefs = await SharedPreferences.getInstance();




  runApp( MyApp(prefs: prefs,));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
   MyApp({super.key, required this.prefs});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProviders>(
            create: (_) => AuthProviders(
                firebaseFirestore: firebaseFirestore,
                prefs: prefs,
                googleSignIn: GoogleSignIn(),
                firebaseAuth: FirebaseAuth.instance)),
        Provider<ProfileProvider>(
            create: (_) => ProfileProvider(
                prefs: prefs,
                firebaseFirestore: firebaseFirestore,
                firebaseStorage: firebaseStorage)),
        Provider<HomeProvider>(
            create: (_) => HomeProvider(firebaseFirestore: firebaseFirestore)),
        Provider<ChatProvider>(
            create: (_) => ChatProvider(
                prefs: prefs,
                firebaseStorage: firebaseStorage,
                firebaseFirestore: firebaseFirestore))
      ],
child: MaterialApp(
home: SplashScreen)


          );
  }
}


 */
