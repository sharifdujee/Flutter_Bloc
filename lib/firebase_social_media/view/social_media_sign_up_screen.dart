import 'package:flutter/material.dart';
import 'package:flutter_roadmap/firebase_social_media/resource/components/social_media_textField.dart';
import 'package:flutter_roadmap/firebase_social_media/resource/components/social_media_round_button.dart';
import 'package:flutter_roadmap/firebase_social_media/utils/routes/route_name.dart';
import 'package:flutter_roadmap/firebase_social_media/utils/utils.dart';
import 'package:flutter_roadmap/firebase_social_media/view_model/signup/signup_controller.dart';
import 'package:provider/provider.dart';

class SocialMediaSignUpScreen extends StatefulWidget {
  const SocialMediaSignUpScreen({super.key});

  @override
  State<SocialMediaSignUpScreen> createState() =>
      _SocialMediaSignUpScreenState();
}

class _SocialMediaSignUpScreenState extends State<SocialMediaSignUpScreen> {
  final userNameController = TextEditingController();
  final userFocusNode = FocusNode();
  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userNameController.dispose();
    userFocusNode.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ChangeNotifierProvider(
              create: (_) => SignUpController(),
              child: Consumer<SignUpController>(
                builder: (context, provider, child) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height * .01,
                        ),
                        Text(
                          'Welcome to App',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text(
                          'Enter your email address\n to register  your account',
                          style: Theme.of(context).textTheme.subtitle1,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: height * .01,
                        ),
                        Form(
                            key: _formKey,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: height * .06, bottom: height * 0.01),
                              child: Column(
                                children: [
                                  SocialMediaTextFormField(
                                      myController: userNameController,
                                      focusNode: userFocusNode,
                                      onFieldSubmittedValue: (value) {
                                        Utils.fieldFocus(context,
                                            emailFocusNode, passwordFocusNode);
                                      },
                                      onValidator: (value) {
                                        return value.isEmpty
                                            ? 'enter user name'
                                            : null;
                                      },
                                      keyBoardType: TextInputType.text,
                                      hint: 'User name',
                                      obscureText: false,
                                      enable: true,
                                      autoFocus: true),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  SocialMediaTextFormField(
                                      myController: emailController,
                                      focusNode: emailFocusNode,
                                      onFieldSubmittedValue: (value) {},
                                      onValidator: (value) {
                                        return value.isEmpty
                                            ? 'enter email'
                                            : null;
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
                                      onFieldSubmittedValue: (value) {},
                                      onValidator: (value) {
                                        return value.isEmpty
                                            ? 'enter password'
                                            : null;
                                      },
                                      keyBoardType: TextInputType.emailAddress,
                                      hint: 'Password',
                                      obscureText: true,
                                      enable: true,
                                      autoFocus: true),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        /* Align(
                  alignment: Alignment.centerRight,
                  child: Text('Forgot password',
                      style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 15, decoration: TextDecoration.underline)
                  ),
                ),*/
                        const SizedBox(
                          height: 40,
                        ),
                        SocialMediaRoundButton(
                          title: 'SignUp',
                          loading: provider.loading,
                          onPress: () {
                            if (_formKey.currentState!.validate()) {
                              provider.signup(
                                  context,
                                  userNameController.text,
                                  emailController.text,
                                  passwordController.text);
                            }
                          },
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteNames.loginScreen);
                          },
                          child: Text.rich(TextSpan(
                              text: "Already  have a account? ",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(fontSize: 15),
                              children: [
                                TextSpan(
                                    text: 'Sign In',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .copyWith(
                                            fontSize: 15,
                                            decoration:
                                                TextDecoration.underline)),
                              ])),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )),
      ),
    );
  }
}
