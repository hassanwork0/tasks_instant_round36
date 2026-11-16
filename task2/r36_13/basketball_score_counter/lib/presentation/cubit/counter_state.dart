class counterState {
  final int counterA;
  final int counterB;
  final List<int> stackA;
  final List<int> stackB;
  final List<String> moves;
  const counterState({required this.counterA, required this.counterB, required this.stackA, required this.stackB, required this.moves});
}

class counterInitState extends counterState {
  counterInitState() : super(counterA: 0, counterB: 0 , stackA: [] , stackB: [] ,moves:[] );
}
