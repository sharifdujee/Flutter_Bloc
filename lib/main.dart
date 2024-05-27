import 'package:flutter/material.dart';
import 'package:news_apps/view/splash_screen.dart';

void main() {
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

        // ** Api Key : ffb1b40693b041929efdeaf2f781c15e
        // EveryThing https://newsapi.org/v2/everything?q=bitcoin&apiKey=ffb1b40693b041929efdeaf2f781c15e
        // Top Headline: https://newsapi.org/v2/top-headlines?country=us&apiKey=ffb1b40693b041929efdeaf2f781c15e

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}


