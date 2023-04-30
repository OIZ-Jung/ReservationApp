import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:today_my_school_2/models/m_auth.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // SharedPreferences에 저장되어 있는 isLogin 값을 불러와 true인지 false인지 return하는 함수
  // shared_prefs 값을 가져오는 데 시간이 걸리기 때문에 async-await 구조로 작성함
  Future<bool> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final authClient =
        Provider.of<FirebaseAuthProvider>(context, listen: false);
    bool isLogin = prefs.getBool('isLogin') ?? false;
    print('[⭐️] 로그인 상태: $isLogin');
    if (isLogin) {
      String? email = prefs.getString('email');
      String? password = prefs.getString('password');
      print("[⭐️] 저장된 정보로 로그인 재시도");
      await authClient.loginWithEmail(email!, password!).then((loginStatus) {
        if (loginStatus == AuthStatus.loginSuccess) {
          print("[+] 로그인 성공");
        } else {
          print("[-] 로그인 실패");
          isLogin = false;
          prefs.setBool('isLogin', false);
        }
      });
    }
    return isLogin;
  }

  // checkLogin()을 수행해 해당 결과값에 따라 페이지를 이동시키는 함수
  void movePage() async {
    await checkLogin().then(
      (isLogin) {
        if (isLogin) {
          Navigator.of(context).pushReplacementNamed('/home');
        } else {
          Navigator.of(context).pushReplacementNamed('/login');
        }
      },
    );
  }

  // SplashPage가 시작되면 movePage()가 동작해 checkLogin() 값을 기반으로 다음 화면으로 자동으로 이동함
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 1500),
      () {
        movePage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: null,
      body: Center(
        child: Text('Today My School'),
      ),
    );
  }
}
