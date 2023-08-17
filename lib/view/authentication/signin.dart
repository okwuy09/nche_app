import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:nche/view/homepage/bottom_navbar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import '../../widget/colors.dart';
import '../../widget/style.dart';
import 'locat_auth_api.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

signIn(context) {
  return screenLock(
    context: context,
    correctString: '1234',
    title: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Text(
        'Welcome back 👋',
        style: style.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        'Enter your 4-digit passcode to continue',
        style: style.copyWith(
          color: AppColor.darkerGrey,
          fontSize: 15,
          fontWeight: FontWeight.normal,
        ),
      ),
    ]),
    footer: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Forgot Passcode?',
              style: TextStyle(
                fontSize: 16,
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    ),
    config: ScreenLockConfig(
      backgroundColor: AppColor.white,
      buttonStyle: OutlinedButton.styleFrom(
        side: BorderSide.none,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            side: BorderSide.none, borderRadius: BorderRadius.circular(26)),
        foregroundColor: AppColor.black,
        backgroundColor: AppColor.lightGrey,
      ),
    ),
    keyPadConfig: KeyPadConfig(
        buttonConfig: KeyPadButtonConfig(
      fontSize: 20,
      buttonStyle: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
        foregroundColor: AppColor.black,
        backgroundColor: AppColor.lightGrey,
      ),
    )),
    secretsConfig: SecretsConfig(
      spacing: 15, // or spacingRatio
      padding: const EdgeInsets.all(40),
      secretConfig: SecretConfig(
        borderSize: 2.0,
        disabledColor: AppColor.grey,
        enabledColor: AppColor.black,
        size: 12,
        builder: (context, config, enabled) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: enabled ? config.enabledColor : config.disabledColor,
          ),
          padding: const EdgeInsets.all(10),
          width: config.size,
          height: config.size,
        ),
      ),
    ),
    customizedButtonChild: const Icon(
      Icons.fingerprint,
    ),
    customizedButtonTap: () async {
      final isAuthenticated = await LocalAuthApi.authenticate();
      if (isAuthenticated) {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(builder: (_) => const BottomNavBar()),
        );
      }
    },
    onUnlocked: () => Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (_) => const BottomNavBar()),
    ),
    onError: (value) => showTopSnackBar(
      padding: const EdgeInsets.all(0),
      Overlay.of(context),
      CustomSnackBar.error(
        message: "You have entered a wrong passcode",
        messagePadding: const EdgeInsets.only(left: 24, right: 15),
        icon: Icon(
          CupertinoIcons.info_circle_fill,
          color: AppColor.white,
        ),
        textStyle: style.copyWith(
          fontSize: 14,
          color: AppColor.white,
          fontWeight: FontWeight.w500,
        ),
        iconRotationAngle: 0,
        iconPositionTop: -7,
        iconPositionLeft: 40,
        borderRadius: BorderRadius.zero,
        backgroundColor: AppColor.red,
      ),
    ),
  );
}
