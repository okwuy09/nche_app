import 'package:flutter/material.dart';
import 'package:nche/services/controller/places_controller.dart';
import 'package:nche/services/controller/wallet_controller.dart';
import 'package:nche/widget/colors.dart';
import 'package:provider/provider.dart';
import 'services/controller/agency_controller.dart';
import 'services/controller/appstate_controller.dart';
import 'view/onboarding/onboardingscreen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => PlacesController()),
    ChangeNotifierProvider(create: (_) => AgencyController()),
    ChangeNotifierProvider(create: (_) => AppStateController()),
    ChangeNotifierProvider(create: (_) => WalletController()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nche',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColor.primaryColor,
          background: AppColor.white,
        ),
        unselectedWidgetColor: AppColor.lightBlack.withOpacity(0.6),
        useMaterial3: true,
      ),
      home: const OnboardingPage(),
    );
  }
}
