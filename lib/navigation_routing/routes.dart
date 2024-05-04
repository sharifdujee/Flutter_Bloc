import 'package:flutter/material.dart';
import 'package:flutter_roadmap/navigation_routing/navigation_home_screen.dart';
import 'package:flutter_roadmap/navigation_routing/navigation_screen-two.dart';
import 'package:flutter_roadmap/navigation_routing/navigation_screen_one.dart';
import 'package:flutter_roadmap/navigation_routing/route_names.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.homeScreen:
        return MaterialPageRoute(
            builder: (context) => const NavigationHomeScreen());
      case RouteName.screenOne:
        return MaterialPageRoute(
            builder: (context) => const NavigationScreenOne());
      case RouteName.screenTwo:
        return MaterialPageRoute(
            builder: (context) =>  NavigationScreenTwo(data: settings.arguments as Map,));
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(child: Text('No route define')),
          );
        });
    }
  }
}
