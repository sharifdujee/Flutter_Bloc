import 'package:flutter/material.dart';
import 'package:flutter_roadmap/multi_role_apps/mult_role_apps_login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  String email = '';
  String age = '';
  String type = '';
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();

  }

  _loadData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    email = sharedPreferences.getString('email')??'';
    age = sharedPreferences.getString('age')??'';
    type = sharedPreferences.getString('userType')??'';
    setState(() {

    });

  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Student Screen'),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Category'),
                Text(type.toString()),

              ],
            ),
            const SizedBox(
              height: 10,
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
