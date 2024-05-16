
import 'package:flutter/material.dart';
import 'package:flutter_roadmap/firebase_social_media/resource/components/social_media_textField.dart';
import 'package:flutter_roadmap/firebase_social_media/resource/components/social_media_round_button.dart';
import 'package:flutter_roadmap/firebase_social_media/utils/routes/route_name.dart';
import 'package:flutter_roadmap/firebase_social_media/view_model/forgot_password/forgotpassword_controller.dart';
import 'package:flutter_roadmap/firebase_social_media/view_model/login/login_controller.dart';
import 'package:provider/provider.dart';



class SocialMediaForgotPasswordScreen extends StatefulWidget {
  const SocialMediaForgotPasswordScreen({super.key});

  @override
  State<SocialMediaForgotPasswordScreen> createState() => _SocialMediaForgotPasswordScreenState();
}

class _SocialMediaForgotPasswordScreenState extends State<SocialMediaForgotPasswordScreen> {

  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    emailFocusNode.dispose();

  }

  @override
  Widget build(BuildContext context) {
    final height =  MediaQuery.of(context).size.height*1;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,

      ),

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
                Text('Forgot password', style: Theme.of(context).textTheme.headline3,),
                Text('Enter your email address\n to recover  your password', style: Theme.of(context).textTheme.subtitle1,
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


                        ],
                      ),
                    )),



                SizedBox(
                  height: 20,
                ),
                /*Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: (){

                    },

                  ),
                ),*/
                const SizedBox(
                  height: 40,
                ),
                ChangeNotifierProvider(create: (_) => ForgotPasswordController(),
                  child: Consumer<ForgotPasswordController>(
                    builder: (context, provider, child){
                      return  SocialMediaRoundButton(
                        title: 'Recover',
                        loading: provider.loading,
                        onPress: () {
                          if(_formKey.currentState!.validate()){
                            provider.forgotPassword(context, emailController.text);
                          }
                        /*  if(_formKey.currentState!.validate()){
                            provider.login(context, emailController.text, passwordController.text);

                          }*/
                        },
                      );
                    },
                  ),),


                SizedBox(
                  height: height * 0.03,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
