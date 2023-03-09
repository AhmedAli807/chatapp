import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:untitled1/login_screen.dart';
import 'package:untitled1/welcome.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmPasswordController=TextEditingController();
  GlobalKey<FormState>key=GlobalKey();
  Color color2= Color(0xFFFFECAA);
  Color color1= Color(0xFF050522);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:color2 ,
      body:
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  Text('Hello...',
                  style: TextStyle(
                    fontSize: 18
                  ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Register',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: color1
                  ),),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator:(value) {
                      if (value!.isEmpty) {
                        return 'field is required';
                      }
                      return null;
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                    label: Text('username/email'),
                      hintText:
                        'info@examle.com'
                      ,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2,
                            color:Colors.black),
                        borderRadius: BorderRadius.circular(3)
                      ),
                      suffixIcon: Icon(
                        Icons.email
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'field is required';
                      }
                      return null;
                    },
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      label: Text('Enter Password'),
                        hintText: 'Password',

                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2,
                              color:Colors.black),
                          borderRadius: BorderRadius.circular(3)
                      ),

                      suffixIcon: Icon(
                          Icons.key
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'field is required';
                      }
                      return null;
                    },
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      label: Text('Confirm Password'),
                      hintText: 'Confirm Password',

                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2,
                              color:Colors.black),
                          borderRadius: BorderRadius.circular(3)
                      ),

                      suffixIcon: Icon(
                          Icons.key
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SizedBox(
                      height: 50,
                      width: 250,
                      child: ElevatedButton(onPressed: (){
                          if(key.currentState!.validate()){
                            // try {
                            //   print('FFFFSSSS 2 ');
                            //  var item =  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            //       email: emailController.text,
                            //       password: passwordController.text
                            //   ).whenComplete(() => print('FSSSSSS 3'));
                            //   print('FFFFSSSS');
                            //
                            // } on FirebaseAuthException catch (e) {
                            //   if (e.code == 'weak-password') {
                            //     print('The password provided is too weak.');
                            //   } else if (e.code == 'email-already-in-use') {
                            //     print('The account already exists for that email.');
                            //   }
                            // } catch (e) {
                            //   print(e);
                            // }

                            EasyLoading.showSuccess( 'Success!');
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>LoginScreen())
                            );

                          }

                      },
                        child: Text('Create Account',
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
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have account ?'),
                      TextButton(
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>LoginScreen()));
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Color(0xFFEF5858)
                          ),
                        ),
                      ),

                    ],
                  ),



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
