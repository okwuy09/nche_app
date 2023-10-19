import 'package:flutter/material.dart';
import 'package:nche/constant.dart';
import 'package:nche/services/controller/wallet_controller.dart';
import 'package:nche/widget/button.dart';
import 'package:nche/widget/colors.dart';
import 'package:nche/widget/popover.dart';
import 'package:nche/widget/style.dart';
import 'package:provider/provider.dart';

class PaymentMethodSheet extends StatelessWidget {
  const PaymentMethodSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var walletProvider = Provider.of<WalletController>(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Popover(
        mainAxisSize: MainAxisSize.min,
        child: Column(children: [
          Row(
            children: [
              Text(
                'Payment Method',
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
          const SizedBox(height: 20),
          Divider(
            color: AppColor.lightGrey,
          ),
          const SizedBox(height: 20),
          ListView.builder(
              itemCount: paymentMethod.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () => walletProvider.selectPaymentMethod(
                      paymentMethod[i], context),
                  child: Container(
                    height: 70,
                    width: size.width,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: paymentMethod[i].type == 'card'
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
                          color: paymentMethod[i].type == 'card'
                              ? AppColor.grey
                              : AppColor.primaryColorLight,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.asset(paymentMethod[i].assetsImage),
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
                            paymentMethod[i].title,
                            style: style.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            paymentMethod[i].subTitle,
                            style: style.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColor.lightBlack),
                          ),
                        ],
                      ),

                      ///
                      Expanded(child: Container()),
                      SizedBox(
                        height: 24.0,
                        width: 24.0,
                        child: Theme(
                          data: ThemeData(
                            unselectedWidgetColor:
                                AppColor.lightBlack.withOpacity(0.2),
                          ),
                          child: Checkbox(
                            shape: const CircleBorder(),
                            value:
                                walletProvider.paymentType == paymentMethod[i],
                            checkColor: AppColor.white,
                            activeColor: AppColor.primaryColor,
                            onChanged: (value) {
                              walletProvider.selectPaymentMethod(
                                  paymentMethod[i], context);
                            },
                          ),
                        ),
                      ),
                    ]),
                  ),
                );
              }),
          const SizedBox(
            height: 40,
          ),
          MainButton(
            borderColor: Colors.transparent,
            backgroundColor: AppColor.primaryColor,
            onTap: () => Navigator.pop(context),
            child: Text(
              'Proceed',
              style: style.copyWith(
                fontSize: 14,
                color: AppColor.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ]),
      ),
    );
  }
}
