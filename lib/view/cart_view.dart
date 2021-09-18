import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/view%20model/cart_view_model.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  CartView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: GetBuilder<CartViewModel>(
              init: CartViewModel(),
              builder: (controller) {
                return Container(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10);
                    },
                    itemCount: controller.cartProductModel.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 140,
                        child: Row(
                          children: [
                            Container(
                              width: 140,
                              child: Image.network(
                                controller.cartProductModel[index].image!,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: controller
                                        .cartProductModel[index].name!,
                                    fontSize: 24,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomText(
                                    text: controller
                                        .cartProductModel[index].price
                                        .toString(),
                                    color: primaryColor,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: 140,
                                    color: Colors.grey.shade200,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        CustomText(
                                          alignment: Alignment.center,
                                          text: '1',
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(bottom: 20),
                                          child: Icon(
                                            Icons.minimize,
                                            color: Colors.black,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CustomText(
                    text: 'TOTAL',
                    color: Colors.grey,
                    fontSize: 22,
                  ),
                  CustomText(
                    text: '\$ 20000',
                    color: primaryColor,
                    fontSize: 18,
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(20),
                height: 100,
                width: 180,
                child: CustomButton(
                  text: 'CHECKOUT',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
