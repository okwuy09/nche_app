import 'package:flutter/material.dart';
import 'package:nche/widget/button.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/mytextform.dart';
import 'package:nche/widget/style.dart';

class StepOne extends StatefulWidget {
  final PageController controller;
  final int index;
  const StepOne({Key? key, required this.controller, required this.index})
      : super(key: key);

  @override
  State<StepOne> createState() => _StepOneState();
}

TextEditingController _codeName = TextEditingController();

class _StepOneState extends State<StepOne> {
  final GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();
  bool isfetching = false;
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Form(
        key: _globalFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),

            Text(
              'Create a unique\ncodename',
              style: style.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'In order to keep your identity safe on the platform, you won’t use your real name, just a codename',
              style: style.copyWith(
                fontSize: 14,
                color: AppColor.darkerGrey,
              ),
            ),

            /// Create team field
            SizedBox(height: screensize.height / 15),

            MyTextForm(
                obscureText: false,
                labelText: 'ex: mockingbird007',
                autofillHints: const [AutofillHints.name],
                controller: _codeName,
                suffixIcon: isfetching
                    ? const SizedBox(
                        height: 2,
                        width: 2,
                        child: Center(
                          child: SizedBox(
                            height: 16,
                            width: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 3.0,
                            ),
                          ),
                        ),
                      )
                    : Icon(
                        Icons.check_circle,
                        color: AppColor.green,
                        size: 23,
                      ),
                validatior: (input) =>
                    (input!.isEmpty) ? "Your code name" : null,
                onChanged: (p0) => p0.isEmpty
                    ? setState(() {
                        isfetching = false;
                      })
                    : setState(() {
                        isfetching = true;
                      })),

            /// Button to continue
            SizedBox(height: screensize.height / 2.5),

            MainButton(
              backgroundColor: (_codeName.text.isNotEmpty)
                  ? AppColor.primaryColor
                  : AppColor.primaryColorLight,
              borderColor: Colors.transparent,
              onTap: () async {
                if (_globalFormKey.currentState!.validate()) {
                  widget.controller.animateToPage(
                    widget.index,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeIn,
                  );
                }
              },
              child: Text(
                'CONTINUE',
                style: TextStyle(
                  fontSize: 12,
                  color: (_codeName.text.isNotEmpty)
                      ? AppColor.white
                      : AppColor.lightGrey.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
