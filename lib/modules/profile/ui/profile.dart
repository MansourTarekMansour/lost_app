import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/modules/profile/profile_cubit/cubit.dart';
import 'package:lost_app/modules/profile/profile_cubit/states.dart';
import 'package:lost_app/shared/components/PostCard.dart';
import 'package:lost_app/shared/components/profile_details.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class ProfileClass extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Align(
            //alignment: Alignment.topCenter,
            child: Container(
              width: 500,
              color: white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ProfileDetails(),
                          SizedBox(height: 30),
                          TextClass(
                            text: 'المنشورات',
                            fontSize: size.width >= 500 ? 30 : size.width / 13,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  PostCard(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class AccountTextFormField extends StatelessWidget {
  final String text;
  final IconData icon;

  AccountTextFormField({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: lightBlue,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          // border: Border.all(
          //   color: black,
          //   width: 1,
          // ),
          shape: BoxShape.rectangle,
        ),
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: ListView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 7.0),
                    child: TextClass(
                      text: text,
                      fontSize: size.width >= 500 ? 18 : size.width / 22,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    iconSize: size.width >= 500 ? 25 : size.width / 20,
                    padding: const EdgeInsets.all(0.0),
                    icon: Icon(icon),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
