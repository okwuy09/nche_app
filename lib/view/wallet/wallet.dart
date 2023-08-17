import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nche/constant.dart';
import 'package:nche/view/wallet/widget/trans_widget.dart';
import 'package:nche/view/wallet/widget/transaction_detail.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'widget/wallet_transaction.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});
  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

final PageController _controller = PageController();

class _WalletScreenState extends State<WalletScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: AppColor.white,
        shadowColor: AppColor.white,
        backgroundColor: AppColor.white,
        elevation: 0,
        title: Row(
          children: [
            Text(
              'Wallet',
              style: style.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColor.black,
              ),
            ),
            Expanded(child: Container()),

            /// handburger menu
            GestureDetector(
              onTap: () => {},
              child: Container(
                height: 46,
                width: 46,
                decoration: BoxDecoration(
                  color: AppColor.lightGrey,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/menu.png',
                    height: 26,
                    width: 26,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(children: [
          const SizedBox(
            height: 10,
          ),

          // wallet pageView view

          Container(
            height: 200,
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: PageView(
              physics: const BouncingScrollPhysics(),
              controller: _controller,
              onPageChanged: (value) => setState(() {
                index = value;
              }),
              children: List.generate(wallet.length, (i) {
                return Container(
                  height: 180,
                  width: size.width / 1.12,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(
                    right: 8,
                    bottom: 20,
                  ),
                  decoration: BoxDecoration(
                    color: wallet[i].locked ? AppColor.black : AppColor.purple,
                    boxShadow: [
                      BoxShadow(
                        color:
                            wallet[i].locked ? AppColor.black : AppColor.purple,
                        blurRadius: 0,
                        offset: const Offset(2, 4),
                      ),
                      BoxShadow(
                        color: AppColor.white,
                        blurRadius: 0,
                        offset: const Offset(0.8, 1.4),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          wallet[i].name,
                          style: style.copyWith(
                            fontSize: 11,
                            color: AppColor.white.withOpacity(0.8),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          wallet[i].amount,
                          style: style.copyWith(
                            fontSize: 30,
                            color: AppColor.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            '5000.424 NGN',
                            style: style.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColor.white,
                            ),
                          ),
                        ),
                      ]),
                );
              }),
            ),
          ),

          /// smooth scrow
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: wallet.asMap().entries.map(
              (entry) {
                return GestureDetector(
                  onTap: () => _controller.animateTo(entry.key.toDouble(),
                      duration: const Duration(seconds: 4),
                      curve: Curves.easeIn),
                  child: Container(
                    width: 24,
                    height: 5.8,
                    margin: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color:
                          index == entry.key ? AppColor.purple : AppColor.grey,
                    ),
                  ),
                );
              },
            ).toList(),
          ),
          const SizedBox(
            height: 10,
          ),
          index == 0
              ? Container(
                  height: 100,
                  width: size.width,
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.only(bottom: 15),
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: AppColor.purple.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 45,
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: AppColor.purple,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TransactionWidget(
                                title: 'Withdraw',
                                assetImageUrl: 'assets/withdraw.png',
                                onTap: () {},
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: TransactionWidget(
                                title: 'Send',
                                assetImageUrl: 'assets/send.png',
                                onTap: () {},
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: TransactionWidget(
                                title: 'Buy Token',
                                assetImageUrl: 'assets/buy.png',
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Show wallet address',
                          style: style.copyWith(
                            fontSize: 12,
                            color: AppColor.purple,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : Container(
                  height: 110,
                  width: size.width,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: AppColor.lightOrange,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: RichText(
                    text: TextSpan(
                      text:
                          'Locked because you have allocated this amount above as reward on a post .',
                      style: style.copyWith(
                        color: AppColor.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text:
                              ' (Therefore you will no longer have access to it, and it will be disbursed according to the post outcome decided by the community)',
                          style: style.copyWith(
                            color: AppColor.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          const SizedBox(
            height: 30,
          ),

          //// Wallet Transactions
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'WALLET TRANSACTIONS',
                      style: style.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColor.lightBlack,
                      ),
                    ),
                    Expanded(child: Container()),
                    InkWell(
                      splashColor: Colors.transparent,
                      onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (_) => const WalletTransactions(),
                        ),
                      ),
                      child: Text(
                        'See more  >',
                        style: style.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColor.purple,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  itemCount: transactionHistry.length > 3
                      ? 3
                      : transactionHistry.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    return InkWell(
                      splashColor: Colors.transparent,
                      onTap: () => showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        context: context,
                        builder: (_) => TransactionDetails(
                          transaction: transactionHistry[i],
                        ),
                      ),
                      child: Container(
                        height: 50,
                        width: size.width,
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        margin: const EdgeInsets.only(bottom: 15),
                        child: Row(children: [
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
                                      color:
                                          AppColor.lightBlack.withOpacity(0.6),
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
                        ]),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
