import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NewsDetailsScreen extends StatefulWidget {
  final String newsImage;
  final String newsTitle;
  final String newsDate;
  final String author;
  final String description;
  final String content;
  final String source;
  const NewsDetailsScreen(
      {super.key,
      required this.newsImage,
      required this.newsTitle,
      required this.newsDate,
      required this.author,
      required this.description,
      required this.content,
      required this.source});

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    final format = DateFormat('MMMM dd , yyyy');
    DateTime dateTime = DateTime.parse(widget.newsDate);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children : [
          SizedBox(
            height: height * .45,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(40)),
              child: CachedNetworkImage(imageUrl: widget.newsImage,
              fit: BoxFit.cover,
              placeholder: (context, url) => CircularProgressIndicator(),),
            ),
          ),
          Container(
            height: height * .6,
            margin: EdgeInsets.only(top: height * .4),
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(30),
              topLeft: Radius.circular(40))
            ),
            child: ListView(
              children: [
                Text(widget.newsTitle, style: GoogleFonts.poppins(fontSize:20, color:Colors.black87, fontWeight: FontWeight.w700),),
                SizedBox(
                  height:  height * 0.02,
                ),
                Row(
                  children: [
                    Expanded(child: Text(widget.source,style: GoogleFonts.poppins(fontSize:13, color:Colors.black87, fontWeight: FontWeight.w600 ), )),
                    Text(format.format(dateTime),style: GoogleFonts.poppins(fontSize:12, color:Colors.black87, fontWeight: FontWeight.w500 ), ),
                  ],
                ),
                SizedBox(
                  height: height * .03,
                ),
                Text(widget.description,style: GoogleFonts.poppins(fontSize:13, color:Colors.black54, fontWeight: FontWeight.w500 ), )
              ],
            ),
          )
          
        ]
        
      ),
    );
  }
}
