import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/modules/notification/ui/notification.dart';
import 'package:lost_app/modules/setting/ui/setting.dart';
import 'package:lost_app/shared/components/component.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/styles/color.dart';




class HomePageAppBar extends StatefulWidget implements PreferredSizeWidget {
  HomePageAppBar({Key? key}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);
  TextEditingController homeAppBarController = TextEditingController();

  @override
  final Size preferredSize; // default is 56.0

  @override
  _HomePageAppBarState createState() => _HomePageAppBarState();
}

class _HomePageAppBarState extends State<HomePageAppBar>{

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: white,
      elevation: 0.0,
      toolbarHeight: 55,
      title: Container(
          decoration: BoxDecoration(
            color: white,
            //borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(height: 40),
              child: TextFormFieldClass(
                controller: widget.homeAppBarController,
                roundedRectangleBorder: 6,
                textHint: 'البحث...',

              ),
            ),
          )),
      leading: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: IconButton(
          iconSize: 2,
          icon:SvgPicture.asset('assets/icons/notification.svg',  color: black),
          onPressed: () =>navigateTo(context, NotificationScreen()),
        ),
      ),
    );
  }
}

class AccountPageAppBar extends StatefulWidget implements PreferredSizeWidget {
  AccountPageAppBar({Key? key}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);
  TextEditingController accAppBarController = TextEditingController();
  @override
  final Size preferredSize; // default is 56.0

  @override
  _AccountPageAppBarState createState() => _AccountPageAppBarState();
}

class _AccountPageAppBarState extends State<AccountPageAppBar>{

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: white,
      elevation: 0.0,
      toolbarHeight: 55,
      title: TextClass(
        text: 'الملف الشخصي',
        fontSize: 20,

      ),
      leading: Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: IconButton(
          iconSize: 28,
          color: black,
          icon: Icon(Icons.settings_rounded,),
          onPressed: () {
            navigateTo(context, SettingScreen());
          },
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: IconButton(
            iconSize: 28,
            color: black,
            icon:SvgPicture.asset('assets/icons/profile_acc_ic.svg'),

            onPressed: () {
            },
          ),
        ),
      ],
    );
  }
}