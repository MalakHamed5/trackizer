import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'financehub_event.dart';
part 'financehub_state.dart';

class FinancehubBloc extends Bloc<FinancehubEvent, FinancehubState> {
  FinancehubBloc() : super(FinancehubInitial()) {
    on<FinancehubEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
