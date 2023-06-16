import 'package:bloc/bloc.dart';

class SwitchCubit extends Cubit<bool> {
  SwitchCubit() : super(true);

  void toggleSwitch() {
    emit(!state);
  }
}
