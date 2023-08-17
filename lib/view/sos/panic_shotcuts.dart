import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nche/view/sos/widget/panicshot_cut_widget.dart';
import 'package:nche/widget/button.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/popover.dart';
import 'package:nche/widget/style.dart';

class PanicShortcuts extends StatefulWidget {
  const PanicShortcuts({super.key});

  @override
  State<PanicShortcuts> createState() => _PanicShortcutsState();
}

class _PanicShortcutsState extends State<PanicShortcuts> {
  bool isSwitchedOn = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Popover(
      mainAxisSize: MainAxisSize.min,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Panic Shortcuts',
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
          Container(
            height: 50,
            width: size.width,
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.lightBlue,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Activate shortcuts',
                  style: style.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColor.primaryColorDark,
                  ),
                ),
                Expanded(child: Container()),
                Transform.scale(
                  scale: 0.8,
                  child: CupertinoSwitch(
                    thumbColor: AppColor.white,
                    activeColor: AppColor.primaryColor,
                    value: isSwitchedOn,
                    onChanged: (value) {
                      setState(() {
                        isSwitchedOn = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          /// options
          PanicShortcutWidget(
            title: 'Tap volume up button twice',
            subTitle: 'Send emergency message for',
            incident: 'theft',
            active: isSwitchedOn,
            onTap: () {},
          ),
          Divider(
            color: AppColor.grey.withOpacity(0.6),
          ),
          PanicShortcutWidget(
            title: 'Tap Volume Up button three times',
            subTitle: 'Send emergency message for',
            incident: 'Kidnap',
            active: isSwitchedOn,
            onTap: () {},
          ),
          Divider(
            color: AppColor.grey.withOpacity(0.6),
          ),
          PanicShortcutWidget(
            title: 'Tap Volume Down button two times',
            subTitle: 'Send emergency message for',
            incident: 'Fire',
            active: isSwitchedOn,
            onTap: () {},
          ),
          Divider(
            color: AppColor.grey.withOpacity(0.6),
          ),
          PanicShortcutWidget(
            title: 'Tap Volume Down button three times',
            subTitle: 'Send emergency message for',
            incident: 'Arm Robbery',
            active: isSwitchedOn,
            onTap: () {},
          ),

          const SizedBox(
            height: 30,
          ),
          Container(
            height: 90,
            width: size.width,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isSwitchedOn
                  ? AppColor.lightRed
                  : AppColor.lightRed.withOpacity(0.4),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'NB:  Please endeavour to use shortcuts that can be easily remembered and for only serious emergencies that are within the categories in the app. Tap on the edit icon to easily modify shortcuts',
                style: style.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: isSwitchedOn
                      ? AppColor.golden
                      : AppColor.golden.withOpacity(0.3),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          MainButton(
            borderColor: Colors.transparent,
            backgroundColor: isSwitchedOn
                ? AppColor.primaryColor
                : AppColor.primaryColor.withOpacity(0.4),
            onTap: () {},
            child: Text(
              'Add extra shortcuts',
              style: style.copyWith(
                color: isSwitchedOn
                    ? AppColor.white
                    : AppColor.white.withOpacity(0.5),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
