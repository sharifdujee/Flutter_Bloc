import 'package:flutter/material.dart';
import 'package:flutter_roadmap/firebase_social_media/resource/color.dart';

class SocialMediaTextFormField extends StatelessWidget {
  SocialMediaTextFormField(
      {super.key,
      required this.myController,
      required this.focusNode,
      required this.onFieldSubmittedValue,
      required this.onValidator,
      required this.keyBoardType,
      required this.hint,
      required this.obscureText,
      this.enable = true,
      required this.autoFocus});
  final TextEditingController myController;
  final FocusNode focusNode;
  final FormFieldSetter onFieldSubmittedValue;
  final FormFieldValidator onValidator;
  final TextInputType keyBoardType;
  final String hint;
  final bool obscureText;
  final bool enable;
  final bool autoFocus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: myController,
        obscureText: obscureText,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmittedValue,
        validator: onValidator,
        keyboardType: keyBoardType,
        style: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(fontSize: 19, height: 0),
        enabled: enable,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: const EdgeInsets.all(20),
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: AppColor.primaryTextTextColor, height: 0.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
                color: AppColor.textFieldDefaultBorderColor, width: 2),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: AppColor.secondaryColor, width: 2),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: AppColor.alertColor, width: 2),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
                color: AppColor.textFieldDefaultBorderColor, width: 2),
          ),
        ),
      ),
    );
  }
}
