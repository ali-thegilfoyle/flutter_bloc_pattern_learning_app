import 'dart:async';

import 'dart:async';
import 'counter_event.dart';

class CounterBloc {
  int _counter = 0;

  // this stream controller is for the state of the app.
  final _counterStateController = StreamController<int>();
  // this function of stream controller will lister the changes. It is like an input to this stream controller.
  StreamSink<int> get _inCounter => _counterStateController.sink;
  // this function will return the counter value from the stream. It is like a output to this stream controller.
  Stream<int> get counter => _counterStateController.stream;

  // this stream countroller will listen for the events and further map it to the new state of the app.
  final _counterEventController = StreamController<CounterEvent>();
  // through this sink we will listen to the events.
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  // now as we now BloC receive the events and produce the new state.
  // here we map the events and the state.
  CounterBloc() {
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if (event is IncrementCounter) {
      _counter++;
    }

    _inCounter.add(_counter);
  }

  // and last dispose both streams.
  void dispose() {
    _counterEventController.close();
    _counterStateController.close();
  }
}
