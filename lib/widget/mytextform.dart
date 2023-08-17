import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';

class MyTextForm extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? Function(String?)? validatior;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Widget? prefix;
  final Iterable<String>? autofillHints;
  final TextAlign textAlign;
  final List<TextInputFormatter>? inputFormatters;
  const MyTextForm(
      {Key? key,
      required this.controller,
      this.validatior,
      this.onChanged,
      this.labelText,
      this.suffixIcon,
      this.inputFormatters,
      required this.obscureText,
      this.autofillHints,
      this.textAlign = TextAlign.start,
      this.prefix,
      this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: style.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColor.black,
      ),
      textAlign: textAlign,
      obscureText: obscureText,
      autofillHints: autofillHints,
      cursorColor: Colors.black54,
      keyboardType: keyboardType,
      controller: controller,
      onChanged: onChanged,
      validator: validatior,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
          fillColor: AppColor.lightGrey,
          filled: true,
          hintText: labelText,
          hintStyle: style.copyWith(
            fontSize: 13,
            color: AppColor.darkgrey,
            fontWeight: FontWeight.normal,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColor.red,
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 24.0),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColor.red,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 2,
              color: AppColor.primaryColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          suffixIcon: suffixIcon,
          //prefix: prefix,
          prefixIcon: prefix),
    );
  }
}
