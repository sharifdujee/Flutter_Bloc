import 'package:flutter/material.dart';
import 'dart:math';

class LotteryScreen extends StatefulWidget {
  const LotteryScreen({super.key});

  @override
  State<LotteryScreen> createState() => _LotteryScreenState();
}

class _LotteryScreenState extends State<LotteryScreen> {
  Random random = Random();
  int x = 10;
  final int y = 5;
  int winningNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Lottery App',
          style: TextStyle(
            fontFamily: 'Pacifico',
          ),
        ),
      ),
      body: SafeArea(
        child: _lottery(),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () {
            //print(random.nextInt(15).toString());
            winningNumber = random.nextInt(6);
            setState(() {});
            //print(winningNumber);
            //x++;
            /* setState(() {

            });*/
            //print('the value of x is $x');
            //print('summation of x and y is ${x+y}');
          }),
    );
  }

  /*Widget _test() {
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            'the value of x ${x}',
            style: const TextStyle(fontSize: 50),
          ),
        ),
      ],
    ));
  }*/

  Widget _lottery() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
            child: Text('The Winning Number is ${winningNumber.toString()}')),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
              color: winningNumber ==5? Colors.teal: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10)),
          height: 250,
          width: 300,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: winningNumber == 5
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        Icons.done_all,
                        color: Colors.green,
                        size: 55,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Congratulations Bro! You have win the the lottery, Your Number is $winningNumber',
                        textAlign: TextAlign.center,
                      )
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 55,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Better Luck Next Time, Your Number is $winningNumber \ntry again',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
          ),
        )
        /*Text(winningNumber > 5
            ? 'x is greater than 5'
            : winningNumber.toString()),*/
      ],
    );
  }
}
