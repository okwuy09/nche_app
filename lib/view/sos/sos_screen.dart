import 'package:flutter/material.dart';
import 'package:nche/view/sos/add_contact.dart';
import 'package:nche/view/sos/panic_shotcuts.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';

class SosScreen extends StatefulWidget {
  const SosScreen({Key? key}) : super(key: key);
  @override
  State<SosScreen> createState() => _SosScreenState();
}

class _SosScreenState extends State<SosScreen> {
  bool selected = false;
  bool bottonComplete = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        elevation: 0.5,
        surfaceTintColor: AppColor.white,
        shadowColor: AppColor.white,
        backgroundColor: AppColor.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            //const BackNav(),
            const SizedBox(
              height: 46,
              width: 46,
            ),
            Expanded(child: Container()),
            Text(
              'Panic Button',
              style: style.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: AppColor.black,
              ),
            ),
            Expanded(child: Container()),
            GestureDetector(
              onTap: () => showModalBottomSheet(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                context: context,
                builder: (_) => const PanicShortcuts(),
              ),
              child: Container(
                height: 46,
                width: 46,
                decoration: BoxDecoration(
                  color: AppColor.lightGrey,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                    child: Icon(
                  Icons.more_vert,
                  color: AppColor.black,
                )),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SOS button
            Container(
              height: 310,
              width: double.infinity,
              alignment: Alignment.center,
              child: Stack(
                children: [
                  AnimatedContainer(
                    height: selected ? 290 : 270,
                    width: selected ? 290 : 270,
                    duration: const Duration(seconds: 3),
                    curve: Curves.easeInBack,
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: AppColor.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(300),
                    ),
                  ),
                  Positioned(
                    top: 63,
                    right: 44,
                    child: Stack(
                      children: [
                        AnimatedContainer(
                          height: selected ? 200 : 180,
                          width: selected ? 200 : 180,
                          duration: const Duration(seconds: 3),
                          curve: Curves.easeInBack,
                          decoration: BoxDecoration(
                            color: AppColor.red.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(150),
                          ),
                        ),
                        Positioned(
                          top: 41,
                          left: 0,
                          right: 0,
                          child: Column(
                            children: [
                              // sos button to be clicked
                              GestureDetector(
                                child: AnimatedContainer(
                                  height: selected ? 115 : 95,
                                  width: selected ? 115 : 95,
                                  duration: const Duration(seconds: 3),
                                  curve: Curves.easeInBack,
                                  decoration: BoxDecoration(
                                    color: selected
                                        ? AppColor.green
                                        : AppColor.red,
                                    borderRadius: BorderRadius.circular(150),
                                  ),
                                  child: Center(
                                    child: bottonComplete
                                        ? Icon(Icons.check,
                                            size: 60, color: AppColor.white)
                                        : Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'SOS',
                                                style: style.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColor.white,
                                                  fontSize: 24,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 2,
                                              ),
                                              Text(
                                                'Tap Here',
                                                style: style.copyWith(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.normal,
                                                  color: AppColor.white
                                                      .withOpacity(0.6),
                                                ),
                                              )
                                            ],
                                          ),
                                  ),
                                  onEnd: () {
                                    // Sent panic button notification to users on Animation complete
                                    setState(() {
                                      selected
                                          ? bottonComplete = !bottonComplete
                                          : bottonComplete = false;
                                    });
                                    bottonComplete
                                        ? setState(() {
                                            selected = false;
                                          })
                                        : null;
                                  },
                                ),
                                onLongPress: () {
                                  setState(() {
                                    selected = false;
                                  });
                                },
                                onTap: () {
                                  setState(() {
                                    selected = true;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenSize.height * 0.14),
            Container(
              height: 150,
              margin: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColor.lightBlue,
                border: Border.all(
                  color: AppColor.white.withOpacity(0.1),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Add Emergency\nNumber',
                        style: style.copyWith(
                          color: AppColor.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Expanded(child: Container()),

                      // add new contact button
                      GestureDetector(
                        onTap: () => showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          context: context,
                          builder: (_) => const AddContact(),
                        ),
                        child: Container(
                            height: 54,
                            width: 54,
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(19),
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/adduser.png',
                                height: 24,
                                width: 24,
                                color: AppColor.white,
                              ),
                            )),
                        // onTap: () {
                        //   // if (provider.userData.emergencyContact!.length < 5) {
                        //   //   showModalBottomSheet(
                        //   //     context: context,
                        //   //     backgroundColor: Colors.transparent,
                        //   //     isScrollControlled: true,
                        //   //     builder: ((_) => const AddEmergencyContact()),
                        //   //   );
                        //   // } else {
                        //   //   handleFireBaseAlert(
                        //   //     message:
                        //   //         ' Sorry You can\'t add more than Five(5) Emergency contact',
                        //   //     context: context,
                        //   //   );
                        //   // }
                        // },
                      )
                    ],
                  ),

                  //
                  Expanded(child: Container()),
                  GestureDetector(
                    child: Text(
                      'View Emergency Contacts',
                      style: style.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColor.black,
                        fontSize: 12,
                      ),
                    ),
                    onTap: () => {},
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (_) => const EmergencyContact(),
                    //   ),
                    // ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
