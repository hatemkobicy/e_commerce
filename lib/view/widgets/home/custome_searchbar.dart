import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/view/widgets/textform/custometextform.dart';
import 'package:flutter/material.dart';

class CustomeSearchBar extends StatelessWidget {
  final String hinttext;
  final void Function()? onPressedicon;
  final void Function(String)? onChanged;
  final void Function()? onPressediconfav;
  final void Function()? onpresssearch;
  final TextEditingController? searchcontroller;
  const CustomeSearchBar(
      {super.key,
      required this.hinttext,
      this.onPressedicon,
      this.onChanged,
      this.onPressediconfav,
      this.onpresssearch,
      this.searchcontroller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 7),
      margin: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Expanded(
            child: CustomeTextForm(
              controller: searchcontroller,
              onChanged: onChanged,
              keyboardType: TextInputType.name,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
              decoration: InputDecoration(
                alignLabelWithHint: true,
                hintStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
                hintText: hinttext,
                prefixIcon: IconButton(
                  onPressed: onpresssearch,
                  icon: Icon(
                    Icons.search_outlined,
                    color: Colors.white,
                  ),
                ),
                filled: true,
                fillColor: AppColor.backgroundcolor1,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 5,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColor.backgroundcolor1,
                borderRadius: BorderRadius.circular(50)),
            child: IconButton(
              iconSize: 30,
              onPressed: onPressediconfav,
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColor.backgroundcolor1,
                borderRadius: BorderRadius.circular(50)),
            child: IconButton(
              iconSize: 30,
              onPressed: onPressedicon,
              icon: const Icon(
                Icons.notifications_none_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
