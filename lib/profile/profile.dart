import 'package:flutter/material.dart';
import 'package:studyapp/main.dart';
import 'package:studyapp/services/auth.dart';
import 'package:studyapp/shared/loading.dart';
import 'package:studyapp/theme.dart';
import 'package:studyapp/services/models.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/shared/bottom_nav.dart';
import 'package:lottie/lottie.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //declarations
    var report = Provider.of<Report>(context);
    var user = AuthService().user;   

    //(user.displayname ?? 'guest')  //if user.displayname is null it will put guest.

    //report.total for total number score

    if (user != null){
      return Scaffold(
        appBar: AppBar(
          title:  Text(user.displayName ?? 'Guest'),
          backgroundColor: AppColors.secondaryAccent,
        ),
        //create a centered column for the about screen.  Add a pretty lotty animation at the top The number of quizzes completed to remaining
        //Then lastly a signout button
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:  const EdgeInsets.only(top: 50),  
                child: Lottie.asset("assets/profile.json",
                  width: 100,
                  height: 100,
                ),
              ),
              /*   //uses profile image from ios or gmail account or placeholder img lowkey ugly tho
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(user.photoURL ??  //firebase_auth
                        'https://www.gravatar.com/avatar/placeholder'),
                  ),
                ),
              ),
              */
              Text(user.email ?? '',
                  style:TextStyle(
                    color:Colors.white, 
                    fontSize: 25, 
                    fontWeight: FontWeight.bold
                    ) 
                  ),
              const Spacer(),  //basically spaces it out automatically
              Text('${report.total}',
                  style:TextStyle(
                    color:Colors.white, 
                    fontSize: 28, 
                    fontWeight: FontWeight.bold
                    ) 
                  ),
              Text('Quizzes Completed',
                  style:TextStyle(
                    color:Colors.white, 
                    fontSize: 25, 
                    fontWeight: FontWeight.bold
                    ) 
                  ),
              const Spacer(),

              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.prettypurple1),
                  ),
                
                child: const Text('signout'),
                
                onPressed: () async {
                  await AuthService().signOut();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/', (route) => false);
                }//onpressed
              ),
              const Spacer(),
              
            ],
          ),
        ),
          //bottomNavigationBar: const BottomNavBar(),  --consider materialpageroute for its buttons
      );
    }
    else {
      return const Loader();  
    }
  }
}



