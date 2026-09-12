import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitialState());
  final List<CounterState> history = [];

  void incrementA(int counterA) {
    history.add(state);
    emit(
      CounterState(
        counterA: state.counterA + counterA,
        counterB: state.counterB,
      ),
    );
  }

  void incrementB(int counterB) {
    history.add(state);

    emit(
      CounterState(
        counterA: state.counterA,
        counterB: state.counterB + counterB,
      ),
    );
  }

  void undo() {
    if (history.isNotEmpty) {
      emit(history.removeLast());
    }
  }

  void reset() {
    history.add(state);

    emit(CounterInitialState());
  }
}
