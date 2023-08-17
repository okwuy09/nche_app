import 'package:flutter/material.dart';
import 'package:nche/constant.dart';
import 'package:nche/model/transaction.dart';
import 'package:nche/widget/button.dart';
import 'package:nche/widget/popover.dart';
import '../../../widget/colors.dart';
import '../../../widget/style.dart';
import 'details_widget.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class TransactionDetails extends StatelessWidget {
  final Transactions transaction;
  const TransactionDetails({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Popover(
      mainAxisSize: MainAxisSize.min,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Transaction Details',
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
          const SizedBox(height: 10),
          Divider(
            color: AppColor.lightGrey,
          ),
          const SizedBox(height: 10),
          Container(
            height: 120,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.center,
                end: const Alignment(-0.3, -0.5),
                stops: const [0.0, 0.5, 0.5, 1],
                colors: transaction.isCredited
                    ? [
                        AppColor.green,
                        AppColor.green,
                        AppColor.green.withOpacity(0.9),
                        AppColor.green.withOpacity(0.9),
                      ]
                    : [
                        AppColor.red,
                        AppColor.red,
                        AppColor.red.withOpacity(0.9),
                        AppColor.red.withOpacity(0.9),
                      ],
                tileMode: TileMode.repeated,
              ),
            ),
            child: Center(
              child: Text(
                '${transaction.isCredited ? '+' : '-'}${transaction.amount}',
                style: style.copyWith(
                  fontSize: 30,
                  color: AppColor.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 200,
            width: size.width,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppColor.lightGrey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TransDetailWidget(
                  title: 'Type',
                  text: transaction.type.length > 25
                      ? '${transaction.type.substring(0, 25)}...'
                      : transaction.type,
                ),
                Divider(
                  color: AppColor.lightBlack.withOpacity(0.2),
                  height: 30,
                ),
                TransDetailWidget(
                  title: 'Date',
                  text:
                      '${transaction.date.day} ${months[transaction.date.month - 1]}, ${transaction.date.year}',
                ),
                Divider(
                  color: AppColor.lightBlack.withOpacity(0.2),
                  height: 30,
                ),
                TransDetailWidget(
                  title: 'Time',
                  text: DateFormat.jm().format(transaction.date),
                ),
                Divider(
                  color: AppColor.lightBlack.withOpacity(0.2),
                  height: 30,
                ),
                TransDetailWidget(
                  title: 'Status',
                  text: transaction.status,
                ),
              ],
            ),
          ),
          Divider(
            color: AppColor.lightBlack.withOpacity(0.1),
            height: 50,
          ),
          MainButton(
            borderColor: Colors.transparent,
            backgroundColor: AppColor.primaryColor,
            child: Text(
              'Download Receipt',
              style: TextStyle(
                fontSize: 14,
                color: AppColor.white,
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
