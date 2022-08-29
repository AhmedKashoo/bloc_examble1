import 'package:bloc_examble/Login/login_bloc.dart';
import 'package:bloc_examble/Presentation/Register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'component.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var NameController = TextEditingController();
    var PassController = TextEditingController();
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Login Now to Browse our hot offers',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DefaultFormField(
                      label: 'Email ADDRESS',
                      controller: NameController,
                      prefix: Icons.email_outlined,
                      type: TextInputType.emailAddress,
                      validate: (String? v) {
                        if (v!.isEmpty) {
                          return 'please Enter your Email';
                        }
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  DefaultFormField(
                      label: 'Email ADDRESS',
                      controller: PassController,
                      prefix: Icons.lock_outline,
                      type: TextInputType.text,
                      suffix: Icons.visibility_outlined,
                      validate: (String? v) {
                        if (v!.isEmpty) {
                          return 'please Enter your Email';
                        }
                      }),
                  SizedBox(
                    height: 15,
                  ),
                ConditionalBuilder(condition: state is !LoginLoading,
                    builder: (context)=>defaultButton(function: () {
                      BlocProvider.of<LoginBloc>(context)..add(UserLogin(NameController.text,PassController.text));

                    }, text: 'LOGIN'),
                    fallback: (context)=>Center(child: CircularProgressIndicator())),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t Have Account?'),

        TextButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
        }, child: Text('REGiSTER NOW')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
