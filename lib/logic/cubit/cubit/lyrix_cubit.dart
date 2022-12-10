import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'lyrix_state.dart';

class LyrixCubit extends Cubit<LyrixState> {
  LyrixCubit() : super(LyrixInitial());
}
