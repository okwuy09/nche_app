import 'package:flutter/material.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/popover.dart';
import 'package:nche/widget/style.dart';

class ReportedAgency extends StatelessWidget {
  ReportedAgency({super.key});

  final List<String> agency = [
    'assets/police.png',
    'assets/fireservice.png',
    'assets/frsc.png',
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Popover(
      mainAxisSize: MainAxisSize.min,
      child: Column(children: [
        Row(
          children: [
            Text(
              'Agencies Reported to',
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
                )),
              ),
            ),
          ],
        ),
        Divider(
          color: AppColor.grey.withOpacity(0.8),
        ),
        const SizedBox(
          height: 20,
        ),
        ListView.builder(
          itemCount: agency.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, i) => Container(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(children: [
              Image.asset(
                agency[i],
                width: 40,
                height: 40,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width / 1.3,
                    child: Text(
                      'Area Command Headquarters',
                      style: style.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width / 1.3,
                    child: Text(
                      'Abakaliki Rd, New Haven, Enugu',
                      style: style.copyWith(
                        fontSize: 12,
                        color: AppColor.lightBlack.withOpacity(0.8),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ]),
    );
  }
}
