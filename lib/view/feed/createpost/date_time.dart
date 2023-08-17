import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nche/constant.dart';
import 'package:nche/services/controller/appstate_controller.dart';
import 'package:nche/widget/button.dart';
import 'package:nche/widget/datefield.dart';
import 'package:nche/widget/popover.dart';
import 'package:provider/provider.dart';
import '../../../widget/colors.dart';
import '../../../widget/style.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class DateAndTimeSheet extends StatefulWidget {
  const DateAndTimeSheet({super.key});

  @override
  State<DateAndTimeSheet> createState() => _DateAndTimeSheetState();
}

final TextEditingController _numCasualties = TextEditingController();
final TextEditingController _numHostage = TextEditingController();
final format = DateFormat.jm();

class _DateAndTimeSheetState extends State<DateAndTimeSheet> {
  @override
  void dispose() {
    _numCasualties.clear();
    _numHostage.clear();
    super.dispose();
  }

  DateTime date = DateTime.now();
  String time = format.format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppStateController>(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Popover(
        mainAxisSize: MainAxisSize.min,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Date & Time ',
                  style: style.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
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
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Divider(
              color: AppColor.lightGrey,
            ),
            const SizedBox(height: 20),
            Text(
              'Date',
              style: style.copyWith(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: AppColor.black,
              ),
            ),
            const SizedBox(height: 8),
            DateField(
              pickedDate:
                  '${weekDays[date.weekday - 1]}  ${date.day} ${months[date.month - 1]}, ${date.year}',
              onPressed: () => _pickDate(context, false),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Time',
              style: style.copyWith(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: AppColor.black,
              ),
            ),
            const SizedBox(height: 8),
            DateField(
              pickedDate: time,
              onPressed: () => _pickDate(context, true),
            ),
            const SizedBox(
              height: 50,
            ),
            MainButton(
              borderColor: Colors.transparent,
              backgroundColor: AppColor.primaryColor,
              onTap: () {
                var selectedDate =
                    '${weekDays[date.weekday - 1]}  ${date.day} ${months[date.month - 1]}, ${date.year}';
                appState.setDateTime('$selectedDate.  $time');
                Navigator.pop(context);
              },
              child: Text(
                'Submit',
                style: style.copyWith(
                  fontSize: 14,
                  color: AppColor.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }

  _pickDate(BuildContext ctx, bool istime) async {
    return showCupertinoModalPopup(
      context: ctx,
      barrierColor: Colors.transparent,
      builder: (_) => GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          height: 220,
          //color: AppColor.grey,
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 25,
          ),
          decoration: BoxDecoration(
            color: AppColor.grey,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: CupertinoDatePicker(
                    //backgroundColor: AppColor.grey,
                    mode: istime
                        ? CupertinoDatePickerMode.time
                        : CupertinoDatePickerMode.date,
                    initialDateTime: DateTime.now(),
                    dateOrder: DatePickerDateOrder.dmy,
                    use24hFormat: false,
                    onDateTimeChanged: (val) {
                      setState(() {
                        istime
                            ? time = TimeOfDay.fromDateTime(val).format(context)
                            : date = val;
                      });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
