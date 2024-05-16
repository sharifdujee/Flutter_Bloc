
import 'package:flutter/material.dart';
import 'package:flutter_roadmap/firebase_social_media/resource/components/social_media_textField.dart';
import 'package:flutter_roadmap/firebase_social_media/resource/components/social_media_round_button.dart';
import 'package:flutter_roadmap/firebase_social_media/utils/routes/route_name.dart';
import 'package:flutter_roadmap/firebase_social_media/view_model/login/login_controller.dart';
import 'package:provider/provider.dart';



class SocialMediaLoginScreen extends StatefulWidget {
  const SocialMediaLoginScreen({super.key});

  @override
  State<SocialMediaLoginScreen> createState() => _SocialMediaLoginScreenState();
}

class _SocialMediaLoginScreenState extends State<SocialMediaLoginScreen> {

  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height =  MediaQuery.of(context).size.height*1;

    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height* .01,
                ),
                Text('Welcome to App', style: Theme.of(context).textTheme.headline3,),
                Text('Enter your email address\n to connect to your account', style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.center,),
                SizedBox(
                  height: height* .01,
                ),
                Form(
                  key: _formKey,
                    child: Padding(
                      padding:  EdgeInsets.only(top: height * .06, bottom: height * 0.01),
                      child: Column(
                        children: [
                          SocialMediaTextFormField(myController: emailController,

                              focusNode: emailFocusNode,
                              onFieldSubmittedValue: (value){

                              },
                              onValidator: (value){
                                return value.isEmpty? 'enter email': null;

                              },
                              keyBoardType: TextInputType.emailAddress,
                              hint: 'Email',
                              obscureText: false,
                              enable: true,
                              autoFocus: true),
                           SizedBox(
                            height: height * 0.01,
                          ),
                          SocialMediaTextFormField(

                              myController: passwordController,
                              focusNode: passwordFocusNode,
                              onFieldSubmittedValue: (value){

                              },
                              onValidator: (value){
                                return value.isEmpty? 'enter password': null;

                              },
                              keyBoardType: TextInputType.emailAddress,
                              hint: 'Password',
                              obscureText: false,
                              enable: true,
                              autoFocus: true),

                        ],
                      ),
                    )),



                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, RouteNames.forgotPassword);

                    },
                    child: Text('Forgot password?',
                    style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 15, decoration: TextDecoration.underline)
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
               ChangeNotifierProvider(create: (_) => LoginController(),
               child: Consumer<LoginController>(
                 builder: (context, provider, child){
                   return  SocialMediaRoundButton(
                     title: 'Login',
                     loading: provider.loading,
                     onPress: () {
                       if(_formKey.currentState!.validate()){
                         provider.login(context, emailController.text, passwordController.text);

                       }
                     },
                   );
                 },
               ),),


                SizedBox(
                  height: height * 0.03,
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, RouteNames.signUpScreen);
                  },
                  child: Text.rich(
                    TextSpan(
                      text: "Don't have a account? ",
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 15),
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: Theme.of(context).textTheme.headline2!.copyWith(fontSize:15 ,
                          decoration: TextDecoration.underline)
                        ),

                      ]
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
