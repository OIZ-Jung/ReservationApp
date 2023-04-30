import 'package:flutter/material.dart';
import 'package:today_my_school_2/firebase_options.dart';
import 'package:today_my_school_2/models/m_auth.dart';
import 'package:today_my_school_2/pages/home.dart';
import 'package:today_my_school_2/pages/login.dart';
import 'package:today_my_school_2/pages/profile_editor.dart';
import 'package:today_my_school_2/pages/res_confirmation.dart';
import 'package:today_my_school_2/pages/reservation_form.dart';
import 'package:today_my_school_2/pages/room_selection.dart';
import 'package:today_my_school_2/pages/schedule_selection.dart';
import 'package:today_my_school_2/pages/signup.dart';
import 'package:today_my_school_2/pages/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:today_my_school_2/style.dart';

void main() async {
  // SharedPreferences가 초기 설정될 때 정상적으로 동작하게 함
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "toMySchool",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FirebaseAuthProvider()),
      ],
      child: MaterialApp(
        title: 'Today My School',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: ColorStyles.paleGrey,
            foregroundColor: ColorStyles.black,
            elevation: 0,
            centerTitle: true,
            titleTextStyle: TextStyles.appBar,
          ),
          scaffoldBackgroundColor: ColorStyles.paleGrey,
        ),
        // 라우팅을 위한 선언을 Map 형식으로 할 수 있는 필드
        routes: {
          '/': (context) => const SplashPage(),
          '/login': (context) => const LoginPage(),
          '/signup': (context) => const SignupPage(),
          '/home': (context) => const HomePage(),
          '/res_confirmation': (context) => const ResConfirmationPage(),
          '/profile_editor': (context) => const ProfileEditorPage(),
          '/room_selection': (context) => const RoomSelectionPage(),
          '/schedule_selection': (context) => const ScheduleSelectionPage(),
          '/reservation_form': (context) => const ReservationForm(),
        },
        // 앱이 최초에 시작할 위치를 설정함
        initialRoute: '/',
      ),
    );
  }
}
