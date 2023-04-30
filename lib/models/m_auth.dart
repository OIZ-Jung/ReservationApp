import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 인증 관련 상태
enum AuthStatus {
  signupSuccess,
  signupFail,
  loginSuccess,
  loginFail,
}

class FirebaseAuthProvider with ChangeNotifier {
  // Firebase와 연결된 인스턴스 저장, 앱 전역에 똑같은 authClient 유지 및 제공
  FirebaseAuth authClient;
  // 현재 로그인된 유저 객체 저장, 앱 전역에 똑같은 유저 정보 공유
  User? user;

  FirebaseAuthProvider({auth}) : authClient = auth ?? FirebaseAuth.instance;

  Future<AuthStatus> signupWithEmail(String email, String password) async {
    try {
      UserCredential credential = await authClient
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(credential.user!.uid)
            .set({
          "email": email,
          "password": password,
          "uid": credential.user!.uid
        });
        return AuthStatus.signupSuccess;
      } else
        return AuthStatus.signupFail;
    } catch (e) {
      print(e);
      return AuthStatus.signupFail;
    }
  }

  Future<AuthStatus> loginWithEmail(String email, String password) async {
    try {
      await authClient
          .signInWithEmailAndPassword(email: email, password: password)
          .then((credential) async {
        user = credential.user;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLogin', true);
        prefs.setString('email', email);
        // 개인정보 유출의 위험이 있어 원래는 암호화 기능이 존재하는 패키지를 활용해 비밀번호를 암호화해 저장해야 함
        prefs.setString('password', password);
      });
      print("[+] 로그인유저 : ${user!.email}");
      return AuthStatus.loginSuccess;
    } catch (e) {
      print(e);
      return AuthStatus.loginFail;
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogin', false);
    prefs.setString('email', '');
    prefs.setString('password', '');
    user = null;
    await authClient.signOut();
    print("[-] 로그아웃");
  }
}
