import 'package:e_commerce/core/constants/color.dart';
import 'package:flutter/material.dart';

class CustomPriceNav extends StatelessWidget {
  final String price;
  final String message;
  final String shippingprice;
  final String totalprice;
  final void Function()? onPressed;
  const CustomPriceNav({super.key, required this.price, required this.shippingprice, required this.totalprice, this.onPressed, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Count",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                message,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Price",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                price,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Shipping",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                shippingprice,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            color: Colors.white,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Total",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                totalprice,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(40),
            color: AppColor.backgroundcolor1,
          ),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 60,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(40)),
            onPressed: onPressed,
            child: Text(
              "Place The Order",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
