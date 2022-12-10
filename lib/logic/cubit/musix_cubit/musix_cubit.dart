import 'package:bloc/bloc.dart';
import 'package:lyrix/data/data_provider.dart';
import 'package:lyrix/logic/modules/details_model.dart';
import 'package:lyrix/logic/modules/song_model.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'musix_state.dart';

class MusixCubit extends Cubit<MusixState> {
  final DataProvider dataProvider;
  MusixCubit({required this.dataProvider}) : super(MusixInitial());

  void fetchSong() {
    // ignore: avoid_types_as_parameter_names
    dataProvider.fetchSongs().then((song) {
      emit(MusixGet(song: song));
    });
  }

  void fetchSongDetail(trackId) {
    dataProvider.fetchSongByTrackID(trackId).then((songDetail) {
      emit(MusixDetailsGet(songDetail: songDetail));
    });
  }
}
