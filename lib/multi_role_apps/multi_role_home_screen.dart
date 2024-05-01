import 'package:flutter/material.dart';
import 'package:flutter_roadmap/multi_role_apps/mult_role_apps_login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MultiRolesAppsHomeScreen extends StatefulWidget {
  static String routeName = '/mHome';
  const MultiRolesAppsHomeScreen({super.key});

  @override
  State<MultiRolesAppsHomeScreen> createState() => _MultiRolesAppsHomeScreenState();
}

class _MultiRolesAppsHomeScreenState extends State<MultiRolesAppsHomeScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  String email = '';
  String age = '';
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();

  }

  _loadData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    email = sharedPreferences.getString('email')??'';
    age = sharedPreferences.getString('age')??'';
    setState(() {

    });

  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Email'),
                Text(email.toString()),

              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('age'),
                Text(age.toString()),

              ],
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: ()  async{
                /*SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString('name', 'Md Sharif Hossain');
                sp.setInt('age', 10);
                sp.setBool('isLogin', false);
                print(sp.get('name'));
                print('the age is ${sp.getInt('age').toString()}');
                print(sp.getBool('isLogin'));
                sp.remove('name');
                print(sp.getString('name'));*/
                SharedPreferences sp = await  SharedPreferences.getInstance();
               sp.clear();
               Navigator.push(context, MaterialPageRoute(builder: (context)=> const MultiRoleAppsLoginScreen()));



              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.green,
                child: Center(
                  child: Text('Logout'),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
