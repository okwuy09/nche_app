import 'package:flutter/material.dart';
import 'package:nche/constant.dart';
import 'package:nche/widget/back_nav.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class WalletTransactions extends StatefulWidget {
  const WalletTransactions({super.key});

  @override
  State<WalletTransactions> createState() => _WalletTransactionsState();
}

class _WalletTransactionsState extends State<WalletTransactions> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: AppColor.white,
        surfaceTintColor: AppColor.white,
        automaticallyImplyLeading: false,
        shadowColor: AppColor.white,
        title: Row(
          children: [
            const BackNav(),
            const SizedBox(
              width: 30,
            ),
            Text(
              'Transaction History',
              style: style.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: AppColor.black,
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: transactionHistry.length,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(15),
        itemBuilder: (context, i) {
          return Container(
            height: 50,
            width: size.width,
            padding: const EdgeInsets.symmetric(vertical: 2),
            margin: const EdgeInsets.only(bottom: 15),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactionHistry[i].type.length > 28
                          ? '${transactionHistry[i].type.substring(0, 28)}...'
                          : transactionHistry[i].type,
                      style: style.copyWith(
                        color: AppColor.black.withOpacity(0.8),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Text(
                          '${transactionHistry[i].date.day} ${months[transactionHistry[i].date.month - 1]}, ${transactionHistry[i].date.year}',
                          style: style.copyWith(
                            fontSize: 12,
                            color: AppColor.lightBlack.withOpacity(0.6),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.lightGreen,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(children: [
                            CircleAvatar(
                              radius: 2.5,
                              backgroundColor: AppColor.green,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Successful',
                              style: style.copyWith(
                                fontSize: 11,
                                color: AppColor.green,
                              ),
                            ),
                          ]),
                        ),
                      ],
                    )
                  ],
                ),
                Expanded(child: Container()),
                Column(
                  children: [
                    Text(
                      '${transactionHistry[i].isCredited ? '+' : '-'}${transactionHistry[i].amount}',
                      style: style.copyWith(
                        fontSize: 18,
                        color: transactionHistry[i].isCredited
                            ? AppColor.green
                            : AppColor.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      DateFormat.jm()
                          .format(transactionHistry[i].date)
                          .toString(),
                      style: style.copyWith(
                        fontSize: 12,
                        color: AppColor.lightBlack.withOpacity(0.6),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
