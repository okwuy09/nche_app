import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:nche/view/feed/reward/reward_confirm_sheet.dart';
import 'package:nche/view/homepage/widget/action_button.dart';
import 'package:nche/widget/back_nav.dart';
import 'package:file_picker/file_picker.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class ClaimReward extends StatefulWidget {
  const ClaimReward({Key? key}) : super(key: key);

  @override
  State<ClaimReward> createState() => _ClaimRewardState();
}

class _ClaimRewardState extends State<ClaimReward> {
  final TextEditingController _post = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  String isSeclected = '';
  List<File>? files = [];

  @override
  void dispose() {
    _post.clear();
    super.dispose();
  }

// Image file picker
  Future filePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'mov', 'mp4'],
    );

    if (result == null) return;

    files = result.paths.map((path) => File(path!)).toList();
    setState(() {});
  }

  Future<List<Uint8List>> videoTumbnail(List<File> file) async {
    List<Uint8List> image = [];
    for (var i = 0; i < file.length; i++) {
      final uint8list = await VideoThumbnail.thumbnailData(
        video: file[i].path,
        imageFormat: ImageFormat.JPEG,
        maxWidth:
            100, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
        quality: 80,
      );
      image.add(uint8list!);
    }

    return image;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        automaticallyImplyLeading: false,
        shadowColor: AppColor.white,
        surfaceTintColor: AppColor.white,
        elevation: 0.5,
        title: Row(
          children: [
            const BackNav(),
            Expanded(child: Container()),
            Text(
              'Claim Reward',
              style: style.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(flex: 2, child: Container()),
            TextButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      context: context,
                      builder: (_) => const ConfirmRewardSheet(),
                    );
                  }
                },
                child: Text(
                  'SUBMIT',
                  style: style.copyWith(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w800,
                    color: AppColor.primaryColor,
                  ),
                ))
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 80,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: size.width,
                    decoration: BoxDecoration(
                      color: AppColor.lightOrange,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.warning_rounded,
                          color: AppColor.yellow,
                          size: 26,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: size.width / 1.34,
                          child: RichText(
                              text: TextSpan(
                                  text:
                                      'Add evidences and other materials to support your claim.',
                                  style: style.copyWith(
                                    color: AppColor.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13.8,
                                  ),
                                  children: [
                                TextSpan(
                                  text:
                                      ' (Please don’t fabricate evidences as you might get in trouble for it)',
                                  style: style.copyWith(
                                    color: AppColor.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13.8,
                                  ),
                                ),
                              ])),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  // textfield for post
                  Container(
                    height: size.height / 3.5,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColor.lightBlack.withOpacity(0.2),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: _post,
                      style: style.copyWith(
                        color: AppColor.black.withOpacity(0.8),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      validator: (input) => (input!.isEmpty)
                          ? "Please write what happened"
                          : null,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: style.copyWith(
                          color: AppColor.lightBlack.withOpacity(0.4),
                          fontSize: 14,
                          overflow: TextOverflow.clip,
                        ),
                        hintText:
                            'Write a description or anything that might support your claim',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              // media attachment
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    // display media container,
                    Container(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 5.0,
                              mainAxisSpacing: 5.0,
                            ),
                            itemCount: files!.isEmpty
                                ? 0
                                : files!.length > 4
                                    ? 4
                                    : files!.length,
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  (files![index].path.endsWith('.mov') ||
                                          files![index].path.endsWith('.mp4'))
                                      ? Stack(
                                          children: [
                                            StreamBuilder<List<Uint8List>>(
                                                stream: videoTumbnail(files!)
                                                    .asStream(),
                                                builder: (context, snapshot) {
                                                  if (snapshot.hasData) {
                                                    return ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      child: Image.memory(
                                                        snapshot.data![index],
                                                        fit: BoxFit.cover,
                                                        width: 100,
                                                        height: 100,
                                                      ),
                                                    );
                                                  } else {
                                                    return Container();
                                                  }
                                                }),
                                            Positioned(
                                              top: 0,
                                              left: 0,
                                              right: 0,
                                              bottom: 0,
                                              child: Icon(
                                                Icons.play_circle_outline,
                                                color: AppColor.grey,
                                                size: 30,
                                              ),
                                            )
                                          ],
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            image: DecorationImage(
                                              image: FileImage(
                                                  File(files![index].path)),
                                              // : const AssetImage('assets/white.jpg')
                                              //     as ImageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                  index == 3
                                      ? Positioned(
                                          top: 0,
                                          left: 0,
                                          child: Container(
                                            width: 80,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              color: Colors.transparent
                                                  .withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                '+ ${files!.length - 4} ',
                                                style: style.copyWith(
                                                  fontSize: 30,
                                                  color: AppColor.white,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container()
                                ],
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // import media
                    Divider(
                      color: AppColor.lightBlack.withOpacity(0.15),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      width: size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: ActionButton(
                        assetImageURL: 'assets/gallery.png',
                        title: 'Add Pictures & Videos',
                        iconColor: AppColor.primaryColor,
                        textColor: AppColor.black,
                        onTap: () async => await filePicker(),
                        child: Container(),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Divider(
                      color: AppColor.lightBlack.withOpacity(0.15),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      width: size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: ActionButton(
                        assetImageURL: 'assets/record.png',
                        title: 'Add Audio Recording',
                        iconColor: AppColor.primaryColor,
                        textColor: AppColor.black,
                        onTap: () async => await filePicker(),
                        child: Container(),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Divider(
                      color: AppColor.lightBlack.withOpacity(0.15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
