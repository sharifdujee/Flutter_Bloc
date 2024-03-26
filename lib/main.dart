
import 'package:bloc_basic/bloc/favourite_app/favourite_app_bloc.dart';
import 'package:bloc_basic/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_basic/bloc/posts/posts_bloc.dart';
import 'package:bloc_basic/bloc/practice_counter/counter_bloc.dart';
import 'package:bloc_basic/bloc/switch_example/switch_bloc.dart';
import 'package:bloc_basic/bloc/todo/to_do_bloc.dart';
import 'package:bloc_basic/repository/favourite_repository.dart';
import 'package:bloc_basic/ui/counter/counter_screen.dart';
import 'package:bloc_basic/ui/favourite_app/favourite_app_screen.dart';
import 'package:bloc_basic/ui/image_picker/image_picker_screen.dart';
import 'package:bloc_basic/ui/posts/posts_screen.dart';
import 'package:bloc_basic/ui/practice/practice_counter_screen.dart';
import 'package:bloc_basic/ui/switch_example/switch_example_screen.dart';
import 'package:bloc_basic/ui/todo/to_do_screen.dart';
import 'package:bloc_basic/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_basic/utils/image_picker_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (_)=> ToDoBloc()),
        BlocProvider(create: (_)=> FavouriteBloc(FavouriteRepository())),
        BlocProvider(create: (_)=> PostBloc()),

        
      ],
      child: MaterialApp(
        title: 'Bloc Basics',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,

        ),
        home: const PostsScreen(),
      ),
    );

  }


}

