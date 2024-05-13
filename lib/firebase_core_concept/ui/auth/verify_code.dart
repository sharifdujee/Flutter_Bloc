import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_roadmap/firebase_core_concept/ui/posts/post_screen.dart';
import 'package:flutter_roadmap/firebase_core_concept/utils/utils.dart';
import 'package:flutter_roadmap/firebase_core_concept/widgets/round_button.dart';

class VerificationCodeScreen extends StatefulWidget {
  final String verificationId;
  const VerificationCodeScreen({Key? key, required this.verificationId})
      : super(key: key);

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  bool loading = false;
  final verifyCodeController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verification Code'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            TextFormField(
              controller: verifyCodeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: '6 digit code'),
            ),
            const SizedBox(
              height: 80,
            ),
            RoundButton(
                title: 'Verify',
                loading: loading,
                onTap: ()  async{
                  setState(() {
                    loading = true;
                  });
                  final credential = PhoneAuthProvider.credential(
                      verificationId: widget.verificationId,
                      smsCode: verifyCodeController.text.toString());
                  try{
                    await _auth.signInWithCredential(credential);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const FireBasePostScreen()));


                  }
                  catch(e){
                    setState(() {
                      loading = false;
                    });
                    Utils.toastMessage(e.toString());
                  }
                })
          ],
        ),
      ),
    );
  }
}
