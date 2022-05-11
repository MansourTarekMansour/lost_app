import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lost_app/authentication/data/repository/authentication_repository.dart';
import 'package:lost_app/authentication/data/repository/authentication_web_service.dart';
import 'package:lost_app/authentication/presentation/login/login_cubit/login_cubit.dart';
import 'package:lost_app/authentication/presentation/register/register_cubit/register_cubit.dart';
import 'package:lost_app/authentication/presentation/register/screen/register_screen.dart';
import 'package:lost_app/authentication/presentation/verify_mobile/verify_cubit/otp_cubit.dart';
import 'package:lost_app/presentations/add_person_data/add_person_cubit/add_person_cubit.dart';
import 'package:lost_app/presentations/home_layout/home_layout_cubit/home_cubit.dart';
import 'package:lost_app/presentations/on_boarding/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:lost_app/presentations/profile/profile_cubit/profile_cubit.dart';
import 'package:lost_app/presentations/route/router.dart';
import 'package:lost_app/presentations/search/search_cubit/search_cubit.dart';
import 'package:lost_app/presentations/setting/setting_cubit/setting_cubit.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRoutes;
  final Widget widget;
  final addPersonDataBloc = AddPersonDataCubit();
  final searchCubit = SearchCubit();
  final settingCubit = SettingCubit();
  final verifyCubit = OtpCubit();
  final profileCubit = ProfileCubit();
  final homeLayoutCubit = HomeLayoutCubit();

  MyApp({Key? key, required this.appRoutes, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnBoardingCubit()),
        BlocProvider(
          create: (context) =>
              LoginCubit(AuthenticationRepository(AuthenticationWebService())),
        ),
        BlocProvider(
          create: (_) => RegisterCubit(
            AuthenticationRepository(AuthenticationWebService()),
          ),
          child: RegisterScreen(),
        ),
        BlocProvider(create: (context) => addPersonDataBloc),
        BlocProvider(create: (context) => searchCubit),
        BlocProvider(create: (context) => settingCubit),
        BlocProvider(create: (context) => verifyCubit),
        BlocProvider(create: (context) => profileCubit),
        BlocProvider(create: (context) => homeLayoutCubit),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRoutes.generateRoute,
        // to make app all support  arabic language
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar', ''),
        ],
        home: widget,
      ),
    );
  }
}
