import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:pin_code_fields/pin_code_fields.dart';

class BadgesScreen extends StatefulWidget {
  static const String routeName = '/badge';
  const BadgesScreen({super.key});

  @override
  State<BadgesScreen> createState() => _BadgesScreenState();
}

class _BadgesScreenState extends State<BadgesScreen> {
  get appContext => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        actions: [
          Column(
            children: [
              Center(
                child: badges.Badge(
                  badgeContent: const Text('5'),
                  position: badges.BadgePosition.topEnd(top: -10, end: -10),
                  showBadge: true,
                  badgeAnimation: const badges.BadgeAnimation.rotation(
                      animationDuration: Duration(seconds: 2),
                      loopAnimation: false,
                      curve: Curves.fastOutSlowIn,
                      colorChangeAnimationCurve: Curves.easeInOut),
                  badgeStyle: badges.BadgeStyle(
                    shape: badges.BadgeShape.circle,
                    badgeColor: Colors.greenAccent,
                    padding: const EdgeInsets.all(5),
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                    badgeGradient: const badges.BadgeGradient.linear(colors: [
                      Colors.red,
                      Colors.greenAccent,
                      Colors.deepOrange
                    ]),
                    borderGradient: const badges.BadgeGradient.linear(
                        colors: [Colors.teal, Colors.cyan],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                    elevation: 0,
                  ),
                  child: const Icon(Icons.add_shopping_cart),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 30,
          ),
          Column(
            children: [
              Center(
                child: badges.Badge(
                  badgeContent: const Text('9'),
                  position: badges.BadgePosition.topEnd(top: -10, end: -10),
                  showBadge: true,
                  badgeAnimation: const badges.BadgeAnimation.rotation(
                      animationDuration: Duration(seconds: 2),
                      loopAnimation: false,
                      curve: Curves.fastOutSlowIn,
                      colorChangeAnimationCurve: Curves.easeInOut),
                  badgeStyle: badges.BadgeStyle(
                    shape: badges.BadgeShape.circle,
                    badgeColor: Colors.greenAccent,
                    padding: const EdgeInsets.all(5),
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                    badgeGradient: const badges.BadgeGradient.linear(colors: [
                      Colors.red,
                      Colors.greenAccent,
                      Colors.deepOrange
                    ]),
                    borderGradient: const badges.BadgeGradient.linear(
                        colors: [Colors.teal, Colors.cyan],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                    elevation: 0,
                  ),
                  child: const Icon(Icons.message),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 30,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _pinCodeText(),
            _rotatedAnimationTextKit(),
            const Divider(
              height: 5,
              color: Colors.transparent,
            ),
            _fadeAnimationText(),
            const Divider(
              height: 5,
              color: Colors.transparent,
            ),
            _typeAnimatedText(),
            const Divider(
              height: 5,
              color: Colors.transparent,
            ),
            _typeWriterText(),
            const Divider(
              height: 5,
              color: Colors.transparent,
            ),
            _scaleAnimatedText(),
            const Divider(
              color: Colors.transparent,
              height: 5,
            ),
            _colorizeAnimatedText(),
            const Divider(
              color: Colors.transparent,
              height: 5,
            ),
            _textLiquidFillAnimatedText(),
            const Divider(
              color: Colors.transparent,
              height: 5,
            ),
            _wavyAnimatedText(),
            const Divider(
              color: Colors.transparent,
              height: 5,
            ),
            _flickerAnimatedText(),


          ],
        ),
      ),
    );
  }

  Widget _pinCodeText() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: PinCodeTextField(
            animationCurve: Curves.decelerate,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            backgroundColor: Colors.transparent,
            keyboardType: TextInputType.number,
            appContext: context,
            length: 6,
            obscureText: true,
            obscuringCharacter: 'x',
            enablePinAutofill: true,
            enabled: true,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(10),
              fieldHeight: 50,
              fieldWidth: 50,
              activeColor: Colors.teal,
              activeFillColor: Colors.yellow,
              selectedColor: Colors.green,
              selectedFillColor: Colors.green,
              inactiveColor: Colors.red,
              inactiveFillColor: Colors.red,
              borderWidth: 5,
              activeBorderWidth: 3,
            ),
            animationDuration: const Duration(seconds: 5),
            animationType: AnimationType.slide,
          ),
        )
      ],
    );
  }

