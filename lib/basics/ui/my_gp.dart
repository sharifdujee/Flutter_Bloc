import 'package:flutter/material.dart';

class MyGPAPPsScreen extends StatefulWidget {
  const MyGPAPPsScreen({super.key});

  @override
  State<MyGPAPPsScreen> createState() => _MyGPAPPsScreenState();
}

class _MyGPAPPsScreenState extends State<MyGPAPPsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Everything in 1 app',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _backgroundImage(),
            const Divider(
              height: 5,
              color: Colors.transparent,
            ),
            _language(),
            const Divider(
              height: 5,
              color: Colors.transparent,
            ),
            _signInButton(),
            const Divider(
              height: 5,
              color: Colors.transparent,
            ),
            _guestUser(),
            const Divider(
              height: 5,
              color: Colors.transparent,
            ),
            _termsAndPrivacy(),
          ],
        ),
      ),
    );
  }

  Widget _backgroundImage() {
    return const Center(
      child: Image(image: AssetImage('assets/images/img.png')),
    );
  }

  Widget _language() {
    return Padding(
      padding: const EdgeInsets.only(left: 170, right: 100),
      child: Row(
        children: [
          Switch(value: false, onChanged: (bool? value) {}),
        ],
      ),
    );
  }

  Widget _signInButton() {
    return ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.phone_bluetooth_speaker_outlined),
        label: const Text('Sign In'));
  }

  Widget _guestUser() {
    return TextButton(onPressed: () {}, child: const Text('Use as Guest'));
  }

  Widget _termsAndPrivacy(){
    return Column(
      children: [
        const Text('By proceeding you agree to our'),
        TextButton(onPressed: (){}, child: const Text('Terms & Condition and Privacy Policy'))

      ],
    );
  }
}
