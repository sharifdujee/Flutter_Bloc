import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SVGPictureScreen extends StatefulWidget {
  const SVGPictureScreen({super.key});

  @override
  State<SVGPictureScreen> createState() => _SVGPictureScreenState();
}

class _SVGPictureScreenState extends State<SVGPictureScreen> {
  final String assetName = 'assets/images/img.svg';
  late Widget svg;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    svg = SvgPicture.asset(assetName,
    semanticsLabel: 'Acme logo',
     // colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Flutter SVG'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: svg,
            ),
            _customSvgImage(),
          ],
        ),
      ),
    );
  }

Widget _customSvgImage(){
    const assetName = 'assets/images/up-arrow.svg';
    return Center(
      child: svg = SvgPicture.asset(assetName,
      semanticsLabel: 'Red over Flow',
      colorFilter: const ColorFilter.mode(Colors.green, BlendMode.srcIn,
      ),      )

    );
}
}
