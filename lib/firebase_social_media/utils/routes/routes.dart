import 'package:flutter/material.dart';
import 'package:flutter_roadmap/firebase_social_media/resource/components/social_media_round_button.dart';
import 'package:flutter_roadmap/firebase_social_media/utils/routes/route_name.dart';
import 'package:flutter_roadmap/firebase_social_media/view/dashboard/firsebase_social_media-dashboard.dart';
import 'package:flutter_roadmap/firebase_social_media/view/dashboard/forgot_password/social_media_forgotpassword_screen.dart';
import 'package:flutter_roadmap/firebase_social_media/view/social_media_sign_up_screen.dart';
import 'package:flutter_roadmap/firebase_social_media/view/socila_media_login_screen.dart';
import 'package:flutter_roadmap/firebase_social_media/view/splash_screen.dart';


class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
            builder: (_) => const SocialMediaSplashScreen());
      case RouteNames.roundButton:
        return MaterialPageRoute(
            builder: (_) =>  SocialMediaRoundButton(title: '', onPress: (){},));
      case RouteNames.loginScreen:
        return MaterialPageRoute(
            builder: (_) => const SocialMediaLoginScreen());
      case RouteNames.signUpScreen:
        return MaterialPageRoute(
            builder: (_) => const SocialMediaSignUpScreen());
      case RouteNames.dashboard:
        return MaterialPageRoute(
            builder: (_) => const SocialMediaDashBoard());
      case RouteNames.forgotPassword:
        return MaterialPageRoute(
            builder: (_) => const SocialMediaForgotPasswordScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
