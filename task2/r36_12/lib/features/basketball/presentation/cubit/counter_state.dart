part of 'counter_cubit.dart';

class CounterState {
  final int counterA;
  final int counterB;

  const CounterState({required this.counterA, required this.counterB});
}

class CounterInitialState extends CounterState {
  CounterInitialState() : super(counterA: 0, counterB: 0);
}
