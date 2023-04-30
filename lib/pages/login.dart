import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today_my_school_2/models/m_auth.dart';
import 'package:today_my_school_2/models/m_login.dart';
import 'package:today_my_school_2/style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginFieldModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('로그인'),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                const EmailInput(),
                const SizedBox(height: 5),
                const PasswordInput(),
                const Spacer(),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      FindPasswordButton(),
                      Text('|', style: TextStyles.smallButton),
                      SignupButton(),
                    ],
                  ),
                ),
                const LoginButton(),
              ],
            ),
          ),
        ),
        // 키보드가 올라올 때 버튼도 같이 올라오게 하기
        bottomSheet: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        ),
      ),
    );
  }
}

class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    final loginField = Provider.of<LoginFieldModel>(context, listen: false);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.07,
      child: TextField(
        onChanged: (email) {
          loginField.setEmail(email);
        },
        keyboardType: TextInputType.emailAddress,
        style: TextStyles.textField,
        decoration: const InputDecoration(
          hintText: '학교 웹메일',
          hintStyle: TextStyles.smallButton,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: ColorStyles.grey,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: ColorStyles.blue,
              width: 2,
            ),
          ),
        ),
        cursorColor: ColorStyles.blue,
        autofocus: true,
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    final loginField = Provider.of<LoginFieldModel>(context, listen: false);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.07,
      child: TextField(
        onChanged: (password) {
          loginField.setPassword(password);
        },
        obscureText: true,
        style: TextStyles.textField,
        decoration: const InputDecoration(
          hintText: '비밀번호',
          hintStyle: TextStyles.smallButton,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: ColorStyles.grey,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: ColorStyles.blue,
              width: 2,
            ),
          ),
        ),
        cursorColor: ColorStyles.blue,
      ),
    );
  }
}

// 기능 구현 필요
class FindPasswordButton extends StatelessWidget {
  const FindPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: ColorStyles.grey,
      ),
      onPressed: () {
        Navigator.of(context).pushNamed('/signup');
      },
      child: const Text(
        '비밀번호 찾기',
        style: TextStyles.smallButton,
      ),
    );
  }
}

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: ColorStyles.grey,
      ),
      onPressed: () {
        Navigator.of(context).pushNamed('/signup');
      },
      child: const Text(
        '회원가입',
        style: TextStyles.smallButton,
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final authClient =
        Provider.of<FirebaseAuthProvider>(context, listen: false);
    final loginField = Provider.of<LoginFieldModel>(context, listen: false);
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.07,
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: ColorStyles.blue,
            foregroundColor: ColorStyles.white),
        onPressed: () async {
          await authClient
              .loginWithEmail(loginField.email, loginField.password)
              .then((loginStatus) {
            if (loginStatus == AuthStatus.loginSuccess) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(content: Text('로그인 성공! 반가워요')),
                );
              Navigator.pushReplacementNamed(context, '/home');
            } else {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(content: Text('로그인 실패! 다시 시도해주세요')),
                );
            }
          });
        },
        child: const Text(
          '로그인',
          style: TextStyles.bigButton,
        ),
      ),
    );
  }
}
