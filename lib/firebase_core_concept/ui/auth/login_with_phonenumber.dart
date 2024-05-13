import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_roadmap/firebase_core_concept/ui/auth/verify_code.dart';
import 'package:flutter_roadmap/firebase_core_concept/utils/utils.dart';
import 'package:flutter_roadmap/firebase_core_concept/widgets/round_button.dart';
class LoginWithPhoneNumberScreen extends StatefulWidget {
  const LoginWithPhoneNumberScreen({super.key});

  @override
  State<LoginWithPhoneNumberScreen> createState() => _LoginWithPhoneNumberScreenState();
}

class _LoginWithPhoneNumberScreenState extends State<LoginWithPhoneNumberScreen> {
  final phoneNumberController = TextEditingController();
  bool loading = false;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login with phone number'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: '+123456'
              ),

            ),
            const SizedBox(
              height: 80,
            ),
            RoundButton(title: 'Login', loading: loading, onTap: (){
              setState(() {
                loading = true;
              });
              _auth.verifyPhoneNumber(
                phoneNumber: phoneNumberController.text,
                  verificationCompleted: (_){
                  setState(() {
                    loading = false;
                  });

                  },
                  verificationFailed: (e){
                  setState(() {
                    loading = false;
                  });
                  Utils.toastMessage(e.toString());
                  },
                  codeSent: (String verificationId, int? token ){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>  VerificationCodeScreen(verificationId: verificationId,)));
                  setState(() {
                    loading = false;
                  });


                  },
                  codeAutoRetrievalTimeout: (e){
                  setState(() {
                    loading = false;
                  });
                  Utils.toastMessage(e.toString());
                  });

            })

          ],
        ),
      ),
    );
  }
}
