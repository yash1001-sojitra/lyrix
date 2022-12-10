// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:lyrix/Screen/lyrixscreen.dart';
import 'package:lyrix/data/data_provider.dart';
import 'package:lyrix/data/dio/dio.dart';


import '../logic/connectivity_bloc/connectivity_bloc.dart';
import '../logic/cubit/lyrix_cubit/lyrix_cubit.dart';
import '../logic/cubit/musix_cubit/musix_cubit.dart';
import 'drawer.dart';

class Homescreen extends StatelessWidget {
  Homescreen({Key? key}) : super(key: key);

  final style = const TextStyle(fontSize: 20);
  final ConnectedBloc isconnected = ConnectedBloc();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MusixCubit>(context).fetchSong();

    return Scaffold(
        drawerEnableOpenDragGesture: true,
        backgroundColor: const Color(0xff1a1a1a),
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
        body: BlocProvider(
          create: (context) => ConnectedBloc(),
          child: BlocBuilder<ConnectedBloc, ConnectedState>(
              builder: (context, state) {
            if (state is ConnectedFailureState) {
              return Center(
                  child: Lottie.asset("assets/json/nointernetcon.json"));
            }
            return BlocBuilder<MusixCubit, MusixState>(
              builder: (context, state) {
                if (state is! MusixGet) {
                  return Center(
                    child: Lottie.asset("assets/json/lodingtrans.json",
                        height: 50),
                  );
                }
                final song = state.song;
                return Container(
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
                            itemCount: song.message!.body!.trackList!.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: (() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MultiBlocProvider(
                                            providers: [
                                              BlocProvider(
                                                create: (context) => MusixCubit(
                                                  dataProvider: DataProvider(
                                                    dioClient: DioClient(),
                                                  ),
                                                ),
                                              ),
                                              BlocProvider(
                                                create: (context) => LyrixCubit(
                                                  dataProvider: DataProvider(
                                                    dioClient: DioClient(),
                                                  ),
                                                ),
                                              ),
                                            ],
                                            child: LyrixScreen(
                                              trackId: song
                                                  .message!
                                                  .body!
                                                  .trackList![index]
                                                  .track!
                                                  .trackId
                                                  .toString(),
                                            ),
                                          ),
                                        ));
                                  }),
                                  child: LyrixViewModel(
                                      songtitle: song.message!.body!
                                          .trackList![index].track!.trackName
                                          .toString(),
                                      artistname: song.message!.body!
                                          .trackList![index].track!.artistName
                                          .toString(),
                                      albumname: song.message!.body!
                                          .trackList![index].track!.albumName
                                          .toString()));
                            }),
                      ),
                    ],
                  ),
                );
              },
            );
          }),
        ));
  }
}

class LyrixViewModel extends StatelessWidget {
  String songtitle;
  String artistname;
  String albumname;
  LyrixViewModel(
      {required this.songtitle,
      required this.artistname,
      required this.albumname,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
      child: Card(
        child: ListTile(
          leading: const Icon(
            Icons.music_note,
            size: 30,
            color: Colors.pink,
          ),
          title: Text(songtitle),
          trailing: Text(artistname),
          subtitle: Text(
            albumname,
            style: const TextStyle(color: Colors.pinkAccent),
          ),
        ),
      ),
    );
  }
}
