import 'package:firebase_auth/firebase_auth.dart';

class AccountModel {
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  String getNickName() {
    return FirebaseAuth.instance.currentUser?.displayName ?? '닉네임 없음';
  }

  String getProfileImageUrl() {
    return FirebaseAuth.instance.currentUser?.photoURL ?? 'https://cdn-icons-png.flaticon.com/512/1936/1936319.png';
  }
}