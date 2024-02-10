import 'package:finalpro/cubits/profile_cubit.dart';
import 'package:finalpro/cubits/profile_state.dart';
import 'package:finalpro/widgets/profile_tile_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProfileUploading) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Uploading...'),
                  SizedBox(height: 10),
                  CircularProgressIndicator(),
                ],
              ),
            );
          } else if (state is ProfileError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${state.error}'),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ProfileCubit>().pickImageAndUploadToFireStoreDataBase();
                    },
                    child: Text('Retry'),
                  ),
                ],
              ),
            );
          } else if (state is ProfileLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      context.read<ProfileCubit>().pickImageAndUploadToFireStoreDataBase();
                    },
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                        state.userData.imageUrl == ""
                            ? "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png"
                            : state.userData.imageUrl,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ProfileTileWidget(
                    content: state.userData.name,
                    icon: Icons.person,
                  ),
                  ProfileTileWidget(
                    content: state.userData.email,
                    icon: Icons.email_outlined,
                  ),
                  ProfileTileWidget(
                    content: state.userData.age.toString(),
                    icon: Icons.cake,
                  ),
                  ProfileTileWidget(
                    content: state.userData.uid,
                    icon: Icons.person_pin,
                  ),
                  // Add more profile information as needed
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('Something went wrong!'),
            );
          }
        },
      ),
    );
  }
}
