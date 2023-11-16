import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsw_store/domain/usecases/orders_usecase.dart';
import 'package:fsw_store/presentation/_blocs/orders/order_events.dart';
import 'package:fsw_store/presentation/_blocs/orders/orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvents, OrdersState> {
  final OrdersUsecase _orderUsecase = OrdersUsecase();

  OrdersBloc() : super(OrdersInitialState()) {
    on<GetOrdersEvent>((event, emit) async {
      final data = await _orderUsecase.getOrders();
      emit(OrdersLoadedState(orders: data));
    });
  }
}
