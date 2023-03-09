import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/register_screen.dart';
import 'login_screen.dart';
import 'package:flutter/animation.dart';
class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  Color color=Color(0xFF050522);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:AssetImage('assets/welcome.png')
                    )
                  )
                ),
              SizedBox(
                height: 5,
              ),
              DefaultTextStyle(style:  TextStyle(
                  fontSize: 30,
                  color: Color(0xFFEF5858)

              ),
                  child:
              AnimatedTextKit(animatedTexts: [
                RotateAnimatedText('Welcome'),

              ],
                pause: Duration(milliseconds: 5000),
                totalRepeatCount: 1,
              )
              ),
              SizedBox(
                height: 10,
              ),
              DefaultTextStyle(style: TextStyle(
                fontSize: 20,
                color: Colors.white,

              ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText('We wish you an enjoyable experience')
                    ],

                    pause: Duration(milliseconds: 10000),
                    totalRepeatCount: 1,
                    isRepeatingAnimation: true,
                  )),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 50,
                width: 250,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>RegisterScreen()));
                },
                child: Text('Create Account',
                style: TextStyle(
                  color: color,
                  fontSize: 18
                ),
                ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFFDE69)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),

                    )
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              SizedBox(
                height: 50,
                width: 250,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>LoginScreen()
                  )
                  );
                },
                child: Text('Login',
                style: TextStyle(
                  color: Color(0xFFFFDE69),
                  fontSize: 18
                ),
                ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(color),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(width: 3,color: Color(0xFFFFDE69))
                      ),

                    )
                  ),
                ),
              ),

            ],
          ),
        ),
    );
  }
}
