import 'package:flutter/material.dart';

import 'bloc/counter_bloc.dart';
// import 'package:bloc/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text("Change Value"),
            SizedBox(
              height: 50,
            ),
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
              if (state is CounterInitial) {
                return Text("0",
                    style: TextStyle(color: Colors.redAccent, fontSize: 24));
              } else if (state is CounterValueChangedState) {
                return Text(
                  state.counter.toString(),
                  style: TextStyle(color: Colors.redAccent, fontSize: 24),
                );
              } else {
                return SizedBox();
              }
            })
          ],
        ),
      ),
      floatingActionButton: _floatingActionButton(context),
    );
  }

  _floatingActionButton(BuildContext ctx) {
    return Column(
      children: [
        FloatingActionButton(
          onPressed: () {
            BlocProvider.of<CounterBloc>(ctx).add(IncreamentCounter());
          },
          child: Icon(
            Icons.add,
            size: 14,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        FloatingActionButton(
          onPressed: () {
            BlocProvider.of<CounterBloc>(ctx).add(DecreanentCounter());
          },
          child: Icon(
            Icons.remove,
            size: 14,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        FloatingActionButton(
          onPressed: () {
            BlocProvider.of<CounterBloc>(ctx).add(ResetEvent());
          },
          child: Icon(
            Icons.exposure_zero,
            size: 14,
          ),
        ),
      ],
    );
  }
}
