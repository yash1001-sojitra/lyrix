part of 'musix_cubit.dart';

@immutable
abstract class MusixState {}

class MusixInitial extends MusixState {}

class MusixGet extends MusixState {
  final Song song;
  MusixGet({required this.song});
}

class MusixDetailsGet extends MusixState {
  final SongDetail songDetail;
  MusixDetailsGet({required this.songDetail});
}
