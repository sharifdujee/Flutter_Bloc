import 'package:flutter/material.dart';
class PracticeRichText extends StatefulWidget {
  const PracticeRichText({super.key});

  @override
  State<PracticeRichText> createState() => _PracticeRichTextState();
}

class _PracticeRichTextState extends State<PracticeRichText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  const Text('Rich Text'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Center(
           child: RichText(
            text: TextSpan(
              text: 'Dont Have a account?',
            style: Theme.of(context).textTheme.bodyMedium
                ,
              children:  const [
                TextSpan(
                  text: 'Sign Up',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    decoration: TextDecoration.underline
                  )
                )
              ]

            )),
         ),
]
      ),
    );
  }
}
