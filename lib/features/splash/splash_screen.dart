import 'package:flutter/material.dart';
import 'package:secure_auth/services/router/router_name.dart';
import 'package:secure_auth/services/router/router_x.dart';

import '../../helper/global.dart';
import '../../widgets/custom_loading.dart';
import '../../widgets/logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    //
    Future.delayed(const Duration(milliseconds: 1000),
        () => RouterX.router.goNamed(RouteName.authPhone.name));
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);

    //
    return const Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            Spacer(flex: 2),

            //logo
            Logo(),

            Spacer(),

            //loading
            CustomLoading(
              color: Colors.black,
            ),

            Spacer(),
          ],
        ),
      ),
    );
  }
}
