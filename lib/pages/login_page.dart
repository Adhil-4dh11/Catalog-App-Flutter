import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../utilities/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String name = '';
  bool changebutton = false;
  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if(_formkey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changebutton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset(
                'assets/images/login_page.png',
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 15,
              ),
              Text('Welcome $name',
                style: const TextStyle(
                  color: Color(0xFF1A237E),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username",
                        ),
                        validator: (value) {
                          if(value!.isEmpty) {
                            return 'Username Cannot Be Empty!';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        } // onChanged
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if(value!.isEmpty) {
                          return 'Password Cannot Be Empty';
                        } else if (value.length < 6) {
                          return 'Password Length Should Be At Least 6';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: changebutton? 50 : 150,
                        height: 50,
                        alignment: Alignment.center,
                        child: changebutton? const Icon(
                          Icons.done,
                          color: Colors.white,
                        )
                            :  const Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          //shape: changebutton? BoxShape.circle : BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(changebutton? 50 : 8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}