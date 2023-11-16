import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsw_store/domain/usecases/order_usecase.dart';
import 'package:fsw_store/presentation/_blocs/order/order_events.dart';
import 'package:fsw_store/presentation/_blocs/order/order_state.dart';

class OrderBloc extends Bloc<OrderEvents, OrderState> {
  final OrderUsecase _orderUsecase = OrderUsecase();

  OrderBloc() : super(OrderInitialState()) {
    on<GetOrderEvent>((event, emit) async {
      final data = await _orderUsecase.getOrder();
      emit(OrderLoadedState(order: data));
    });
  }
}
