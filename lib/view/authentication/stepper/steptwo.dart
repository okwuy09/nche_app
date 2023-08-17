import 'package:flutter/material.dart';
import 'package:nche/model/avatar.dart';
import 'package:nche/widget/button.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';

class StepTwo extends StatefulWidget {
  final PageController controller;
  final int index;
  const StepTwo({Key? key, required this.controller, required this.index})
      : super(key: key);

  @override
  State<StepTwo> createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {
  String pickedAvatar = '';
  List<Avatar> avatar = [
    Avatar(
      id: '0',
      name: 'Avatar1',
      imageURL: 'assets/avatar/Avatar1.png',
    ),
    Avatar(
      id: '1',
      name: 'Avatar2',
      imageURL: 'assets/avatar/Avatar2.png',
    ),
    Avatar(
      id: '2',
      name: 'Avatar3',
      imageURL: 'assets/avatar/Avatar3.png',
    ),
    Avatar(
      id: '3',
      name: 'Avatar4',
      imageURL: 'assets/avatar/Avatar4.png',
    ),
    Avatar(
      id: '4',
      name: 'Avatar5',
      imageURL: 'assets/avatar/Avatar5.png',
    ),
    Avatar(
      id: '5',
      name: 'Avatar6',
      imageURL: 'assets/avatar/Avatar6.png',
    ),
    Avatar(
      id: '6',
      name: 'Avatar7',
      imageURL: 'assets/avatar/Avatar7.png',
    ),
    Avatar(
      id: '7',
      name: 'Avatar8',
      imageURL: 'assets/avatar/Avatar8.png',
    ),
    Avatar(
      id: '8',
      name: 'Avatar9',
      imageURL: 'assets/avatar/Avatar9.png',
    ),
    Avatar(
      id: '9',
      name: 'Avatar10',
      imageURL: 'assets/avatar/Avatar10.png',
    ),
    Avatar(
      id: '10',
      name: 'Avatar11',
      imageURL: 'assets/avatar/Avatar11.png',
    ),
    Avatar(
      id: '11',
      name: 'Avatar12',
      imageURL: 'assets/avatar/Avatar12.png',
    ),
    Avatar(
      id: '12',
      name: 'Avatar13',
      imageURL: 'assets/avatar/Avatar13.png',
    ),
    Avatar(
      id: '13',
      name: 'Avatar14',
      imageURL: 'assets/avatar/Avatar14.png',
    ),
    Avatar(
      id: '14',
      name: 'Avatar15',
      imageURL: 'assets/avatar/Avatar15.png',
    ),
    Avatar(
      id: '15',
      name: 'Avatar16',
      imageURL: 'assets/avatar/Avatar16.png',
    ),
    Avatar(
      id: '16',
      name: 'Avatar17',
      imageURL: 'assets/avatar/Avatar17.png',
    ),
    Avatar(
      id: '17',
      name: 'Avatar18',
      imageURL: 'assets/avatar/Avatar18.png',
    ),
    Avatar(
      id: '18',
      name: 'Avatar19',
      imageURL: 'assets/avatar/Avatar19.png',
    ),
    Avatar(
      id: '19',
      name: 'Avatar20',
      imageURL: 'assets/avatar/Avatar20.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          Text(
            'Choose a cool avatar',
            style: style.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'In order to keep your identity safe on the platform, you won’t use your real picture too, just an avatar.',
            style: style.copyWith(
              fontSize: 14,
              color: AppColor.darkerGrey,
            ),
          ),

          /// Avatar thumbnail
          GridView.builder(
            shrinkWrap: true,
            itemCount: avatar.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => {
                  setState(() {
                    pickedAvatar = avatar[index].name;
                  })
                },
                child: Stack(
                  children: [
                    Container(
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                        color: AppColor.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          width: 3,
                          color: pickedAvatar == avatar[index].name
                              ? AppColor.primaryColor
                              : Colors.transparent,
                        ),
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                            AppColor.white.withOpacity(0.9),
                            BlendMode.dstATop,
                          ),
                          image: AssetImage(
                            avatar[index].imageURL,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    pickedAvatar == avatar[index].name
                        ? Positioned(
                            bottom: 14,
                            right: screensize.width / 30,
                            child: CircleAvatar(
                              radius: 9,
                              backgroundColor: AppColor.primaryColor,
                              child: Center(
                                child: Icon(
                                  Icons.check,
                                  color: AppColor.white,
                                  size: 12,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
              );
            },
          ),

          /// Button to continue
          SizedBox(height: screensize.height / 20),

          MainButton(
            backgroundColor: pickedAvatar.isNotEmpty
                ? AppColor.primaryColor
                : AppColor.primaryColorLight,
            borderColor: Colors.transparent,
            onTap: pickedAvatar.isEmpty
                ? null
                : () {
                    widget.controller.animateToPage(
                      widget.index,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn,
                    );
                  },
            child: Text(
              'CONTINUE',
              style: style.copyWith(
                fontSize: 12,
                color: pickedAvatar.isNotEmpty
                    ? AppColor.white
                    : AppColor.lightGrey.withOpacity(0.5),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
