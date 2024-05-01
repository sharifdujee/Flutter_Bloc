import 'package:flutter/material.dart';
import 'package:flutter_roadmap/basics/ui/whatsapp_home.dart';
import 'package:flutter_roadmap/multi_role_apps/multi_role_home_screen.dart';
import 'package:flutter_roadmap/multi_role_apps/student_screen.dart';
import 'package:flutter_roadmap/multi_role_apps/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MultiRoleAppsLoginScreen extends StatefulWidget {
  const MultiRoleAppsLoginScreen({super.key});

  @override
  State<MultiRoleAppsLoginScreen> createState() =>
      _MultiRoleAppsLoginScreenState();
}

class _MultiRoleAppsLoginScreenState extends State<MultiRoleAppsLoginScreen> {
  final formData = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Signup Screen'),

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email'
              ),


            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: 'Password'
              ),


            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Age'
              ),


            ),
            DropdownButton <String>(items: <String>['student', 'teacher', 'admin'].map((String value){
              return DropdownMenuItem<String>(
                value:  value,
                  child: Text(value));
            }).toList(),
                onChanged: (_){}),
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
                sp.setString('email', emailController.text.toString());
                sp.setString('age', ageController.text.toString());
                // admin, student, teacher
                sp.setString('userType', 'teacher');
                sp.setBool('isLogin', true);
                if(sp.getString('userType') == 'teacher'){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const TeacherScreen()));

                }
                else if(sp.getString('userType') == 'student'){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const StudentScreen()));

                }
                else{
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
                }




              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.green,
                child: Center(
                  child: Text('Signup'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _add(){
    int x = 10;
    int y = 20;
    print(x+y);
  }

  // Future Function
Future<void> _sharif() async{
   await  Future.delayed(Duration(seconds: 3));
    print('delayed');

}
}
