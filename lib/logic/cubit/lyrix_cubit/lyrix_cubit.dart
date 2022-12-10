import 'package:bloc/bloc.dart' show Cubit;
import 'package:lyrix/data/data_provider.dart';
import 'package:lyrix/logic/modules/lyrix_model.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'lyrix_state.dart';

class LyrixCubit extends Cubit<LyrixState> {
  final DataProvider dataProvider;
  LyrixCubit({required this.dataProvider}) : super(LyrixInitial());
  void fetchSongLyrics(trackId) {
    dataProvider.fetchSongLyricsByTrackID(trackId).then((songLyrix) {
      emit(Lyrixget(songLyrics: songLyrix));
    });
  }
}
