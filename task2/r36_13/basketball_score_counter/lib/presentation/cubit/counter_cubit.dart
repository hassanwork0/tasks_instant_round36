import 'package:basketball_score_counter/presentation/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class counterCubit extends Cubit<counterState> {
  counterCubit() : super(counterInitState());

  void incrementA(int counterA) {
    final listA = state.stackA;
    listA.add(state.counterA + counterA);
    final moveA = state.moves;
    moveA.add("A");
    emit(
      counterState(
        counterA: state.counterA + counterA,
        counterB: state.counterB,
        stackA: listA,
        stackB: state.stackB,
        moves: moveA,
      ),
    );
  }

  void incrementB(int counterB) {
    final listB = state.stackB;
    listB.add(state.counterB + counterB);
    final moveB = state.moves;
    moveB.add("B");
    emit(
      counterState(
        counterA: state.counterA,
        counterB: state.counterB + counterB,
        stackB: listB,
        stackA: state.stackA,
        moves: moveB,
      ),
    );
  }

  void reset() {
    emit(counterInitState());
  }

  void undo() {
    if (state.moves.isEmpty) return;

    final moves = List<String>.from(state.moves)..removeLast();
    final stackA = List<int>.from(state.stackA);
    final stackB = List<int>.from(state.stackB);
    final lastMove = state.moves.last;

    if (lastMove == "A") {
      stackA.removeLast();
      emit(
        counterState(
          counterA: stackA.isEmpty ? 0 : stackA.last,
          counterB: state.counterB,
          stackA: stackA,
          stackB: stackB,
          moves: moves,
        ),
      );
    } else {
      stackB.removeLast();
      emit(
        counterState(
          counterA: state.counterA,
          counterB: stackB.isEmpty ? 0 : stackB.last,
          stackA: stackA,
          stackB: stackB,
          moves: moves,
        ),
      );
    }
  }
}
