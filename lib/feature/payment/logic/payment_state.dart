
abstract class KashierState {}

class KashierInitial extends KashierState {}

class KashierLoading extends KashierState {}

class KashierSuccess extends KashierState {
  final String checkoutUrl;
  KashierSuccess(this.checkoutUrl);
}

class KashierError extends KashierState {
  final String message;
  KashierError(this.message);
}
