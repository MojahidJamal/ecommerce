import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/view%20model/home_view_model.dart';
import 'package:ecommerce_app/view/detail_view.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
      builder: (controller) {
        return controller.loading.value
            ? Center(child: CircularProgressIndicator())
            : Scaffold(
                body: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 100, right: 20, left: 20),
                      child: Column(
                        children: [
                          _searchTextFormField(),
                          SizedBox(height: 30),
                          CustomText(text: 'Categories'),
                          SizedBox(height: 30),
                          _listViewCategory(),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: 'Best Selling',
                                fontSize: 18,
                              ),
                              CustomText(
                                text: 'See All',
                                fontSize: 16,
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          _listViewProduct(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(builder: (controller) {
      return Container(
        height: 100,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
          itemCount: controller.categoryModel.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Image.network(controller.categoryModel[index].image!),
                  ),
                ),
                CustomText(
                  text: controller.categoryModel[index].name!,
                )
              ],
            );
          },
        ),
      );
    });
  }

  Widget _listViewProduct() {
    return GetBuilder<HomeViewModel>(builder: (controller) {
      return Container(
        height: 350,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.productModel.length,
          separatorBuilder: (context, index) => SizedBox(width: 20),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(() =>
                    DetailScreen(productModel: controller.productModel[index]));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Container(
                        height: 220,
                        width: MediaQuery.of(context).size.width * .4,
                        child: Image.network(
                          controller.productModel[index].image!,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomText(
                      text: controller.productModel[index].name!,
                      alignment: Alignment.bottomLeft,
                    ),
                    SizedBox(height: 10),
                    CustomText(
                      text: controller.productModel[index].description!,
                      maxLine: 1,
                      alignment: Alignment.bottomLeft,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10),
                    CustomText(
                      text: controller.productModel[index].price!.toString(),
                      color: primaryColor,
                      alignment: Alignment.bottomLeft,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
