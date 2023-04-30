import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today_my_school_2/models/m_auth.dart';
import 'package:today_my_school_2/models/m_signup.dart';
import 'package:today_my_school_2/style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupPage extends StatefulWidget {
  static final _formKey = GlobalKey<FormState>();

  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignupFieldModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('회원가입'),
        ),
        body: SafeArea(
          child: Center(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.07),
                          Form(
                            key: SignupPage._formKey,
                            child: Column(
                              children: const [
                                NameInput(),
                                SizedBox(height: 5),
                                PhoneInput(),
                                SizedBox(height: 5),
                                EmailInput(),
                                SizedBox(height: 5),
                                PasswordInput(),
                                SizedBox(height: 5),
                                PasswordConfirmInput(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SignupButton(),
                ],
              ),
            ),
          ),
        ),
        bottomSheet: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        ),
      ),
    );
  }
}

class NameInput extends StatelessWidget {
  const NameInput({super.key});

  @override
  Widget build(BuildContext context) {
    // listen: false -> 불필요한 빌드 발생 방지
    final signupField = Provider.of<SignupFieldModel>(context, listen: false);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.07,
      child: TextFormField(
        key: const ValueKey(1),
        validator: (value) {
          if (value!.trim().isEmpty) {
            return '이름을 입력하세요';
          }
          return null;
        },
        onChanged: (name) {
          signupField.setName(name);
        },
        keyboardType: TextInputType.name,
        style: TextStyles.textField,
        decoration: const InputDecoration(
          labelText: '이름',
          labelStyle: TextStyles.smallButton,
          floatingLabelStyle: TextStyle(color: ColorStyles.blue),
          errorStyle: TextStyle(color: ColorStyles.orange),
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
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: ColorStyles.orange,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: ColorStyles.orange,
              width: 2,
            ),
          ),
        ),
        cursorColor: ColorStyles.black,
      ),
    );
  }
}

class PhoneInput extends StatelessWidget {
  const PhoneInput({super.key});

  @override
  Widget build(BuildContext context) {
    // listen: false -> 불필요한 빌드 발생 방지
    final signupField = Provider.of<SignupFieldModel>(context, listen: false);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.07,
      child: TextFormField(
        key: const ValueKey(2),
        validator: (value) {
          if (value!.trim().isEmpty || value.length < 10) {
            return '전화번호를 입력하세요';
          }
          return null;
        },
        onChanged: (phone) {
          signupField.setPhone(phone);
        },
        keyboardType: TextInputType.phone,
        style: TextStyles.textField,
        decoration: const InputDecoration(
          labelText: '전화번호',
          labelStyle: TextStyles.smallButton,
          floatingLabelStyle: TextStyle(color: ColorStyles.blue),
          errorStyle: TextStyle(color: ColorStyles.orange),
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
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: ColorStyles.orange,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: ColorStyles.orange,
              width: 2,
            ),
          ),
        ),
        cursorColor: ColorStyles.black,
      ),
    );
  }
}

class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    // listen: false -> 불필요한 빌드 발생 방지
    final signupField = Provider.of<SignupFieldModel>(context, listen: false);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.07,
      child: TextFormField(
        key: const ValueKey(3),
        validator: (value) {
          if (value!.trim().isEmpty || !value.contains('kmou.ac.kr')) {
            return '학교 웹메일을 입력하세요';
          }
          return null;
        },
        onChanged: (email) {
          signupField.setEmail(email);
        },
        keyboardType: TextInputType.emailAddress,
        style: TextStyles.textField,
        decoration: const InputDecoration(
          labelText: '학교 웹메일',
          labelStyle: TextStyles.smallButton,
          floatingLabelStyle: TextStyle(color: ColorStyles.blue),
          errorStyle: TextStyle(color: ColorStyles.orange),
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
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: ColorStyles.orange,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: ColorStyles.orange,
              width: 2,
            ),
          ),
        ),
        cursorColor: ColorStyles.black,
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    // listen: false -> 불필요한 빌드 발생 방지
    final signupField = Provider.of<SignupFieldModel>(context, listen: false);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.07,
      child: TextFormField(
        key: const ValueKey(4),
        validator: (value) {
          if (value!.trim().isEmpty || value.length < 6) {
            return '6자리 이상의 비밀번호를 입력하세요';
          }
          return null;
        },
        onChanged: (password) {
          signupField.setPassword(password);
        },
        obscureText: true,
        style: TextStyles.textField,
        decoration: const InputDecoration(
          labelText: '비밀번호',
          labelStyle: TextStyles.smallButton,
          floatingLabelStyle: TextStyle(color: ColorStyles.blue),
          errorStyle: TextStyle(color: ColorStyles.orange),
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
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: ColorStyles.orange,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: ColorStyles.orange,
              width: 2,
            ),
          ),
        ),
        cursorColor: ColorStyles.black,
      ),
    );
  }
}

class PasswordConfirmInput extends StatelessWidget {
  const PasswordConfirmInput({super.key});

  @override
  Widget build(BuildContext context) {
    // listen: true -> password 값과 실시간으로 비교하여 같지 않을 때 에러 메시지 발생
    final signupField = Provider.of<SignupFieldModel>(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.07,
      child: TextFormField(
        key: const ValueKey(5),
        onChanged: (password) {
          signupField.setPasswordConfirm(password);
        },
        obscureText: true,
        style: TextStyles.textField,
        decoration: InputDecoration(
          labelText: '비밀번호 확인',
          labelStyle: TextStyles.smallButton,
          floatingLabelStyle: const TextStyle(color: ColorStyles.blue),
          errorStyle: const TextStyle(color: ColorStyles.orange),
          errorText: signupField.password != signupField.passwordConfirm
              ? '비밀번호가 일치하지 않습니다'
              : null,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: ColorStyles.grey,
              width: 2,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: ColorStyles.blue,
              width: 2,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: ColorStyles.orange,
              width: 2,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: ColorStyles.orange,
              width: 2,
            ),
          ),
        ),
        cursorColor: ColorStyles.black,
      ),
    );
  }
}

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    final authClient =
        Provider.of<FirebaseAuthProvider>(context, listen: false);
    final signupField = Provider.of<SignupFieldModel>(context, listen: false);
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
        // 파이어베이스에 보내는 요청이므로 시간이 걸릴 수 있어 async-await로 구현
        onPressed: () async {
          if (SignupPage._formKey.currentState!.validate()) {
            try {
              UserCredential credential = await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: signupField.email, password: signupField.password);
              if (credential.user != null) {
                await FirebaseFirestore.instance
                    .collection("users")
                    .doc(credential.user!.uid)
                    .set({
                  "email": signupField.email,
                  "password": signupField.password,
                  "uid": credential.user!.uid,
                  "name": signupField.name,
                  "phone": signupField.phone
                });
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(const SnackBar(content: Text('회원가입 완료!')));
                Navigator.pop(context);
              }
            } catch (e) {
              print(e);
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(content: Text("회원가입 실패!")),
                );
            }
          } else {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(content: Text("회원가입 실패!")),
              );
          }
        },
        child: const Text(
          '회원가입',
          style: TextStyles.bigButton,
        ),
      ),
    );
  }
}
