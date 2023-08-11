import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocinternetconnectlostex/blocs/internetbloc/internetevent.dart';
import 'package:flutterblocinternetconnectlostex/blocs/internetbloc/internetstate.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class InternetBloc extends Bloc<InternetEvent,InternetState>{
  Connectivity _connectivity=Connectivity();
  StreamSubscription? connectivityStreamSubscription;
  InternetBloc(): super(InternetInitialState()){
    on<InternetLostEvent>((event,emit)=>emit(InternetLostState()));
    on<InternetGainedEvent>((event,emit)=>emit(InternetGainState()));
    connectivityStreamSubscription= _connectivity.onConnectivityChanged.listen((result) {
      if(result==ConnectivityResult.mobile || result==ConnectivityResult.wifi){
        add(InternetGainedEvent());
      }else{
        add(InternetLostEvent());
      }
    });

  }

  @override
  Future<void> close() {
    connectivityStreamSubscription?.cancel();
    return super.close();
  }
}