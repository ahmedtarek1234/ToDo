import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/Task_model.dart';
import 'package:todo/User_model.dart';

class FirbaseFunctions {
  static CollectionReference<TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromjson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.tojson();
      },
    );
  }

  static CollectionReference<userModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<userModel>(
      fromFirestore: (snapshot, _) {
        return userModel.fromjson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.tojson();
      },
    );
  }

  static Future<void> addUser(userModel UserModel) {
    var collection = getUsersCollection();
    var docRef = collection.doc(UserModel.id);
    return docRef.set(UserModel);
  }

  static Future<void> addTask(TaskModel task) {
    var collection = getTasksCollection();
    var docRef = collection.doc();
    task.id = docRef.id;
    return docRef.set(task);
  }

  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime date) {
    return getTasksCollection()
        .where("date",
            isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch)
        .snapshots();
  }

  static Future<void> deleteTask(String id) {
    return getTasksCollection().doc(id).delete();
  }

  static createAccount({required String email, required String password, required String userName,
      required String phone, required Function onSuccess, required Function onError}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      credential.user!.sendEmailVerification();
      userModel UserModel = userModel(
          email: email,
          phone: phone,
          id: credential.user!.uid,
          userName: userName);
      addUser(UserModel);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError(e.message);
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        onError(e.message);
        print('The account already exists for that email.');
      }
      onError(e.message);
    } catch (e) {
      print(e);
      onError(e.toString());
    }
  }

}
