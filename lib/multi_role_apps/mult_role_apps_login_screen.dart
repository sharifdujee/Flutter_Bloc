import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_roadmap/basics/calcultor_app/calculator_screen.dart';
import 'package:flutter_roadmap/basics/calcultor_app/constants.dart';
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
  String _userType = 'Select the user type';
  var userList = ['student', 'teacher', 'admin'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Signup Screen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 110),
                    child: Image(image: NetworkImage('https://images.pexels.com/photos/1462980/pexels-photo-1462980.jpeg?auto=compress&cs=tinysrgb&w=600',
        
        
                    ),
                    fit: BoxFit.fill,
                    height: 150,
                    width: 150,),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(hintText: 'Email',
                  labelText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: greenColor,
                          width: 2
                      )
                  ),),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                decoration:  InputDecoration(hintText: 'Password',
                  labelText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: greenColor,
                          width: 2
                      )
                  ),),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Age',
                  labelText: 'Age',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: greenColor,
                      width: 2
                    )
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              /*const DropDownTextField(dropDownList: [
                DropDownValueModel(name: 'student', value: 'student'),
                DropDownValueModel(name: 'teacher', value: 'teacher'),
                DropDownValueModel(name: 'admin', value: 'admin'),
              ]),*/
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  border: Border(
                    
        
                  ),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: DropdownButton(
                    value: _userType,
                    items: [
                      const DropdownMenuItem(
                        value: 'Select the user type',
                        child: Text('Select the user type'),
                      ),
                      ...userList.map((String userType) {
                        return DropdownMenuItem(
                          value: userType,
                          child: Text(userType),
                        );
                      }).toList(),
                    ],
                    onChanged: (String? selectedUserType) {
                      setState(() {
                        _userType = selectedUserType!;
                      });
                    },
                  ),
                ),
              ),
        
        
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () async {
                  /*SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString('name', 'Md Sharif Hossain');
                  sp.setInt('age', 10);
                  sp.setBool('isLogin', false);
                  print(sp.get('name'));
                  print('the age is ${sp.getInt('age').toString()}');
                  print(sp.getBool('isLogin'));
                  sp.remove('name');
                  print(sp.getString('name'));*/
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString('email', emailController.text.toString());
                  sp.setString('age', ageController.text.toString());
                  // admin, student, teacher
                  sp.setString('userType', _userType.toString());
                  //sp.setString('userType', 'teacher');
                  sp.setBool('isLogin', true);
                  if (sp.getString('userType') == 'teacher') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TeacherScreen()));
                  } else if (sp.getString('userType') == 'student') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StudentScreen()));
        
                  }
            else if (sp.getString('userType') == 'admin') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MultiRolesAppsHomeScreen()));
                  }
                  else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CalculatorApps()));
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
      ),
    );
  }

  void _add() {
    int x = 10;
    int y = 20;
    print(x + y);
  }

  // Future Function
  Future<void> _sharif() async {
    await Future.delayed(Duration(seconds: 3));
    print('delayed');
  }
}
