import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nche/constant.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';

import '../people_detail.dart';

class PeopleWidget extends StatelessWidget {
  const PeopleWidget({super.key, required this.length});
  final int length;
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
            builder: (_) => const PeopleDetail(),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 5,
          ),
          color: AppColor.white,
          margin: const EdgeInsets.only(bottom: 4),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(children: [
                CircleAvatar(
                  radius: 23,
                  backgroundImage: AssetImage(avatar('Avatar${i + 1}')),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Benjiro896',
                      style: style.copyWith(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '3 Reports in 24hrs • 12 News in 24hrs',
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
