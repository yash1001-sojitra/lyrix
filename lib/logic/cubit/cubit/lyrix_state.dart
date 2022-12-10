part of 'lyrix_cubit.dart';

@immutable
abstract class LyrixState {}

class LyrixInitial extends LyrixState {}

class Lyrixget extends LyrixState {
  final SongLyrics songLyrics;
  Lyrixget({required this.songLyrics});
}
