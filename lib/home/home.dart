import 'package:flutter/material.dart';
import 'package:studyapp/login/login.dart';
import 'package:studyapp/shared/loading.dart';
import 'package:studyapp/topics/topics.dart';
import 'package:studyapp/services/auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    /*
    return Scaffold(
      body: Center(  //wrapped with center looks pretty CMD + Shft + R
        child: ElevatedButton(
          child:Text('topics'),
          onPressed: () => Navigator.pushNamed(context, '/topics'),   
           //this button will call the navigator class and pushNamed method because we named our routes
             ),
      )
    );
    */
    
      return StreamBuilder(
          stream:AuthService().userStream,  //will check whether you are logged in all the time 
          builder: (context, snapshot){  //this builder wiill build a different UI based on the stream
          //based on all 4 different conneciton states see doc will do something specifically
            if(snapshot.connectionState == ConnectionState.waiting){
              return const LoadingScreen();
               //show a loading widget while loading
            }
            else if(snapshot.hasError){   //if there is an error
              return const LoadingScreen();
            }
            else if (snapshot.hasData){
              return const TopicsScreen();
            }
            else{
              return const LoginScreen();
            }
          }

      );
      
      
      
      
  }
}