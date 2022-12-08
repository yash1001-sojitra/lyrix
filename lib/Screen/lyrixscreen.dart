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
        backgroundColor: const Color(0xff1a1a1a),
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
                children: [
                  Card(
                    shadowColor: Colors.black,
                    color: Colors.white,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, top: 10, bottom: 10),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Name',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 20),
                              ),
                              Text(
                                "Song details",
                                style: TextStyle(color: Colors.pinkAccent),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Artist',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 20),
                              ),
                              Text(
                                "Artist name",
                                style: TextStyle(color: Colors.pinkAccent),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Album Name',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 20),
                              ),
                              Text(
                                "Album Name",
                                style: TextStyle(color: Colors.pinkAccent),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Explicit',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 20),
                              ),
                              Text(
                                "Explicit",
                                style: TextStyle(color: Colors.pinkAccent),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Rating',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 20),
                              ),
                              Text(
                                "Rating",
                                style: TextStyle(color: Colors.pinkAccent),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Lyrics',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                        color: Colors.white),
                  ),
                ],
              )
            ]),
          ),
        ));
  }
}
