import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lyrix/Screen/storescreen.dart';

class Drawerbtn extends StatelessWidget {
  const Drawerbtn({Key? key}) : super(key: key);
  final style = const TextStyle(fontSize: 24);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.25,
      child: Drawer(
        backgroundColor: const Color(0xff1a1a1a),
        child: Column(
          children: <Widget>[
            SizedBox(
                height: 130,
                child: DrawerHeader(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.music_note,
                          size: 50,
                          color: Colors.pink,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Lyrix",
                          style: TextStyle(fontSize: 30, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                )),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StoreScreen(),
                  ),
                );
              },
              child: Text(
                'Bookmark',
                style: GoogleFonts.playfairDisplay(
                    textStyle: style,
                    letterSpacing: 3,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              color: Colors.white24,
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Setting',
                style: GoogleFonts.playfairDisplay(
                    textStyle: style,
                    letterSpacing: 3,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              color: Colors.white24,
            ),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 65,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                child: const Center(
                  child: Text(
                    'v1.0.0',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 20,
                      color: Color(0xffffffff),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
