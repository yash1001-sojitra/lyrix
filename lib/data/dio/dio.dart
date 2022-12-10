import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:lyrix/logic/modules/details_model.dart';
import 'package:lyrix/logic/modules/lyrix_model.dart';
import 'package:lyrix/logic/modules/song_model.dart';

class DioClient {
  final Dio dio = Dio();
  static const baseURL =
      "https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=";
  final String apiKey = "ee0f6a4795cedfbfd76e220df5767936";

  Future<Song> fetchSong() async {
    try {
      final response = await dio.get(baseURL + apiKey);
      final jsonR = jsonDecode(response.data);
      return Song.fromJson(jsonR);
    } on DioError {
      throw Exception('Failed to load');
    }
  }

  Future<SongDetail> fetchSongByTrackID(trackID) async {
    final url =
        "https://api.musixmatch.com/ws/1.1/track.get?track_id=$trackID&apikey=$apiKey";
    try {
      final response = await dio.get(url);
      final jsonR = jsonDecode(response.data);
      return SongDetail.fromJson(jsonR);
    } on DioError {
      throw Exception('Failed News By Category');
    }
  }

  Future<SongLyrics> fetchSongLyricsByTrackID(trackID) async {
    final url =
        "https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$trackID&apikey=$apiKey";
    try {
      final response = await dio.get(url);
      final jsonR = jsonDecode(response.data);
      return SongLyrics.fromJson(jsonR);
    } on DioError {
      throw Exception('Failed News By Category');
    }
  }
}
