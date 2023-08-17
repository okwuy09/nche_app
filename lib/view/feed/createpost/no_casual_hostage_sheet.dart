import 'package:flutter/material.dart';
import 'package:nche/services/controller/appstate_controller.dart';
import 'package:nche/widget/button.dart';
import 'package:nche/widget/mytextform.dart';
import 'package:nche/widget/popover.dart';
import 'package:provider/provider.dart';
import '../../../widget/colors.dart';
import '../../../widget/style.dart';

class NumCasualtyHostage extends StatefulWidget {
  const NumCasualtyHostage({super.key});

  @override
  State<NumCasualtyHostage> createState() => _NumCasualtyHostageState();
}

final TextEditingController _numCasualties = TextEditingController();
final TextEditingController _numHostage = TextEditingController();

class _NumCasualtyHostageState extends State<NumCasualtyHostage> {
  @override
  void dispose() {
    _numCasualties.clear();
    _numHostage.clear();
    super.dispose();
  }

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
                  'No of Casualties & Hostages',
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
              'Number of Casualties',
              style: style.copyWith(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: AppColor.black,
              ),
            ),
            const SizedBox(height: 8),
            MyTextForm(
              controller: _numCasualties,
              obscureText: false,
              labelText: '0',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Number of Hostages',
              style: style.copyWith(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: AppColor.black,
              ),
            ),
            const SizedBox(height: 8),
            MyTextForm(
              controller: _numHostage,
              obscureText: false,
              labelText: '0',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 50,
            ),
            MainButton(
              borderColor: Colors.transparent,
              backgroundColor: AppColor.primaryColor,
              onTap: () {
                appState.getCasualandHostage.clear();
                appState.addCasualandHostageTag(
                    '${_numCasualties.text.isEmpty ? 0 : _numCasualties.text}  Casualties');
                appState.addCasualandHostageTag(
                    '${_numHostage.text.isEmpty ? 0 : _numHostage.text}  Hostage');
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
}
