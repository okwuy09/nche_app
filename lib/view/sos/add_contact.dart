import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nche/widget/button.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/mytextform.dart';
import 'package:nche/widget/popover.dart';
import 'package:nche/widget/style.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

final TextEditingController _fullName = TextEditingController();
final TextEditingController _phone = TextEditingController();
final _formKey = GlobalKey<FormState>();

class _AddContactState extends State<AddContact> {
  @override
  void dispose() {
    _fullName.clear();
    _phone.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Popover(
        mainAxisSize: MainAxisSize.min,
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Add Contacts',
                      style: style.copyWith(
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Sora',
                        letterSpacing: 0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Expanded(child: Container()),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 46,
                        width: 46,
                        decoration: BoxDecoration(
                          color: AppColor.lightGrey,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                            child: Icon(
                          Icons.close,
                          color: AppColor.black,
                        )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Align(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColor.lightGrey,
                        child: Image.asset(
                          'assets/user2.png',
                          width: 35,
                          height: 35,
                          color: AppColor.black,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor:
                                AppColor.primaryColorLight.withOpacity(0.5),
                            child: Icon(
                              Icons.add,
                              color: AppColor.primaryColor,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Full Name',
                  style: style.copyWith(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: AppColor.black,
                  ),
                ),
                const SizedBox(height: 8),
                MyTextForm(
                  controller: _fullName,
                  obscureText: false,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r"[a-z A-Z.]")),
                  ],
                  labelText: 'ex Onyemah Isaac',
                  validatior: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter full name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
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
                  obscureText: false,
                  keyboardType: TextInputType.phone,
                  labelText: 'ex: 080****5756',
                  validatior: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Phone Number';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 35,
                ),
                MainButton(
                  borderColor: Colors.transparent,
                  backgroundColor: AppColor.primaryColor,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  child: Text(
                    'Add contact',
                    style: style.copyWith(
                      color: AppColor.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Add from contact list',
                      style: style.copyWith(
                        color: AppColor.primaryColorDark,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ]),
        ),
      ),
    );
  }
}
