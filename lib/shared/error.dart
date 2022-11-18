import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';


// ---------Error Screen------------
class ErrorScreen extends StatelessWidget {
  final String message;  //forgot to initialize message 
  const ErrorScreen({super.key, this.message = 'Darn it broke :('});  

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset("assets/coffee.json",
            width: 250,
            height: 250,
            ),
          Text('Error while loading...')
        ],
      ),
    );
    //will probably put a pretty error image or something funny here but this is simple for now
  }
}