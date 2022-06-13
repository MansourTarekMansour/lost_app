import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/post/create_post_cubit/create_post_cubit.dart';
import 'package:lost_app/shared/components/alert_dialog_class.dart';
import 'package:lost_app/shared/components/text_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class PostNotFoundDialog extends StatelessWidget {
  const PostNotFoundDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addPersonDataCubit = BlocProvider.of<CreatePostCubit>(context);

    return AlertDialogClass(
      height: 200,
      widget: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 20.0,
              right: 20.0,
              left: 20.0,
              bottom: 30,
            ),
            child: TextClass(
              text:
              'لم يتم العثور على أي نتائج سنقوم بحفظ البيانات المدخله في قاعدة البيانات وانشاء منشور',
            ),
          ),
          Container(
            height: 2,
            color: const Color.fromRGBO(200, 218, 245, 1),
          ),
        ],
      ),
      bottomWidget: Row(
        children: [
          Expanded(
            child: TextButtonClass(
              text: 'تعديل البيانات',
              fontSize: 18,
              textColor: lightGrey,
              onPressed: () {
                Navigator.pop(context);

              },
            ),
          ),
          Container(
            width: 2,
            color: const Color.fromRGBO(200, 218, 245, 1),
          ),
          Expanded(
            child: TextButtonClass(
              text: 'نشر',
              fontSize: 18,
              textColor: mainColor,
              onPressed: () {
                addPersonDataCubit.createPost();
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
      isDoneIcon: false,
    );
  }
}
