import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
                    return LyrixViewModel();
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
      height: 100,
      child: Stack(children: [
        Positioned.fill(
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              child: Container()),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 190,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.2), Colors.black54]),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              color: Colors.amber,
              width: MediaQuery.of(context).size.width * 0.80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        "gsfgsdf",
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.white60,
                            fontSize: 18),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "16161",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ],
                  ),
                  Text(
                    "161616",
                    style: const TextStyle(color: Colors.white60, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
