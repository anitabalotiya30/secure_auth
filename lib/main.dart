import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_auth/features/email_auth/cubit/email_auth_cubit.dart';

import 'features/phone_auth/cubit/phone_auth_cubit.dart';
import 'helper/global.dart';
import 'services/dialog/dialog_x.dart';
import 'services/pref.dart';
import 'services/router/router_x.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  //initialize firebase & then ads in config
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // hive initialization
  await Pref.initializeHive();

  //enter full-screen
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  //for setting orientation to portrait only
  await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PhoneAuthCubit()),
        BlocProvider(create: (_) => EmailAuthCubit()),
        // BlocProvider(create: (_) => AddressCubit()),
        // BlocProvider(create: (_) => OrderCubit()),
      ],
      //
      child: MaterialApp.router(
        title: appName,
        debugShowCheckedModeBanner: false,

        // router
        routerConfig: RouterX.router,

        // global keys
        scaffoldMessengerKey: DialogX.snackbarKey,

        // theme
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            useMaterial3: false,
            fontFamily: 'Lato',

            //app bar
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0,
                centerTitle: true,
                iconTheme: IconThemeData(color: Colors.black),
                titleTextStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),

            //elevated button theme
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                    elevation: 0,
                    shape: const StadiumBorder(),
                    minimumSize: const Size.fromHeight(50),
                    textStyle: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w600))),

            //
            dividerTheme: const DividerThemeData(color: sColor, thickness: 1.2),

            //text field theme
            inputDecorationTheme: const InputDecorationTheme(
                contentPadding: EdgeInsets.all(16),
                hintStyle: TextStyle(fontSize: 14),

                //border
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none),

                //
                isDense: true,
                fillColor: sColor,
                filled: true)),
      ),
    );
  }
}
