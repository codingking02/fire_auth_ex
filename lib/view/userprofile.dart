// ignore_for_file: unused_local_variable, unnecessary_null_comparison

import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String imageuser = '';
  @override
  void initState() {
    getAllUsers();
    super.initState();
  }

  User? user;

  getAllUsers() {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    user = firebaseAuth.currentUser;
    setState(() {
      imageuser = user!.photoURL!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            updateImage();
                          },
                          child: Text(
                            "update Image",
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            updateImage();
                          },
                          child: Text(
                            "upload Image",
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () {
                      getImageFromGalary();
                    },
                    child: CircleAvatar(
                      child: ClipOval(
                          child: SizedBox(
                        width: 100,
                        height: 100,
                        child: imageuser == null
                            ? (CheckIfUrlValid(
                                url: imageuser,
                              ))
                                ? Image.network(
                                    imageuser,
                                    fit: BoxFit.fill,
                                  )
                                : Image.file(
                                    File(
                                      imageuser,
                                    ),
                                  )
                            : Icon(
                                Icons.person,
                              ),
                      )),
                      radius: 50,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ),
                Text(
                  "Name : ${user!.displayName}",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Email : ${user!.email}",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "email : ${user!.emailVerified}",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "phonenumber : ${user!.phoneNumber}",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "PhotoUrl : ${user!.photoURL}",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  updateImage() async {
    user!.updatePhotoURL(
      'https://i0.wp.com/cms.babbel.news/wp-content/uploads/2019/06/BilingualCelebritites_HUB.png?fit=1200%2C675&strip=none&ssl=1',
    );
    await user!.reload();
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    user = firebaseAuth.currentUser;
  }

  uploadImage() {
    String ImageName = basename(imageuser);
    final storage = FirebaseStorage.instance;
    UploadTask uploadTask =
        storage.ref().child("photos").child(ImageName).putFile(File(imageuser));
    uploadTask.snapshotEvents.listen(
      (event) {
        switch (event.state) {
          case TaskState.running:
            break;
          case TaskState.paused:
            break;
          case TaskState.success:
            uploadTask.snapshot.ref.getDownloadURL();
            break;
          case TaskState.canceled:
            break;
          case TaskState.error:
            break;
        }
      },
    );
  }

  getImageFromGalary() async {
    final ImagePicker picker = ImagePicker();
    final XFile? Image = await picker.pickImage(source: ImageSource.gallery);

    setState(
      () {
        imageuser = Image!.path;
      },
    );
  }

  CheckIfUrlValid({required String url}) {
    if (Uri.tryParse(url)!.hasAbsolutePath) {
      return true;
    } else {
      return false;
    }
  }
}
