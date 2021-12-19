import 'package:flutter/material.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';
import 'package:lottie/lottie.dart';

class ProcessingPage extends StatefulWidget {
  @override
  ProcessingPageState createState() => ProcessingPageState();
}

class ProcessingPageState extends State<ProcessingPage>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/processing.json', fit: BoxFit.fitWidth,),
            TextClass(text: 'برجاء الانتظار', fontSize: 22,),
            SizedBox(height: 40),
            TextClass(text: 'نقوم بتحليل الصورة ومن ثم البحث في', textColor: grey,),
            TextClass(text: 'قاعدة البيانات التي تحتوي على العديد من', textColor: grey,),
            TextClass(text: 'الصور لاشخاص مفقودين', textColor: grey,),
          ],
        ),
      ),
    );
  }
}
