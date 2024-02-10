import 'package:finalpro/cubits/auth_cubit.dart';
import 'package:finalpro/cubits/auth_state.dart';
import 'package:finalpro/home_screen.dart';
import 'package:finalpro/widgets/my_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  TextEditingController emailC = TextEditingController();

  TextEditingController passwordC = TextEditingController();

  TextEditingController nameC = TextEditingController();

  TextEditingController ageC = TextEditingController();

  TextEditingController phoneC = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              MyFormField(
                controller: nameC,
                label: 'Name',
                icon: Icons.person,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
              ),
              MyFormField(
                controller: emailC,
                label: 'Email',
                icon: Icons.email,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email is required';
                  }
                  return null;
                },
              ),
              MyFormField(
                controller: passwordC,
                label: 'Password',
                icon: Icons.lock,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
              ),
              MyFormField(
                controller: ageC,
                label: 'Age',
                icon: Icons.calendar_today,
                textInputType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Age is required';
                  }
                  return null;
                },
              ),
              MyFormField(
                controller: phoneC,
                label: 'Phone',
                icon: Icons.phone,
                textInputType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Phone is required';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(state.error),
                      ),
                    );
                  } else if (state is AuthLoaded) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                      (route) => false,
                    );
                  }
                },
                builder: (context, state) {
                  return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.red,
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      onPressed: state is AuthLoading
                          ? null
                          : () {
                              if (formKey.currentState!.validate()) {
                                context
                                    .read<AuthCubit>()
                                    .createUserWithEmailAndPassword(
                                      email: emailC.text,
                                      password: passwordC.text,
                                      name: nameC.text,
                                      age: int.parse(ageC.text),
                                      phoneNo: phoneC.text,
                                    );
                                FocusScope.of(context).unfocus();
                              }
                            },
                      child: state is AuthLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text('Create Account'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
