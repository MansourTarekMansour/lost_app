import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/modules/on_boarding/on_boarding_cubit/states.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingInitialState());

  static OnBoardingCubit get(context) => BlocProvider.of(context);
  String buttonText = 'التالي';
  bool isLastPage = false;



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

  changeTextButton(bool changeText) {
    emit(ChangeButtonTextSuccess());
    (changeText) ? buttonText = 'هيا نبدأ' : buttonText = 'التالي';
  }

}

class OnBoardingModel {
  final String image;
  final String title;
  final String body;

  OnBoardingModel(
      {required this.image, required this.title, required this.body});
}
