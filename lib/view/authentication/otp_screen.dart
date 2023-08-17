import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nche/view/authentication/stepper/stepper.dart';
import 'package:nche/widget/button.dart';
import 'package:nche/widget/mytextform.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../widget/back_nav.dart';
import '../../widget/colors.dart';
import '../../widget/style.dart';

class OTPVerification extends StatefulWidget {
  final String phone;
  const OTPVerification({super.key, required this.phone});

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

final TextEditingController _otpNumber = TextEditingController();

class _OTPVerificationState extends State<OTPVerification> {
  Timer? _timer;
  int _start = 60;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start != 0) {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    _otpNumber.clear();
    super.dispose();
  }

  var maskFormatter = MaskTextInputFormatter(
      mask: '###-###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.only(
            right: 15,
            left: 15,
            top: 50,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackNav(),
              const SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Enter OTP',
                  style: style.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'A 6-Digit OTP has been sent to your\nphone number',
                  style: style.copyWith(
                    color: AppColor.darkerGrey,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: size.height / 15,
              ),
              MyTextForm(
                controller: _otpNumber,
                obscureText: false,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                labelText: '000 - 000',
                inputFormatters: [maskFormatter],
              ),
              SizedBox(
                height: size.height / 3,
              ),
              MainButton(
                backgroundColor: _otpNumber.text.isNotEmpty
                    ? AppColor.primaryColor
                    : AppColor.primaryColorLight,
                borderColor: Colors.transparent,
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 14,
                    color: _otpNumber.text.isNotEmpty
                        ? AppColor.white
                        : AppColor.lightGrey.withOpacity(0.5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  /// get unmasktext
                  //maskFormatter.getUnmaskedText()
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (_) => const StepperPage(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Resend code after 60 seconds textbutton
                  // button is disabled within the 60 seconds
                  Text(
                    'Didn’t receive the OTP?',
                    style: style.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: _start == 0
                        ? () async => Navigator.pushReplacement(
                              context,
                              CupertinoPageRoute(
                                builder: (_) =>
                                    OTPVerification(phone: widget.phone),
                              ),
                            )
                        : null,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.lightGrey,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Resend',
                            style: style.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: _start == 0
                                  ? AppColor.primaryColor
                                  : AppColor.darkgrey,
                            ),
                          ),
                          // Text widget to dispay the count down timer

                          Text(
                            _start == 0 ? ' OTP' : " in ${_start.toString()}s",
                            style: style.copyWith(
                              color: _start == 0
                                  ? AppColor.primaryColor
                                  : AppColor.darkgrey,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
