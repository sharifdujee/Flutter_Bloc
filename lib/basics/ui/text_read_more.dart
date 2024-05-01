import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class TextMoreReadScreen extends StatefulWidget {
  static const String routeName = '/read_more';
  const TextMoreReadScreen({super.key});

  @override
  State<TextMoreReadScreen> createState() => _TextMoreReadScreenState();
}

class _TextMoreReadScreenState extends State<TextMoreReadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Read More'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
              child: ReadMoreText(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                trimLines: 2,
                trimMode: TrimMode.Line,
                colorClickableText: Colors.green,
                trimCollapsedText: 'Show Details',
                trimExpandedText: 'Less',

                annotations: [
                  Annotation(
                      regExp: RegExp('r #[a-zA-Z0-9] +@'),
                      spanBuilder: (
                              {required String text, TextStyle? textStyle}) =>
                          TextSpan(
                            text: text,
                            style: textStyle?.copyWith(color: Colors.blue),
                          )),
                  Annotation(
                    regExp: RegExp(r'<@(\d+)>'),
                    spanBuilder: ({required String text, TextStyle? textStyle}) => TextSpan(
                      text: 'User123',
                      style: textStyle?.copyWith(color: Colors.green),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        // Handle tap, e.g., navigate to a user profile
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
