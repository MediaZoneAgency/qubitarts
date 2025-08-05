import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qubitarts/feature/payment/logic/payment_state.dart';

import '../data/model/payment_model.dart';
import '../data/repo/payment_repo.dart';


class KashierCubit extends Cubit<KashierState> {
  final KashierRepository repository;

  KashierCubit(this.repository) : super(KashierInitial());

  Future<void> createCheckout(KashierPaymentRequest request) async {
    emit(KashierLoading());
    try {
      final url = await repository.createPaymentSession(request);
      emit(KashierSuccess(url));
    } catch (e) {
      emit(KashierError(e.toString()));
    }
  }
}
