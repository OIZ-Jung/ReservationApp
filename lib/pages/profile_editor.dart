import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:today_my_school_2/style.dart';
import 'package:provider/provider.dart';
import 'package:today_my_school_2/models/m_auth.dart';

class ProfileEditorPage extends StatefulWidget {
  static final _formKey = GlobalKey<FormState>();

  const ProfileEditorPage({super.key});

  @override
  State<ProfileEditorPage> createState() => _ProfileEditorPageState();
}

class _ProfileEditorPageState extends State<ProfileEditorPage> {
  void logout() async {
    final authClient =
        Provider.of<FirebaseAuthProvider>(context, listen: false);
    await authClient.logout();
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(content: Text('로그아웃 완료!')),
      );
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('내 정보 수정'),
        actions: [
          IconButton(
            onPressed: () {
              logout();
            },
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
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
                            height: MediaQuery.of(context).size.height * 0.07),
                        Form(
                          key: ProfileEditorPage._formKey,
                          child: Column(
                            children: const [
                              NameInput(),
                              SizedBox(height: 10),
                              PhoneInput(),
                              SizedBox(height: 10),
                              EmailInput(),
                              SizedBox(height: 10),
                              PasswordInput(),
                              SizedBox(height: 10),
                              PasswordConfirmInput(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const EditButton(),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      ),
    );
  }
}

class NameInput extends StatefulWidget {
  const NameInput({super.key});

  @override
  State<NameInput> createState() => _NameInputState();
}

class _NameInputState extends State<NameInput> {
  TextEditingController nameController = TextEditingController(text: '김제니');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '이름',
          style: TextStyles.textLabel,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.07,
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: TextFormField(
            key: const ValueKey(1),
            validator: (value) {
              if (value!.trim().isEmpty) {
                return '이름을 입력하세요';
              }
              return null;
            },
            controller: nameController,
            keyboardType: TextInputType.name,
            style: TextStyles.textField,
            decoration: const InputDecoration(
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
        ),
      ],
    );
  }
}

class PhoneInput extends StatefulWidget {
  const PhoneInput({super.key});

  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  TextEditingController phoneController =
      TextEditingController(text: '010-1234-5678');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '전화번호',
          style: TextStyles.textLabel,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.07,
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: TextFormField(
            key: const ValueKey(2),
            validator: (value) {
              if (value!.trim().isEmpty || value.length < 10) {
                return '전화번호를 입력하세요';
              }
              return null;
            },
            controller: phoneController,
            keyboardType: TextInputType.phone,
            style: TextStyles.textField,
            decoration: const InputDecoration(
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
        ),
      ],
    );
  }
}

class EmailInput extends StatefulWidget {
  const EmailInput({super.key});

  @override
  State<EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  TextEditingController emailController =
      TextEditingController(text: 'test@kmou.ac.kr');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '학교 웹메일',
          style: TextStyles.textLabel,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.07,
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: TextFormField(
            key: const ValueKey(3),
            validator: (value) {
              if (value!.trim().isEmpty || !value.contains('kmou.ac.kr')) {
                return '학교 웹메일을 입력하세요';
              }
              return null;
            },
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyles.textField,
            decoration: const InputDecoration(
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
        ),
      ],
    );
  }
}

class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  TextEditingController passwordController =
      TextEditingController(text: '••••••');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '비밀번호',
          style: TextStyles.textLabel,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.07,
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: TextFormField(
            key: const ValueKey(4),
            validator: (value) {
              if (value!.trim().isEmpty || value.length < 6) {
                return '6자리 이상의 비밀번호를 입력하세요';
              }
              return null;
            },
            controller: passwordController,
            obscureText: true,
            style: TextStyles.textField,
            decoration: const InputDecoration(
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
        ),
      ],
    );
  }
}

class PasswordConfirmInput extends StatefulWidget {
  const PasswordConfirmInput({super.key});

  @override
  State<PasswordConfirmInput> createState() => _PasswordConfirmInputState();
}

class _PasswordConfirmInputState extends State<PasswordConfirmInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '비밀번호 확인',
          style: TextStyles.textLabel,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.07,
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: TextFormField(
            key: const ValueKey(5),
            obscureText: true,
            style: TextStyles.textField,
            decoration: const InputDecoration(
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
        ),
      ],
    );
  }
}

class EditButton extends StatelessWidget {
  const EditButton({super.key});

  @override
  Widget build(BuildContext context) {
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
        onPressed: () {
          if (ProfileEditorPage._formKey.currentState!.validate()) {
            // 수정된 정보를 유저 데이터에 업데이트하는 기능 필요

            showToast('수정했어요!',
                context: context,
                duration: const Duration(seconds: 4),
                animDuration: const Duration(seconds: 1),
                position: StyledToastPosition.top,
                startOffset: const Offset(0, -3),
                reverseEndOffset: const Offset(0, -3),
                textPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                textStyle: const TextStyle(color: ColorStyles.lightBlue),
                backgroundColor: ColorStyles.paleBlue,
                animation: StyledToastAnimation.slideFromTop,
                reverseAnimation: StyledToastAnimation.slideToTop,
                curve: Curves.elasticOut,
                reverseCurve: Curves.fastOutSlowIn);
          }
        },
        child: const Text(
          '수정하기',
          style: TextStyles.bigButton,
        ),
      ),
    );
  }
}
