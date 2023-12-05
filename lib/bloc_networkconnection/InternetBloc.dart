import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getx_test/bloc_networkconnection/internetState.dart';
import 'package:getx_test/bloc_networkconnection/internet_event.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  Connectivity _connectivity = new Connectivity();

  StreamSubscription? streamSubscription;

  InternetBloc() : super(InternetInitState()) {
    on<InternetLossEvent>((event, emit) => emit(InternetLostState()));
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));

    streamSubscription =  _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetLossEvent());
      }
    });
  }
  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
