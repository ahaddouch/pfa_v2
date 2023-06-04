import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pfa_v2/core/view_model/cart_view_model.dart';
import 'package:pfa_v2/view/checkout/checkout_view.dart';
import 'package:pfa_v2/view/widgets/custom_buttom.dart';
import 'package:pfa_v2/view/widgets/custom_text.dart';
import '../constance.dart';
import '../model/cart_product_model.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: Get.find(),
      builder: (controller) => Scaffold(
        body: controller.cartProductModel.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svg/empty_cart.svg',
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: 'Cart is Empty',
                    fontSize: 32,
                    alignment: Alignment.topCenter,
                  )
                ],
              )
            : Column(
                children: [
                  Expanded(
                    child: Container(
                        child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          height: 140,
                          child: Row(
                            children: [
                              Container(
                                width: 140,
                                child: Image.network(
                                  controller.cartProductModel[index].image,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: controller
                                          .cartProductModel[index].name,
                                      fontSize: 24,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    CustomText(
                                      color: primaryColor,
                                      text:
                                          '\$ ${controller.cartProductModel[index].price.toString()}',
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: 140,
                                      color: Colors.grey.shade200,
                                      height: 40,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              controller
                                                  .increaseQuantity(index);
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          CustomText(
                                            text: controller
                                                .cartProductModel[index]
                                                .quantity
                                                .toString(),
                                            alignment: Alignment.center,
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller
                                                  .decreaseQuantity(index);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                bottom: 20,
                                              ),
                                              child: Icon(
                                                Icons.minimize,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
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
                      itemCount: controller.cartProductModel.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 15,
                        );
                      },
                    )),
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
                              fontSize: 22,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            GetBuilder<CartViewModel>(
                              init: Get.find(),
                              builder: (controller) => CustomText(
                                text: '\$ ${controller.totalPrice}',
                                color: primaryColor,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 100,
                          padding: EdgeInsets.all(20),
                          width: 180,
                          child: CustomButton(
                            onPress: () {
                              Get.to(CheckOutView());
                            },
                            text: 'CHECKOUT',
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
