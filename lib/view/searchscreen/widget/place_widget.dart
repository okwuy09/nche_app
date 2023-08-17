import 'package:flutter/material.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';

import '../map_location.dart';

class PlaceWidget extends StatelessWidget {
  const PlaceWidget({super.key, required this.length});
  final int length;
  final String location = '9b Nza street, Independent layout';
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 15),
      physics: const BouncingScrollPhysics(),
      itemCount: length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const MapLocation(),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 8,
          ),
          color: AppColor.white,
          margin: const EdgeInsets.only(bottom: 4),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(children: [
                Image.asset(
                  'assets/location.png',
                  height: 25,
                  width: 22,
                  color: AppColor.black,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      location.length > 33
                          ? '${location.substring(0, 33)}...'
                          : location,
                      style: style.copyWith(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '22 km away  • 3 reports in 24hrs',
                      style: style.copyWith(
                        fontSize: 13.5,
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
                  child: Image.asset(
                    'assets/arrow_branch.png',
                    width: 24,
                    height: 24,
                    color: AppColor.primaryColor,
                  ),
                )
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
