import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:paymant_app/Features/Checkout/data/Models/Payment_intent_input_model.dart';
import 'package:paymant_app/Features/Checkout/data/Models/amout_model/amout_model.dart';
import 'package:paymant_app/Features/Checkout/data/Models/amout_model/details.dart';
import 'package:paymant_app/Features/Checkout/data/Models/item_list_model/item.dart';
import 'package:paymant_app/Features/Checkout/data/Models/item_list_model/item_list_model.dart';
import 'package:paymant_app/Features/Checkout/presentation/Views/Thank_You_View.dart';
import 'package:paymant_app/Features/Checkout/presentation/Views/Widgets/Container_Pay.dart';
import 'package:paymant_app/Features/Checkout/presentation/Views/Widgets/Payment_Method_item.dart';
import 'package:paymant_app/Features/Checkout/presentation/manger/cubit/payment_cubit.dart';

class ButtomSheetCard extends StatefulWidget {
  const ButtomSheetCard({super.key});

  @override
  State<ButtomSheetCard> createState() => _ButtomSheetCardState();
}

class _ButtomSheetCardState extends State<ButtomSheetCard> {
  double amount = 95.7;

  List<String> item = [
    'assets/Images/SVGRepo_iconCarrier1.svg',
    'assets/Images/paybal.svg',
  ];

  int activeindex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.sizeOf(context).height *
            0.25, // Set a height or use constraints if needed
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          color: Colors.white,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        activeindex = index;

                        setState(() {});
                      },
                      child: PaymentMethodItem(
                        image: item[index],
                        isactive: activeindex == index,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: BlocConsumer<PaymentCubit, PaymentState>(
                listener: (context, state) {
                  if (state is PaymentSuccess) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const ThankYouView();
                        },
                      ),
                    );
                  } else if (state is PaymentFailure) {
                    Navigator.pop(context);

                    SnackBar snackBar = showSnakeBar(state.errMessage);

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                builder: (context, state) {
                  return ContainerPay(
                    text: 'Containue',
                    onTap: () {
                      if (activeindex == 0) {
                        PaymentIntentInputModel paymentIntentInputModel =
                            PaymentIntentInputModel(
                          amount: amount.ceil().toString(),
                          currency: 'USD',
                          custometId: 'cus_QnsdAnYSwGP3us',
                        );
                        BlocProvider.of<PaymentCubit>(context).makePayment(
                            paymentitentinputmodel: paymentIntentInputModel);
                      } else {
                        var transactiondata = gettransactions();
                        paymentPaypal(context, transactiondata);
                      }
                    },
                    isLoading: state is PaymentLoading ? true : false,
                  );
                },
              ),
            ),
          ],
        ));
  }

  SnackBar showSnakeBar(String text) {
    final snackBar = SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 3),
    );
    return snackBar;
  }

  void paymentPaypal(BuildContext context,
      ({AmoutModel amountList, ItemListModel itemList}) transactiondata) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId:
            "Ad7HVRHh1xpxJD4Aet9hrt4coHl1D0Y-LzdkTJxfrvJ_FluNXII5thQ3zwiQkH_Hhn0WLsfrRus1M8La",
        secretKey:
            "EF5fpR7l7JGrVMYokwiqzHcuKAjGzgXzqGiZrI3a4HEwSc4MpnSjqIFrP3_uziu3enquFHp4mvKOMkSq",
        transactions: [
          {
            "amount": transactiondata.amountList.toJson(),
            "description": "The payment transaction description.",
            "item_list": transactiondata.itemList.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.push(
            (context),
            MaterialPageRoute(
              builder: (context) {
                return const ThankYouView();
              },
            ),
          );
          showSnakeBar('onSuccess');
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
          showSnakeBar('onError');
        },
        onCancel: () {
          Navigator.pop(context);
          showSnakeBar('cancelled');
        },
      ),
    ));
  }

  ({AmoutModel amountList, ItemListModel itemList}) gettransactions() {
    var amountList = AmoutModel(
      total: "100",
      currency: "USD",
      details: Details(shipping: "0", shippingDiscount: 0, subtotal: "100"),
    );
    List<Item> item = [
      Item(
        currency: "USD",
        name: "Apple",
        quantity: 4,
        price: "10",
      ),
      Item(
        currency: "USD",
        name: "Pineapple",
        quantity: 5,
        price: "12",
      )
    ];
    var itemList = ItemListModel(items: item);
    return (amountList: amountList, itemList: itemList);
  }
}