  Widget _rotatedAnimationTextKit() {
    return Container(
      decoration: const BoxDecoration(color: Colors.deepOrange),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 100,
            width: 20,
          ),
          const Text(
            'Be',
            style: TextStyle(fontSize: 40),
          ),
          DefaultTextStyle(
              style: const TextStyle(
                fontSize: 40,
                fontFamily: 'Horizon',
              ),
              child: AnimatedTextKit(animatedTexts: [
                RotateAnimatedText('Positive'),
                RotateAnimatedText('Optimistic'),
                RotateAnimatedText('Different'),
              ]))
        ],
      ),
    );
  }

  Widget _fadeAnimationText() {
    return SizedBox(
      width: 250,
      child: DefaultTextStyle(
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          child: AnimatedTextKit(animatedTexts: [
            FadeAnimatedText('DO IT!'),
            FadeAnimatedText('DO IT RIGHT!'),
            FadeAnimatedText('DO IT RIGHT NOW!')
          ])),
    );
  }

  Widget _typeAnimatedText() {
    return SizedBox(
      width: 250,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 30,
          fontFamily: 'Bobbers',
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText('it is not enough to do you'),
            TyperAnimatedText('it is must  to do'),
            TyperAnimatedText('and then do your best'),
            TyperAnimatedText('- W.Edwards Deming')
          ],
          onTap: () {
            print('ok');
          },
        ),
      ),
    );
  }

  Widget _typeWriterText() {
    return SizedBox(
      width: 250,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 30,
          fontFamily: 'Agne',
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText('Discipline is the best tool'),
            TypewriterAnimatedText('Design first, then code'),
            TypewriterAnimatedText('Do not patch bugs out, rewrite them'),
            TypewriterAnimatedText('Do not test bugs out, design them out'),
          ],
          onTap: () {
            print('ok');
          },
        ),
      ),
    );
  }
  Widget _scaleAnimatedText(){
    return SizedBox(
      width: 250.0,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 70.0,
          fontFamily: 'Canterbury',
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            ScaleAnimatedText('Think'),
            ScaleAnimatedText('Build'),
            ScaleAnimatedText('Ship'),
          ],
          onTap: () {
            print("Tap Event");
          },
        ),
      ),
    );
  }
  Widget _colorizeAnimatedText(){
    const colorizeColors = [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 50.0,
      fontFamily: 'Horizon',
    );

    return SizedBox(
      width: 250.0,
      child: AnimatedTextKit(
        animatedTexts: [
          ColorizeAnimatedText(
            'Larry Page',
            textStyle: colorizeTextStyle,
            colors: colorizeColors,
          ),
          ColorizeAnimatedText(
            'Bill Gates',
            textStyle: colorizeTextStyle,
            colors: colorizeColors,
          ),
          ColorizeAnimatedText(
            'Steve Jobs',
            textStyle: colorizeTextStyle,
            colors: colorizeColors,
          ),
        ],
        isRepeatingAnimation: true,
        onTap: () {
          print("Tap Event");
        },
      ),
    );
  }

  Widget _textLiquidFillAnimatedText(){
    return SizedBox(
      width: 250.0,
      child: TextLiquidFill(
        text: 'LIQUIDY',
        waveColor: Colors.blueAccent,
        boxBackgroundColor: Colors.redAccent,
        textStyle: TextStyle(
          fontSize: 80.0,
          fontWeight: FontWeight.bold,
        ),
        boxHeight: 300.0,
      ),
    );
  }

  Widget _wavyAnimatedText(){
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 20.0,
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          WavyAnimatedText('Hello World'),
          WavyAnimatedText('Look at the waves'),
        ],
        isRepeatingAnimation: true,
        onTap: () {
          print("Tap Event");
        },
      ),
    );
  }
  Widget _flickerAnimatedText(){
    return SizedBox(
      width: 250.0,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 35,
          color: Colors.white,
          shadows: [
            Shadow(
              blurRadius: 7.0,
              color: Colors.white,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            FlickerAnimatedText('Flicker Frenzy'),
            FlickerAnimatedText('Night Vibes On'),
            FlickerAnimatedText("C'est La Vie !"),
          ],
          onTap: () {
            print("Tap Event");
          },
        ),
      ),
    );
  }
}
