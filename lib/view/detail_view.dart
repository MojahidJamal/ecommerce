import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  late final ProductModel productModel;

  DetailScreen({
    required this.productModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 270,
              child: Image.network(
                productModel.image!,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    children: [
                      CustomText(
                        text: productModel.name!,
                        fontSize: 26,
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            width: MediaQuery.of(context).size.width * .35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(
                                  text: 'Size',
                                ),
                                CustomText(
                                  text: productModel.size!,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(12),
                            width: MediaQuery.of(context).size.width * .35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(
                                  text: 'Color',
                                ),
                                Container(
                                  height: 20,
                                  width: 30,
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: productModel.color,
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      CustomText(
                        text: 'Description',
                        fontSize: 18,
                      ),
                      SizedBox(height: 20),
                      CustomText(
                        text: productModel.description!,
                        fontSize: 18,
                        height: 2.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(
                        text: 'PRICE',
                        fontSize: 22,
                        color: Colors.grey,
                      ),
                      CustomText(
                        text: productModel.price!,
                        color: primaryColor,
                        fontSize: 18,
                      ),
                    ],
                  ),
                  Container(
                    width: 150,
                    height: 100,
                    padding: EdgeInsets.all(20),
                    child: CustomButton(
                      text: 'ADD',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
