import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/modules/profile/ui/profile.dart';
import 'package:lost_app/modules/route/route_constants.dart';
import 'package:lost_app/shared/components/appbar_widget.dart';
import 'package:lost_app/modules/home/ui/home.dart';
import 'package:lost_app/modules/post/ui/post.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class HomeLayoutScreen extends StatefulWidget {
  @override
  _HomeLayoutScreenState createState() => _HomeLayoutScreenState();
}

class _HomeLayoutScreenState extends State<HomeLayoutScreen> {
  Color bottomNavBarAccColor = grey;
  Color bottomNavBarHomeColor = bottomNavBarBlue;
  int indexPage = 0;
  Map<int, PreferredSizeWidget> appBar = {
    0: HomePageAppBar(),
    1: AccountPageAppBar(),
  };
  Map<int, Widget> page = {
    0: HomeClass(),
    1: ProfileClass(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar[indexPage],
      body: page[indexPage],

      floatingActionButton: FloatingActionButton(
        backgroundColor: bottomNavBarBlue,
        //Floating action button on Scaffold
        onPressed: () {
          navigateTo(context, RouteConstant.postRoute);
        },
        child: SvgPicture.asset('assets/icons/post.svg',
           color: white
        ),

        //icon inside button
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floating action button position to center

      bottomNavigationBar: BottomAppBar(
        //bottom navigation bar on scaffold
        color: white,
        shape: CircularNotchedRectangle(),
        elevation: 10.0,
        //shape of notch
        notchMargin: 10,
        child: Container(
          height: 67,
          child: Row(
            //children inside bottom appbar
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      children: [
                        IconButton(
                          iconSize: 10,
                          highlightColor: black,
                          icon: SvgPicture.asset('assets/icons/account.svg',
                              color: bottomNavBarAccColor),
                          onPressed: null,
                        ),
                        TextClass(
                          text: 'حسابي',
                          textColor: bottomNavBarAccColor,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      if (indexPage != 1) {
                        bottomNavBarAccColor = bottomNavBarBlue;
                        bottomNavBarHomeColor = grey;
                        indexPage = 1;
                      }
                    });
                  },
                ),
              ),
              SizedBox(
                width: 80,
              ),
              Expanded(
                child: FlatButton(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      children: [
                        IconButton(
                          iconSize: 10,
                          icon: SvgPicture.asset('assets/icons/home.svg',
                              color: bottomNavBarHomeColor),
                          onPressed: null,
                        ),
                        TextClass(
                          text: 'الرئيسيه',
                          textColor: bottomNavBarHomeColor,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      if (indexPage != 0) {
                        bottomNavBarHomeColor = bottomNavBarBlue;
                        bottomNavBarAccColor = grey;
                        indexPage = 0;
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
