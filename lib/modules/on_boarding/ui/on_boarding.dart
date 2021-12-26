import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/modules/login/ui/login.dart';
import 'package:lost_app/shared/components/raised_button_class.dart';
import 'package:lost_app/shared/components/component.dart';
import 'package:lost_app/shared/components/smooth_page_indicator_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardingController = PageController();
  String changeButtonText = 'التالي';
  bool isLogin = false;

  List<OnBoardingModel> splash = [
    OnBoardingModel(
        image: 'assets/images/welcome_1.svg',
        title: 'هل تبحث عن احد المفقودين ',
        body:
            "اذا كنت تبحث عن احد الأشخاص المفقودين يمكنك ارفاق صوره لهذا الشخص و سوف نساعدك في ايجاده"),
    OnBoardingModel(
        image: 'assets/images/welcome_2.svg',
        title: 'ام وجدت احد المفقودين ',
        body:
            "اما اذا كنت قد وجدت شخصا مفقوداو لا تستطيع الوصول الى ذويه فيمكنك ارفاق صورة له وسوف نساعدك في الوصول الى اقربائه"),
    OnBoardingModel(
        image: 'assets/images/welcome_3.svg',
        title: 'كل ما عليك هو ارفاق صورة وسنقوم بالبحث بدلا عنك ',
        body:
            "نقوم بتحليل الصورة عن طريق احدى تقنيات الذكاء الاصطناعي ومن ثم البحث في قاعدة البيانات التي تحتوي على العديد من الصور لاشخاص مفقودين  "),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Container(
          width: 500,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Flexible(
                    child: PageView.builder(
                      reverse: true,
                      itemCount: splash.length,
                      itemBuilder: (context, index) => buildBoardingItem(
                          splash[index],
                          splash.length,
                          boardingController,
                          context),
                      controller: boardingController,
                      onPageChanged: (index) {
                        (index == splash.length - 1)
                            ? setState(() {
                                changeButtonText = 'هيا نبدأ';
                                isLogin = true;
                              })
                            : setState(() {
                                changeButtonText = 'التالي';
                                isLogin = false;
                              });
                      },
                    ),
                  ),
                  RaisedButtonClass(
                      onPressed: () {
                        print(isLogin);
                        isLogin
                            ? navigateTo(context, LoginScreen())
                            : boardingController.nextPage(
                                duration: Duration(microseconds: 700),
                                curve: Curves.easeIn);
                      },
                      text: changeButtonText,
                      textColor: white),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildBoardingItem(
    OnBoardingModel model, splashLength, controller, context) {
  Size size = MediaQuery.of(context).size;
  return SingleChildScrollView(
    child: Padding(
      padding:
          const EdgeInsets.only(top: 80.0, right: 20, left: 20, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: SvgPicture.asset(
              model.image,
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(height: 10),
          SmoothPageIndicatorClass(count: splashLength, controller: controller),
          SizedBox(height: 30),
          TextClass(
            text: model.title,
            fontSize: size.width >= 500 ? 25 : size.width / 18,
            fontWeight: FontWeight.normal,
          ),
          SizedBox(height: 50),
          TextClass(
            text: model.body,
            fontSize: size.width >= 500 ? 18 : size.width / 22,
            textColor: lightGrey,
          ),
        ],
      ),
    ),
  );
}

class OnBoardingModel {
  final String image;
  final String title;
  final String body;

  OnBoardingModel(
      {required this.image, required this.title, required this.body});
}
