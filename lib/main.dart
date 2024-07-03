import 'package:fluttertest/constants.dart';
import 'package:fluttertest/core/utils/app_router.dart';
import 'package:fluttertest/core/utils/service_locator.dart';
import 'package:fluttertest/features/home/data/repos/home_repo_impl.dart';
import 'package:fluttertest/features/home/presentation/manager/featured_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setUpServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeatureddatasCubit(
            getIt<HomeRepoImpl>(),
          )..fetchFeatureddatas(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
