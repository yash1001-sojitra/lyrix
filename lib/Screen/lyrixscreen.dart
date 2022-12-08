import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LyrixScreen extends StatefulWidget {
  const LyrixScreen({super.key});

  @override
  State<LyrixScreen> createState() => _LyrixScreenState();
}

class _LyrixScreenState extends State<LyrixScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            "Details",
            style: TextStyle(
                letterSpacing: 1,
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w400),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(color: Color(0xff1a1a1a)),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Name',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Song details",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Artist',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Artist name",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Album Name',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Album Name",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Explicit',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Explicit",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Rating',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Rating",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Lyrics',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ]),
          ),
        ));
  }
}
