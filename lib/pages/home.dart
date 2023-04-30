import 'package:flutter/material.dart';
import 'package:today_my_school_2/style.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Uri _urlField = Uri.parse(
      'https://www.kmou.ac.kr/kmou/rf/rentfclts/rentFcltsView.do?mi=2025');
  final Uri _urlLibrary =
      Uri.parse('https://library.kmou.ac.kr/studyroom/groupReserveStat/4');
  final String route = '';

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  void _goPage(route) {
    Navigator.of(context).pushNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorStyles.blue,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/profile_editor');
            },
            color: ColorStyles.paleGrey,
            icon: const Icon(Icons.settings_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Expanded(
                flex: 2,
                child: UserInfoDisplay(),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        NavigationButton(
                          image: 'assets/images/calendar.png',
                          text: '예약 확인',
                          function: null,
                        ),
                        NavigationButton(
                          image: 'assets/images/meeting_room.png',
                          text: '스터디존 예약',
                          function: null,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NavigationButton(
                          image: 'assets/images/football_field.png',
                          text: '인조잔디구장\n예약 바로가기',
                          function: launchUrl(_urlField),
                        ),
                        NavigationButton(
                          image: 'assets/images/library.png',
                          text: '도서관 시설\n예약 바로가기',
                          function: launchUrl(_urlLibrary),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserInfoDisplay extends StatelessWidget {
  const UserInfoDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.zero,
            bottom: Radius.circular(60),
          ),
          color: ColorStyles.blue,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              '김제니',
              style: TextStyle(
                color: ColorStyles.white,
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              'test@kmou.ac.kr',
              style: TextStyle(
                color: ColorStyles.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '010-1234-5678',
              style: TextStyle(
                color: ColorStyles.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 홈 페이지 하단부에서 사용할 버튼 위젯 생성
class NavigationButton extends StatelessWidget {
  final String image;
  final String text;
  final void function;

  const NavigationButton({
    super.key,
    required this.image,
    required this.text,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.25,
      child: ElevatedButton(
        onPressed: () {
          function;
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: ColorStyles.black,
          backgroundColor: ColorStyles.white,
          elevation: 10,
          textStyle: TextStyles.headline6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image),
              const SizedBox(
                height: 10,
              ),
              Text(
                text,
                style: const TextStyle(),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
