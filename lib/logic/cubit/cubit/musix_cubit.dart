import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'musix_state.dart';

class MusixCubit extends Cubit<MusixState> {
  MusixCubit() : super(MusixInitial());
}
