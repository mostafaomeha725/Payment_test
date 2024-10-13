import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymant_app/Core/utilies/app_styles.dart';
import 'package:paymant_app/Features/Checkout/data/repos/Checkout_repos_impl.dart';
import 'package:paymant_app/Features/Checkout/presentation/Views/Widgets/Container_Pay.dart';
import 'package:paymant_app/Features/Checkout/presentation/Views/Widgets/Text_Detailes_Order.dart';
import 'package:paymant_app/Features/Checkout/presentation/Views/Widgets/buttom_sheet_card.dart';
import 'package:paymant_app/Features/Checkout/presentation/manger/cubit/payment_cubit.dart';

class TotalPriceText extends StatelessWidget {
  const TotalPriceText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextDetailesOrder(
          text1: 'Order Subtotal',
          text2: '\$42.97',
        ),
        const TextDetailesOrder(
          text1: 'Discount',
          text2: '\$0',
        ),
        const TextDetailesOrder(
          text1: 'Shipping',
          text2: '\$8',
        ),
        const SizedBox(
          height: 6,
        ),
        const Divider(
          indent: 10,
          endIndent: 10,
        ),
        const SizedBox(
          height: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: Appstyles.styleSemiBold24(context),
            ),
            Text(
              '\$50.97',
              style: Appstyles.styleSemiBold24(context),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        ContainerPay(
          text: 'Complete Payment',
          onTap: () {
            bottomSheet(context);
          },
        ),
      ],
    );
  }

  void bottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return BlocProvider(
          create: (context) => PaymentCubit(CheckoutReposImpl()),
          child: const ButtomSheetCard(),
        );
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    );
  }
}
