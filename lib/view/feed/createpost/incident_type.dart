import 'package:flutter/material.dart';
import 'package:nche/services/controller/appstate_controller.dart';
import 'package:nche/widget/popover.dart';
import 'package:provider/provider.dart';
import '../../../widget/colors.dart';
import '../../../widget/style.dart';

class IncidentTypeSheet extends StatefulWidget {
  const IncidentTypeSheet({super.key});

  @override
  State<IncidentTypeSheet> createState() => _IncidentTypeSheetState();
}

class _IncidentTypeSheetState extends State<IncidentTypeSheet> {
  String _isSeclected = '';
  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppStateController>(context);
    var size = MediaQuery.sizeOf(context);
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
                  'Type of Incident',
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
            ListView.builder(
              itemCount: appState.incidentList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(
                        () => _isSeclected = appState.incidentList[index],
                      );
                      appState.setIncident(_isSeclected);
                    },
                    child: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                          left: 10,
                          top: 10,
                          right: 8,
                          bottom: 10,
                        ),
                        decoration: BoxDecoration(
                          color: appState.getIncident ==
                                  appState.incidentList[index]
                              ? AppColor.lightBlue
                              : AppColor.lightGrey,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: appState.getIncident ==
                                    appState.incidentList[index]
                                ? AppColor.primaryColor
                                : AppColor.lightGrey,
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: size.width / 1.45,
                              child: Text(
                                appState.incidentList[index],
                                style: style.copyWith(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Expanded(child: Container()),
                            SizedBox(
                              height: 24.0,
                              width: 24.0,
                              child: Theme(
                                data: ThemeData(
                                  unselectedWidgetColor:
                                      AppColor.lightBlack.withOpacity(0.2),
                                ),
                                child: Checkbox(
                                  shape: const CircleBorder(),
                                  value: appState.getIncident ==
                                      appState.incidentList[index],
                                  checkColor: AppColor.white,
                                  activeColor: AppColor.primaryColor,
                                  onChanged: (value) {
                                    setState(
                                      () => _isSeclected =
                                          appState.incidentList[index],
                                    );
                                    appState.setIncident(_isSeclected);
                                  },
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
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
