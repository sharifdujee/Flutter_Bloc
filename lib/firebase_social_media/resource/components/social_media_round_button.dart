import 'package:flutter/material.dart';
import 'package:flutter_roadmap/firebase_social_media/resource/color.dart';

class SocialMediaRoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final Color color;
  final Color textColor;
  final bool loading;
  const SocialMediaRoundButton(
      {super.key,
      required this.title,
      required this.onPress,
      this.color = AppColor.primaryColor,
      this.textColor = AppColor.whiteColor,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading? null : onPress,
      child: Container(
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(50)),
        height: 50,
        width: double.infinity,
        child: loading? Center(
          child: CircularProgressIndicator(
            color: Colors.white,

          ),
        ): Center(
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(fontSize: 16, color: textColor),
            ))
        /*,*/
      ),
    );
  }
}
