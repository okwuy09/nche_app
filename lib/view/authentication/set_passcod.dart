// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:nche/widget/button.dart';
// import 'package:nche/widget/mytextform.dart';
// import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
// import '../../widget/colors.dart';
// import '../../widget/style.dart';

// class SetPasscode extends StatefulWidget {
//   const SetPasscode({super.key});

//   @override
//   State<SetPasscode> createState() => _SetPasscodeState();
// }

// final TextEditingController _passcode = TextEditingController();
// final TextEditingController _confirmPasscode = TextEditingController();
// final _formKey = GlobalKey<FormState>();

// class _SetPasscodeState extends State<SetPasscode> {
//   bool obscurePasscode = true;
//   bool obscureConfirmPasscode = true;
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _confirmPasscode.clear();
//     _passcode.clear();
//     super.dispose();
//   }

//   var maskFormatter = MaskTextInputFormatter(
//       mask: '####',
//       filter: {"#": RegExp(r'[0-9]')},
//       type: MaskAutoCompletionType.lazy);

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.only(
//           right: 15,
//           left: 15,
//           top: 70,
//         ),
//         child: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 //const BackNav(),
//                 Align(
//                   alignment: Alignment.center,
//                   child: Text(
//                     'Set your passcode',
//                     style: style.copyWith(
//                       fontSize: 24,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 6,
//                 ),
//                 Align(
//                   alignment: Alignment.center,
//                   child: Text(
//                     'Choose a 4-digit passcode',
//                     style: style.copyWith(
//                       color: AppColor.darkerGrey,
//                       fontSize: 15,
//                       fontWeight: FontWeight.normal,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: size.height / 20,
//                 ),
//                 Text(
//                   'Passcode',
//                   style: style.copyWith(
//                     fontSize: 14.0,
//                     fontWeight: FontWeight.w500,
//                     color: AppColor.black,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 MyTextForm(
//                   controller: _passcode,
//                   obscureText: obscurePasscode,
//                   textAlign: TextAlign.center,
//                   keyboardType: TextInputType.number,
//                   labelText: '0000',
//                   inputFormatters: [maskFormatter],
//                   suffixIcon: GestureDetector(
//                     onTap: () => setState(() {
//                       obscurePasscode = !obscurePasscode;
//                     }),
//                     child: Icon(
//                       obscurePasscode
//                           ? CupertinoIcons.eye_slash
//                           : CupertinoIcons.eye,
//                       color: AppColor.darkgrey,
//                     ),
//                   ),
//                   validatior: (value) {
//                     if (value!.length < 4 || value.isEmpty) {
//                       return 'Enter valid passcode';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   'Confirm Passcode',
//                   style: style.copyWith(
//                     fontSize: 14.0,
//                     fontWeight: FontWeight.w500,
//                     color: AppColor.black,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 MyTextForm(
//                   controller: _confirmPasscode,
//                   obscureText: obscureConfirmPasscode,
//                   textAlign: TextAlign.center,
//                   keyboardType: TextInputType.number,
//                   labelText: '0000',
//                   inputFormatters: [maskFormatter],
//                   suffixIcon: GestureDetector(
//                     onTap: () => setState(() {
//                       obscureConfirmPasscode = !obscureConfirmPasscode;
//                     }),
//                     child: Icon(
//                       obscureConfirmPasscode
//                           ? CupertinoIcons.eye_slash
//                           : CupertinoIcons.eye,
//                       color: AppColor.darkgrey,
//                     ),
//                   ),
//                   validatior: (value) {
//                     if (value != _passcode.text) {
//                       return 'Passcode do not match';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(
//                   height: size.height / 10,
//                 ),
//                 MainButton(
//                   backgroundColor: _passcode.text.isNotEmpty
//                       ? AppColor.primaryColor
//                       : AppColor.primaryColorLight,
//                   borderColor: Colors.transparent,
//                   child: Text(
//                     'Save Passcode',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: _passcode.text.isNotEmpty
//                           ? AppColor.white
//                           : AppColor.lightGrey.withOpacity(0.5),
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   onTap: () {
//                     /// get unmasktext
//                     //maskFormatter.getUnmaskedText()
//                     if (_formKey.currentState!.validate()) {}
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
