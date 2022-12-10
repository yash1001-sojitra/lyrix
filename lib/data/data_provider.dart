import 'dart:async';
import 'package:lyrix/logic/modules/details_model.dart';
import 'package:lyrix/logic/modules/lyrix_model.dart';
import 'package:lyrix/logic/modules/song_model.dart';

import 'dio/dio.dart';

class DataProvider {
  final DioClient dioClient;

  DataProvider({required this.dioClient});

  Future<Song> fetchSongs() async {
    final songRaw = await dioClient.fetchSong();
    return songRaw;
  }

  Future<SongDetail> fetchSongByTrackID(trackID) async {
    final songByIDRaw = await dioClient.fetchSongByTrackID(trackID);
    return songByIDRaw;
  }

  Future<SongLyrics> fetchSongLyricsByTrackID(trackID) async {
    final songLyricsByIDRaw = await dioClient.fetchSongLyricsByTrackID(trackID);
    return songLyricsByIDRaw;
  }
}
