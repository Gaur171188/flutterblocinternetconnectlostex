import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocinternetconnectlostex/blocs/internetbloc/intenetbloc.dart';
import 'package:flutterblocinternetconnectlostex/blocs/internetbloc/internetstate.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: BlocConsumer<InternetBloc,InternetState>(
              listener: (context,state){
                if(state is InternetGainState){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Internet Connected"),
                  backgroundColor: Colors.green,
                  ));
                }
                else if(state is InternetLostState){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Internet Lost"),
                  backgroundColor: Colors.red
                  ));
                }
              },

              builder: (context,state){
                if(state is InternetGainState){
                  return Text("Connected");
                }
                else if(state is InternetLostState){
                  return Text("Not Connected");
                }else{
                  return Text("Loading....");
                }
              },
            ),
            // child: BlocBuilder<InternetBloc, InternetState>(
            //   builder: (context, state) {
            //     if(state is InternetGainState){
            //       return Text("Connected");
            //     }
            //     else if(state is InternetLostState){
            //       return Text("Not Connected");
            //     }
            //     else{
            //       return Text("Loading....");
            //     }
            //
            //   },
            // ),
          )),
    );
  }
}
