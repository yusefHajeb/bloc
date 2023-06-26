import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

// emet to return event to UI
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  //initial, story to change write here not in UI
  int counter = 0;
  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {
      if (event is IncreamentCounter) {
        counter += 1;
        emit(CounterValueChangedState(counter: counter));
      } else if (event is DecreanentCounter) {
        counter -= 1;
        emit(CounterValueChangedState(counter: counter));
      } else {
        counter = 0;
        emit(CounterValueChangedState(counter: counter));
      }
    });
  }
}
