import 'package:bloc/bloc.dart';

class LogCubit extends Cubit<List<String>> {
  LogCubit() : super([]);

  void addLog(String log) {
    state.add(log);
    emit(state);
  }
}
