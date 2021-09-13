import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final List<String> names = <String>[
    'men',
    's',
    's',
    's',
    's',
    's',
    's',
  ];
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 100, right: 20, left: 20),
        child: ListView(
          children: [
            _searchTextFormField(),
            SizedBox(height: 30),
            CustomText(
              text: 'Categories',
            ),
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
    );
  }

  Container _listViewCategory() {
    return Container(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(
          width: 20,
        ),
        itemCount: names.length,
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
                  child: Image.asset('assets/images/Icon_Mens Shoe.png'),
                ),
              ),
              CustomText(
                text: names[index],
              )
            ],
          );
        },
      ),
    );
  }

  Container _listViewProduct() {
    return Container(
      height: 350,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(
          width: 20,
        ),
        itemCount: names.length,
        itemBuilder: (context, index) {
          return Container(
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
                    child: Image.asset(
                      'assets/images/Image.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CustomText(
                  text: 'Beo Play Speaker',
                  alignment: Alignment.bottomLeft,
                ),
                SizedBox(height: 10),
                CustomText(
                  text: 'Beo Play Speaker',
                  alignment: Alignment.bottomLeft,
                  color: Colors.grey,
                ),
                SizedBox(height: 10),
                CustomText(
                  text: '\$775',
                  color: primaryColor,
                  alignment: Alignment.bottomLeft,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Container _searchTextFormField() {
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
