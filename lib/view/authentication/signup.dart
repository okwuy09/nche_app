import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:nche/view/authentication/signin.dart';
import 'package:nche/view/authentication/termandcon_sheet.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/mytextform.dart';
import 'package:nche/widget/style.dart';

import '../../model/phone.dart';
import '../../widget/button.dart';
import 'otp_screen.dart';

class SignUp extends StatefulWidget {
  final BuildContext ctx;
  const SignUp({super.key, required this.ctx});

  @override
  State<SignUp> createState() => _SignUpState();
}

final TextEditingController _phone = TextEditingController();
final _formKey = GlobalKey<FormState>();

class _SignUpState extends State<SignUp> {
  bool ischecked = false;
  PhoneNumber? selectedCountry;

  @override
  void initState() {
    selectedCountry = countryPhone[0];
    super.initState();
  }

  @override
  void dispose() {
    _phone.clear();
    super.dispose();
  }

  MaskTextInputFormatter formater() {
    var maskFormatter = MaskTextInputFormatter(
        mask: selectedCountry!.countryCode == '+234'
            ? '###-###-####'
            : selectedCountry!.countryCode == '+233' ||
                    selectedCountry!.countryCode == '+254'
                ? '###-###-###'
                : null,
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);
    return maskFormatter;
  }

  List countryPhone = [
    PhoneNumber(
      countryCode: '+234',
      countryFlag: 'assets/nigeria.png',
      countryName: 'Nigeria',
    ),
    PhoneNumber(
      countryCode: '+233',
      countryFlag: 'assets/ghana.png',
      countryName: 'Ghana',
    ),
    PhoneNumber(
      countryCode: '+254',
      countryFlag: 'assets/kenya.png',
      countryName: 'Kenya',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.only(
            top: 120,
            right: 15,
            left: 15,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Hey There!👋',
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
                    'Enter your phone number to continue',
                    style: style.copyWith(
                      color: AppColor.darkerGrey,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 15,
                ),

                Text(
                  'Phone Number',
                  style: style.copyWith(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: AppColor.black,
                  ),
                ),
                const SizedBox(height: 8),
                MyTextForm(
                  controller: _phone,
                  keyboardType: TextInputType.phone,
                  onChanged: (p0) => p0.replaceFirst(RegExp(r'^0+'), ''),
                  inputFormatters: [
                    formater(),
                    FilteringTextInputFormatter.deny(
                      RegExp(r'^0+'),
                    ),
                  ],
                  prefix: SizedBox(
                    width: 100,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<PhoneNumber>(
                        icon: Container(),
                        value: selectedCountry,
                        // Step 4.
                        items: countryPhone
                            .map<DropdownMenuItem<PhoneNumber>>((value) {
                          return DropdownMenuItem<PhoneNumber>(
                            value: value,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  CircleAvatar(
                                    radius: 12,
                                    backgroundImage:
                                        AssetImage(value.countryFlag),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    value.countryCode,
                                    style: style.copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                    ),
                                  )
                                ]),
                          );
                        }).toList(),
                        // Step 5.
                        onChanged: (PhoneNumber? newValue) {
                          setState(() {
                            selectedCountry = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                  obscureText: false,
                  labelText: '810-164-8490',
                  validatior: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Phone Number';
                    }
                    return null;
                  },
                ),

                ///
                SizedBox(height: size.height / 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: ischecked
                          ? null
                          : () => showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                isScrollControlled: true,
                                context: context,
                                builder: (_) => TeamsAndCondition(
                                    onTap: () => {
                                          setState(() {
                                            ischecked = !ischecked;
                                          }),
                                          Navigator.pop(context),
                                        }),
                              ),
                      child: Container(
                        height: 20,
                        width: 20,
                        margin: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: ischecked
                              ? AppColor.primaryColor
                              : AppColor.white,
                          border: Border.all(
                              width: 1.2,
                              color: ischecked
                                  ? AppColor.primaryColor
                                  : AppColor.darkgrey),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: ischecked
                              ? Icon(
                                  Icons.check_rounded,
                                  color: AppColor.white,
                                  size: 17,
                                )
                              : Container(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    RichText(
                      text: TextSpan(
                        text: 'Agree to the ',
                        style: style.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        children: [
                          TextSpan(
                            text: 'Terms and Conditions',
                            recognizer: TapGestureRecognizer()
                              ..onTap = ischecked
                                  ? null
                                  : () => showModalBottomSheet(
                                        backgroundColor: Colors.transparent,
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (_) => TeamsAndCondition(
                                            onTap: () => {
                                                  setState(() {
                                                    ischecked = !ischecked;
                                                  }),
                                                  Navigator.pop(context),
                                                }),
                                      ),
                            style: style.copyWith(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height / 30),
                MainButton(
                  backgroundColor: ischecked
                      ? AppColor.primaryColor
                      : AppColor.primaryColorLight,
                  borderColor: Colors.transparent,
                  onTap: !ischecked
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            /// get unmasktext
                            var number = selectedCountry!.countryCode +
                                formater().unmaskText(_phone.text);

                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (_) => OTPVerification(phone: number),
                              ),
                            );
                          }
                        },
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 14,
                      color: ischecked
                          ? AppColor.white
                          : AppColor.lightGrey.withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Have an account already?',
                      style: style.copyWith(
                        fontSize: 14.0,
                        wordSpacing: -1.5,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    GestureDetector(
                      onTap: () async => {
                        Navigator.pop(context),
                        await signIn(widget.ctx),
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          wordSpacing: -1,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
