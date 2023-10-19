// shorten tha avatar asset route

import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:nche/model/payment.dart';
import 'package:nche/model/transaction.dart';
import 'package:nche/model/wallet.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

String avatar(String avatarName) {
  String avatarUrl = 'assets/avatar/$avatarName.png';
  return avatarUrl;
}

Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
      .buffer
      .asUint8List();
}

const googleApiKey = 'AIzaSyDGGeVU35neK9m5l_GdCnP8u09zxSe3kJg';

// list of days in a week
const weekDays = [
  "Mon",
  "Tue",
  "Wed",
  "Thu",
  "Fri",
  "Sat",
  "Sun",
];

// list of months in a year
List<String> months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];
//EN
timeEn(String dateTime, {bool numberDate = true}) {
  DateTime date = DateTime.parse(dateTime);
  final dateNow = DateTime.now();
  final difference = dateNow.difference(date);
  if ((difference.inDays / 365).floor() >= 2) {
    return '${(difference.inDays / 365).floor()} Years Ago';
  } else if ((difference.inDays / 365).floor() >= 1) {
    return (numberDate) ? '1 Years Ago' : 'Last Year';
  } else if ((difference.inDays / 30).floor() >= 2) {
    return '${(difference.inDays / 30).floor()} Months Ago';
  } else if ((difference.inDays / 30).floor() >= 1) {
    return (numberDate) ? '1 Month Ago' : 'Last Month';
  } else if ((difference.inDays / 7).floor() >= 2) {
    return '${(difference.inDays / 7).floor()} Weeks Ago';
  } else if ((difference.inDays / 7).floor() >= 1) {
    return (numberDate) ? '1 Week Ago' : 'Last Week';
  } else if (difference.inDays >= 2) {
    return '${difference.inDays} Days Ago';
  } else if (difference.inDays >= 1) {
    return (numberDate) ? '1 Day Ago' : 'Yesterday';
  } else if (difference.inHours >= 2) {
    return '${difference.inHours} Hours Ago';
  } else if (difference.inHours >= 1) {
    return (numberDate) ? '1 Hour Ago' : 'Last Hour';
  } else if (difference.inMinutes >= 2) {
    return '${difference.inMinutes} Minutes Ago';
  } else if (difference.inMinutes >= 1) {
    return (numberDate) ? '1 Minute Ago' : 'Last Minute';
  } else if (difference.inSeconds >= 3) {
    return '${difference.inSeconds} Seconds Ago';
  } else {
    return 'Now';
  }
}

// timeEn('2020-09-10 20:05:14');

/// List of user wallet
List<Wallet> wallet = [
  Wallet(
    name: 'AVAILABLE WALLET BALANCE',
    amount: '26,400',
    id: '0',
    locked: false,
  ),
  Wallet(
    name: 'LOCKED WALLET BALANCE',
    amount: '10,400',
    id: '1',
    locked: true,
  ),
];

/// List Of Payment Method
List<PaymentMethod> paymentMethod = [
  PaymentMethod(
    assetsImage: 'assets/bank.png',
    title: 'Bank Transfer',
    subTitle: 'Usually arrives within 24 hours',
    type: 'transfer',
  ),
  PaymentMethod(
    assetsImage: 'assets/card.png',
    title: 'Credit/Debit Card',
    subTitle: 'Usually arrives under 5 mins',
    type: 'card',
  ),
];

//// Dummy data list of tramsactions
List<Transactions> transactionHistry = [
  Transactions(
    id: '0',
    type: 'Token purchase',
    amount: '20,500',
    status: 'Successful',
    date: DateTime.now(),
    isCredited: true,
  ),
  Transactions(
    id: '0',
    type: 'Token withdrawal',
    amount: '5000',
    status: 'Successful',
    date: DateTime.now(),
    isCredited: false,
  ),
  Transactions(
    id: '0',
    type: 'Received from 0xLbcfr7sA3333yuuyyuyyffguyuyuuutrrwwrwrwrwrwrwrr',
    amount: '5000',
    status: 'Successful',
    date: DateTime.now(),
    isCredited: true,
  ),
  Transactions(
    id: '0',
    type: 'Sent to 1Lbcfr7sAHTD9Cg...',
    amount: '5000',
    status: 'Successful',
    date: DateTime.now(),
    isCredited: false,
  ),
];

successTopSnackBar({context, String? message}) {
  return showTopSnackBar(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    Overlay.of(context),
    CustomSnackBar.success(
      message: message!,
      messagePadding: const EdgeInsets.only(left: 60, right: 30),
      icon: Icon(
        CupertinoIcons.checkmark_square_fill,
        color: AppColor.white,
      ),
      textStyle: style.copyWith(
        fontSize: 14,
        color: AppColor.white,
        fontWeight: FontWeight.w500,
      ),
      iconRotationAngle: 0,
      iconPositionTop: -7,
      iconPositionLeft: 30,
      borderRadius: BorderRadius.circular(12),
      backgroundColor: AppColor.green,
      textAlign: TextAlign.left,
    ),
  );
}
