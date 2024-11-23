import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(count: 0));

  void doCount(int end) async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    );
    for (int a = 0; a <= end; a++) {
      emit(CounterState(count: a));
      await Future.delayed(
        const Duration(microseconds: 5),
      );
    }
  }
}
