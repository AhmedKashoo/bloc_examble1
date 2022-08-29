import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import '../Login/login_bloc.dart';
import 'component.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var EmailController = TextEditingController();
    var PassController = TextEditingController();
    var NameController = TextEditingController();
    var PhoneController = TextEditingController();
    var ClientController = TextEditingController();
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
                    'REGISTER',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Register Now to Browse our hot offers',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DefaultFormField(
                      label: 'Email ADDRESS',
                      controller: EmailController,
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
                      label: 'Password',
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
                  DefaultFormField(
                      label: 'Name',
                      controller: NameController,
                      prefix: Icons.person_outline_outlined,
                      type: TextInputType.text,

                      validate: (String? v) {
                        if (v!.isEmpty) {
                          return 'please Enter your Email';
                        }
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  DefaultFormField(
                      label: 'Phone',
                      controller: PhoneController,
                      prefix: Icons.phone,
                      type: TextInputType.text,

                      validate: (String? v) {
                        if (v!.isEmpty) {
                          return 'please Enter your Email';
                        }
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  DefaultFormField(
                      label: 'Client',
                      controller: ClientController,
                      prefix: Icons.person_outline,
                      type: TextInputType.text,

                      validate: (String? v) {
                        if (v!.isEmpty) {
                          return 'please Enter your Email';
                        }
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  ConditionalBuilder(
                    condition:state is !RegisterLoading ,
                    builder: (context)=> defaultButton(function: () {
                      BlocProvider.of<LoginBloc>(context)..add(RegisterEvent(NameController.text,EmailController.text,PassController.text,PhoneController.text,ClientController.text));

                    }, text: 'REGISTER'),
                    fallback: (context)=>Center(child: CircularProgressIndicator()),
                  )



                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
