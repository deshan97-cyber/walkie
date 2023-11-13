import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class storageMethods {
  //create a storage instance
  FirebaseStorage _storage = FirebaseStorage.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  //function to store the picture to storage and return the url

  Future<String> uploadImage({
    required String folderName,
    required bool isPost,
    required Uint8List file,
  }) async {
    //create a reference for the image here we also select the corrrect folder
    Reference ref =
        _storage.ref().child(folderName).child(_auth.currentUser!.uid);

    //if this is a post add another id

    if (isPost) {
      String postId = const Uuid().v4();
      ref = ref.child(postId);
    }

    //upload the image to the storage

    UploadTask uploadTask = ref.putData(file);
    await uploadTask;
    TaskSnapshot snapshot = await uploadTask;
    String downloadURL = await snapshot.ref.getDownloadURL();

    return downloadURL;
  }
}
