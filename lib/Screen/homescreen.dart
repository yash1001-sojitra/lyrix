import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lyrix/Screen/lyrixscreen.dart';

import 'drawer.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final style = const TextStyle(fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(builder: (context) {
          return IconButton(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
              height: 22,
              width: 30,
              color: Colors.white,
            ),
            onPressed: () {},
          );
        }),
        elevation: 0,
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: SvgPicture.asset(
                    "assets/icons/drawer.svg",
                    height: 30,
                    width: 35,
                    color: Colors.white,
                  ));
            },
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(color: Color(0xff1a1a1a)),
        ),
      ),
      drawer: const Drawerbtn(),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Container(
              height: 70,
              decoration: const BoxDecoration(
                color: Color(0xff1a1a1a),
              ),
              child: SizedBox(
                height: 50,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: Text(
                        "Trending",
                        style: GoogleFonts.playfairDisplay(
                            textStyle: style,
                            letterSpacing: 1,
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 50,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LyrixScreen()));
                        }),
                        child: const LyrixViewModel());
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class LyrixViewModel extends StatelessWidget {
  const LyrixViewModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
      child: const Card(
        child: ListTile(
          leading: Icon(
            Icons.music_note,
            size: 30,
            color: Colors.pink,
          ),
          title: Text("music title"),
          trailing: Text("music"),
          subtitle: Text(
            "music subtitle",
            style: TextStyle(color: Colors.pinkAccent),
          ),
        ),
      ),
    );
  }
}
