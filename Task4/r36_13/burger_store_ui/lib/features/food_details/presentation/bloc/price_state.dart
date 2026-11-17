class PriceState {
  final int counter;
  final double totalPrice;
  const PriceState({required this.counter, required this.totalPrice});
}

class PriceInitState extends PriceState {
  PriceInitState(double price) : super(counter: 1, totalPrice: price);
}
