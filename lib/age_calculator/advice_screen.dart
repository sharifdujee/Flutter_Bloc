import 'package:flutter/material.dart';
import 'package:flutter_roadmap/age_calculator/common_health_advice/general_advice.dart';
import 'package:flutter_roadmap/age_calculator/common_health_advice/government_service.dart';
import 'package:flutter_roadmap/age_calculator/common_health_advice/mental_health_advice.dart';
import 'package:flutter_roadmap/age_calculator/common_health_advice/physical_health_advice.dart';
import 'package:flutter_roadmap/age_calculator/utils/text_style.dart';
class AdviceScreen extends StatefulWidget {
  const AdviceScreen({super.key});

  @override
  State<AdviceScreen> createState() => _AdviceScreenState();
}

class _AdviceScreenState extends State<AdviceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('age'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PsychologicalAdvice(adviceCategory: 'Mental Health', content: Column(
                  children: [
                    Text('data', style: contentStyle,),
                    Text('data'),
                    Text('data')
                  ],
                )),
                PhysicalHealthAdvice(adviceCategory: 'Physical Health', content: Column(
                  children: [
                    Text('data', style: contentStyle,),
                    Text('data'),
                    Text('data')

                  ],
                ))

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GeneralAdvice(adviceCategory: 'General Advice', content: Column(
                  children: [
                    Text('data', style: contentStyle,),
                    Text('data'),
                    Text('data')

                  ],
                )),
                GovernmentService(adviceCategory: 'Government Service', content: Column(
                  children: [
                    Text('Health Service', style: contentStyle,),
                    Text('data'),
                    Text('data'),

                    Text('Education Service', style: contentStyle,),
                    Text('data'),
                    Text('data'),
                    Text('Social Security Service', style: contentStyle,),
                    Text('data'),
                    Text('data'),

                  ],
                )),
              ],

            )
          ],
        ),


      ),
    );
  }
}
