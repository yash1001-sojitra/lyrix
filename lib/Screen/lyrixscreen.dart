import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../logic/connectivity_bloc/connectivity_bloc.dart';
import '../logic/cubit/lyrix_cubit/lyrix_cubit.dart';
import '../logic/cubit/musix_cubit/musix_cubit.dart';

class LyrixScreen extends StatelessWidget {
  final String trackId;
  LyrixScreen({required this.trackId, super.key});

  final ConnectedBloc connectedBloc = ConnectedBloc();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MusixCubit>(context).fetchSongDetail(trackId);
    BlocProvider.of<LyrixCubit>(context).fetchSongLyrics(trackId);

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
        body: Container(
          margin: const EdgeInsets.all(10),
          child: BlocProvider(
            create: (context) => ConnectedBloc(),
            child: BlocBuilder<ConnectedBloc, ConnectedState>(
              builder: (context, state) {
                if (state is ConnectedFailureState) {
                  return Center(
                    child: Lottie.asset("assets/json/nointernetcon.json"),
                  );
                }

                return SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocBuilder<MusixCubit, MusixState>(
                          builder: (context, state) {
                            if (state is! MusixDetailsGet) {
                              return Center(
                                child: Lottie.asset(
                                    "assets/json/lodingtrans.json",
                                    height: 50),
                              );
                            }
                            final songDeatail = state.songDetail;
                            return Column(
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Name',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              songDeatail.message!.body!.track!
                                                  .trackName
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.pinkAccent),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              'Artist',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              songDeatail.message!.body!.track!
                                                  .artistName
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.pinkAccent),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              'Album Name',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              songDeatail.message!.body!.track!
                                                  .albumName
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.pinkAccent),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              'Explicit',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              songDeatail.message!.body!.track!
                                                  .explicit
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.pinkAccent),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              'Rating',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              songDeatail.message!.body!.track!
                                                  .trackRating
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.pinkAccent),
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
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            );
                          },
                        ),
                        Card(
                          child: BlocBuilder<LyrixCubit, LyrixState>(
                            builder: (context, state) {
                              if (state is! Lyrixget) {
                                return Center(
                                  child: Container(),
                                );
                              }
                              final songLyrics = state.songLyrics;
                              return Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  songLyrics.message!.body!.lyrics!.lyricsBody
                                      .toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ]),
                );
              },
            ),
          ),
        ));
  }
}
