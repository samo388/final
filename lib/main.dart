import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:finalpro/cubits/auth_cubit.dart';
import 'package:finalpro/firebase_options.dart';
import 'package:finalpro/home_screen.dart';
import 'package:finalpro/observer.dart';
import 'package:finalpro/screens/Auth_screens/login_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,

    );

  } catch (e) {
    print('Failed to initialize Firebase: $e');
    // Handle initialization failure gracefully
    // You might want to display an error message to the user
    return;

  }


  Bloc.observer = MyBlocObserver();
  runApp(
    BlocProvider(
      create: (context) => AuthCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late User? user;
  late bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    checkCurrentUser();
  }

  Future<void> checkCurrentUser() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    setState(() {
      user = currentUser;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoading
          ? _buildLoadingIndicator()
          : user != null
          ? const HomePage()
          : const LoginScreen(),
    );
  }

  Widget _buildLoadingIndicator() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
