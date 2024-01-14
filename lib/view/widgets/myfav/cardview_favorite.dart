import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/myfav_controller.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/data/model/favorite_model.dart';
import 'package:e_commerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';

class CustomeCardFav extends GetView<MyfavoriteController> {
  final Favoritemodel favoritemodel;

  //final bool active;
  const CustomeCardFav({
    super.key,
    required this.favoritemodel,
  });

  @override
  Widget build(BuildContext context) {
    Widget _footer({Color? color}) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            favoritemodel.itemsPrice.toString() + "\$",
            maxLines: 1,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: color),
          ),
          IconButton(
            onPressed: () {
              controller.deletefav(favoritemodel.favoriteId!);
            },
            icon: Icon(
              Icons.delete_forever_outlined,
              size: 35,
              color: Colors.red,
            ),
          ),
        ],
      );
    }

    Widget _title({Color? color}) {
      return Text(
        favoritemodel.itemsName!,
        maxLines: 1,
        style:
            TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: color),
      );
    }

    Widget _content({Color? color}) {
      return Text(
        favoritemodel.itemsDesc!,
        maxLines: 2,
        style: TextStyle(color: color),
      );
    }

    return Container(
      padding: const EdgeInsets.all(5),
      child: FillImageCard(
        color: AppColor.backgroundcolor1,
        heightImage: 160,
        width: 200,
        imageProvider: CachedNetworkImageProvider(
          AppLink.imageitems + "/" + favoritemodel.itemsImage!,
          maxHeight: 150,
        ),
        title: _title(color: Colors.white),
        description: _content(color: Colors.white),
        footer: _footer(color: Colors.white),
      ),
    );
  }
}
