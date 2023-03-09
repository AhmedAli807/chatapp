import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/chat_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled1/google_provider.dart';



class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  Color color=Color(0xFF050522);
  Color color2= Color(0xFFFFECAA);
  Color color1= Color(0xFF050522);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFECAA),

      body: SafeArea(
        child: Form(
          key: key,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: (){
                      Navigator.pop(context);

                    },
                    child: Icon(
                        Icons.arrow_back_outlined
                    ),
                  ),
                  Container(
                      height: 500,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:AssetImage('assets/welcome.png')
                          )
                      )
                  ),
                  Text('Welcome Back!!!',
                  style: TextStyle(
                    color: color,
                    fontSize: 20
                  ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Login',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: color
                  ),),
                  SizedBox(height: 50,),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      label: Text('Enter your email'),
                      hintText: 'Enter your email',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2,
                              color:Colors.black),
                          borderRadius: BorderRadius.circular(3)
                      ),

                      suffixIcon: Icon(
                          Icons.email
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'field is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      label: Text('Enter your password'),
                      hintText: 'Enter your password',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2,
                              color:Colors.black),
                          borderRadius: BorderRadius.circular(3)
                      ),

                      suffixIcon: Icon(
                          Icons.key
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'field is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),

                  Center(
                    child: ElevatedButton(

                      onPressed: ()  {
                        // try {
                        //   UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                        //       email: emailController.text,
                        //       password: passwordController.text
                        //   );
                        // } on FirebaseAuthException catch (e) {
                        //   if (e.code == 'user-not-found') {
                        //     print('No user found for that email.');
                        //   } else if (e.code == 'wrong-password') {
                        //     print('Wrong password provided for that user.');
                        //   }
                        // }
                        if (key.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatScreen(
                                name: emailController.text,
                              ),
                            ),
                          );
                        }
                      },
                      child: Text('Submit',
                        style: TextStyle(
                            color: color2,
                            fontSize: 18
                        ),
                      ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(color1),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),

                            )
                        ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  MaterialButton(
                    onPressed: (){
                     Provider.of<GoogleProvider>(context,listen: false).googleLogin();
                     

                    },
                    child: ImageIcon(
                      AssetImage('assets/google.webp'),
                      size: 50,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
