import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:nche/services/controller/wallet_controller.dart';
import 'package:nche/view/wallet/widget/payment_method_sheet.dart';
import 'package:nche/widget/back_nav.dart';
import 'package:nche/widget/button.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/style.dart';
import 'package:provider/provider.dart';

class BuyToken extends StatelessWidget {
  const BuyToken({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var walletProvider = Provider.of<WalletController>(context);
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
              'Buy Token',
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter the amount you want in (₦)',
                style: style.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColor.lightBlack,
                ),
              ),
              const SizedBox(height: 6),

              /// naira amount
              TextFormField(
                controller: walletProvider.naira,
                textAlign: TextAlign.end,
                cursorColor: AppColor.black,
                style: style.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.lightGrey,
                  isDense: true,
                  prefixIcon: Container(
                    height: 56,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColor.grey,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
                    ),
                    child: Text(
                      '₦',
                      style: style.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColor.grey),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColor.red),
                  ),
                ),
                onChanged: (value) => walletProvider.tokenEquivalent(),
              ),

              Row(
                children: [
                  /// Swap dash line
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: Column(
                      children: [
                        // Up dash
                        Dash(
                          direction: Axis.vertical,
                          length: 45,
                          dashLength: 4,
                          dashThickness: 2,
                          dashColor: AppColor.lightBlack.withOpacity(0.3),
                        ),
                        Image.asset(
                          'assets/swap.png',
                          height: 23,
                          width: 23,
                          color: AppColor.darkerGrey.withOpacity(0.6),
                        ),
                        // down dash
                        Dash(
                          direction: Axis.vertical,
                          length: 45,
                          dashLength: 4,
                          dashThickness: 2,
                          dashColor: AppColor.lightBlack.withOpacity(0.3),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                  Column(
                    children: [
                      /// currency rate
                      Row(
                        children: [
                          Text(
                            'Rate: 1 Nche token ',
                            style: style.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: AppColor.lightBlack,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.grey,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '₦ 0.554',
                              style: style.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),

                      /// Transaction fees
                      Row(
                        children: [
                          Text(
                            'Transaction Fee ',
                            style: style.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: AppColor.lightBlack,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.grey,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '₦ 5',
                              style: style.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),

              /// Equivalent in Token
              Text(
                'Equivalent amount of token you get',
                style: style.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColor.lightBlack,
                ),
              ),
              const SizedBox(height: 6),

              /// naira amount
              TextFormField(
                controller: walletProvider.tokenRate, //_token,
                readOnly: true,
                canRequestFocus: false,
                textAlign: TextAlign.end,
                cursorColor: AppColor.black,
                style: style.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.lightGrey,
                  isDense: true,
                  prefixIcon: Container(
                    height: 56,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColor.grey,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
                    ),
                    child: Image.asset(
                      'assets/coin.png',
                      color: AppColor.black,
                      height: 23,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 6,
              ),

              /// payment method
              Text(
                'Payment Method',
                style: style.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColor.lightBlack,
                ),
              ),
              const SizedBox(height: 6),
              InkWell(
                splashColor: Colors.transparent,
                onTap: () => showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  context: context,
                  builder: (_) => const PaymentMethodSheet(),
                ),
                child: Container(
                  height: 70,
                  width: size.width,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: walletProvider.paymentType.type == 'card'
                        ? AppColor.lightGrey
                        : AppColor.lightBlue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(children: [
                    Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: walletProvider.paymentType.type == 'card'
                            ? AppColor.grey
                            : AppColor.primaryColorLight,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child:
                          Image.asset(walletProvider.paymentType.assetsImage),
                    ),

                    ///
                    const SizedBox(
                      width: 10,
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          walletProvider.paymentType.title,
                          style: style.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          walletProvider.paymentType.subTitle,
                          style: style.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColor.lightBlack),
                        ),
                      ],
                    ),

                    ///
                    Expanded(child: Container()),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColor.lightBlack,
                    )
                  ]),
                ),
              ),
              const SizedBox(height: 50),
              MainButton(
                borderColor: Colors.transparent,
                backgroundColor: walletProvider.naira.text.isEmpty
                    ? AppColor.primaryColorLight
                    : AppColor.primaryColor,
                onTap: walletProvider.naira.text.isEmpty ? null : () {},
                child: Text(
                  'Proceed',
                  style: TextStyle(
                    fontSize: 14,
                    color: walletProvider.naira.text.isEmpty
                        ? AppColor.lightGrey
                        : AppColor.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
