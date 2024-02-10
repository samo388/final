import 'package:finalpro/cubits/app_cubit.dart';
import 'package:finalpro/cubits/profile_cubit.dart';
import 'package:finalpro/screens/Auth_screens/login_screen.dart';
import 'package:finalpro/screens/first_screen.dart';
import 'package:finalpro/screens/grid_view_screen.dart';
import 'package:finalpro/screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreenOne(),
    const GridViewOfProductsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()
        ),
        BlocProvider(
          create: (context) {
            const picker = null;
            final cubit = ProfileCubit(picker: picker);

            cubit.getUserDataFromFireStoreDataBase();
            return cubit;
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: const Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.black,
          ),
          title: const Text(
            'app',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                      (route) => false,
                    );
                  });
                },
                icon: const Icon(
                  Icons.login_outlined,
                  color: Colors.black,
                )),
          ],
        ),
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xff192462),
          selectedItemColor: const Color(0xff131c62),
          unselectedItemColor: const Color(0xffa8a8a8),
          currentIndex: currentIndex,
          onTap: (i) {
            currentIndex = i;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                label: 'Products'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_shopping_cart_sharp,
                ),
                label: 'Products2'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
