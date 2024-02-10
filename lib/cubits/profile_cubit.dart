import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalpro/cubits/profile_state.dart';
import 'package:finalpro/data/user_data_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileCubit extends Cubit<ProfileState> {


  ProfileCubit() : super(ProfileInitial());

  Future<void> getUserDataFromFirestore() async {
    try {
      emit(ProfileLoading());
      String uid = FirebaseAuth.instance.currentUser!.uid;

      var userData =
      await FirebaseFirestore.instance.collection('users').doc(uid).get();

      emit(ProfileLoaded(userData: UserDataModel.fromDoc(userData)));
    } catch (error) {
      emit(ProfileError(error: 'Error fetching user data: $error'));
    }
  }
  ImagePicker picker = ImagePicker();
  Future<void> pickImageAndUploadToFireStoreDataBase() async {
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        emit(ProfileUploading());

        await uploadImageToFirebase(File(image.path));

        getUserDataFromFirestore();
      }
    } catch (error) {
      emit(ProfileError(error: 'Error picking/uploading image: $error'));
    }
  }

  Future<void> uploadImageToFirebase(File image) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;

      final ref =
      FirebaseStorage.instance.ref().child('userImages').child('$uid.jpg');

      await ref.putFile(image);

      final imageUrl = await ref.getDownloadURL();

      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        "userImage": imageUrl,
      });
    } catch (error) {
      emit(ProfileError(error: 'Error uploading image to Firebase: $error'));
    }
  }

  // Placeholder for method implementation
  Future<void> getUserDataFromFireStoreDataBase() async {
    await getUserDataFromFirestore();
  }

  // Placeholder for method implementation
  Future<void> pickImageAndUpload() async {
    await pickImageAndUploadToFireStoreDataBase();
  }
}
