import 'package:flutter/cupertino.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';
import '../agency_detail.dart';

class AgencyWidget extends StatelessWidget {
  AgencyWidget({super.key, required this.length});
  final int length;
  final assetImages = [
    'assets/police.png',
    'assets/frsc.png',
    'assets/fireservice.png',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 15),
      physics: const BouncingScrollPhysics(),
      itemCount: length,
      itemBuilder: (context, i) => GestureDetector(
        onTap: () => Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (_) => const AgencyDetail(),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 5,
          ),
          margin: const EdgeInsets.only(bottom: 4),
          color: AppColor.white,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(children: [
                Image.asset(
                  assetImages[i],
                  width: 40,
                  height: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Abakpa cantonment',
                      style: style.copyWith(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'FG79+V5P, GRA 400103, Enugu, Nigeria',
                      style: style.copyWith(
                        fontSize: 13.2,
                        fontWeight: FontWeight.w500,
                        color: AppColor.lightBlack.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Icon(
                    CupertinoIcons.forward,
                    size: 20,
                    color: AppColor.lightBlack,
                  ),
                ),
              ]),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
