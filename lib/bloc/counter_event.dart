part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class IncreamentCounter extends CounterEvent {}

class DecreanentCounter extends CounterEvent {}

class ResetEvent extends CounterEvent {}
