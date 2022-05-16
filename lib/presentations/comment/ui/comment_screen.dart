import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:lost_app/presentations/comment/ui/comment_arguments.dart';


import 'package:lost_app/shared/components/comment_card.dart';

import 'package:lost_app/shared/components/text_class.dart';

import 'package:lost_app/shared/components/text_form_field_class.dart';

import 'package:lost_app/shared/styles/color.dart';

class CommentScreen extends StatelessWidget {
  final CommentArguments details;
  final TextEditingController commentController = TextEditingController();

  CommentScreen({required this.details});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp, color: black),
        ),
        iconTheme: const IconThemeData(
          color: black,
          //change your color here
        ),
      ),
      body: Container(
        color: white,
        child: Align(
          child: Stack(
            children: [
              Align(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      color: white,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          top: 5,
                          bottom: 15,
                        ),
                        child: Container(
                          //height: 1000.0,
                          decoration: BoxDecoration(
                            color: lightBlue,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 17.0,
                                  right: 15,
                                  left: 15,
                                  bottom: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        ClipOval(
                                          child: Image.asset(
                                            'assets/images/IMG20201116145812.jpg',
                                            width: size.width >= 500
                                                ? 40
                                                : size.width / 10,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(width: 10.0),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 10.0,
                                          ),
                                          child: TextClass(
                                            text: 'منصور طارق منصور',
                                            fontSize: size.width >= 500
                                                ? 20
                                                : size.width / 20,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.more_vert,
                                            size: size.width >= 500
                                                ? 30
                                                : size.width / 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10.0),
                                    const FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: TextClass(
                                        text: 'مفقود منذ 3 ايام فى دار السلام',
                                        textAlign: TextAlign.right,
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const SizedBox(height: 20.0),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: SizedBox(
                                            height: 100,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                TextClass(
                                                  text: 'الاسم : مصطفى عثمان',
                                                  textAlign: TextAlign.right,
                                                  fontSize: 15,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                TextClass(
                                                  text: 'السن : ٢٢',
                                                  textAlign: TextAlign.right,
                                                  fontSize: 15,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                TextClass(
                                                  text: 'الجنس : ذكر',
                                                  textAlign: TextAlign.right,
                                                  fontSize: 15,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                TextClass(
                                                  text:
                                                      'العنوان : المعادي - القاهره',
                                                  textAlign: TextAlign.right,
                                                  fontSize: 15,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                TextClass(
                                                  text:
                                                      'هاتف التواصل : 01145589134',
                                                  textAlign: TextAlign.right,
                                                  fontSize: 15,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0,),
                                                  child: Image.asset(
                                                    'assets/images/IMG20201115111300.jpg',
                                                    fit: BoxFit.cover,
                                                    //color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 2,
                                width: double.infinity,
                                color: white,
                              ),
                              Material(
                                color: lightBlue,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                                ),
                                child: InkWell(
                                  customBorder: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    ),
                                  ),
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextClass(
                                          text: 'مشاركه',
                                          fontSize: size.width >= 500
                                              ? 19
                                              : size.width / 18,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 5.0,
                                          ),
                                          child: SvgPicture.asset(
                                            'assets/icons/share_icon.svg',
                                            width: size.width >= 500
                                                ? 30
                                                : size.width / 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const CommentCard(),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 80,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        color: grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15, left: 15),
                          child: TextFormFieldClass(
                            autofocus: details.autofocus,
                            controller: commentController,
                            roundedRectangleBorder: 6,
                            textHint: 'اكتب تعليقا ...',
                            prefix: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(math.pi),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 4.0),
                                child: IconButton(
                                  icon: const Icon(Icons.send_rounded),
                                  iconSize: 30.0,
                                  color: bottomNavBarBlue,
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}