// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_interpolation_to_compose_strings

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/fav_controller.dart';
import 'package:e_commerce/controller/items_controller.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/core/constants/imageassets.dart';
import 'package:e_commerce/data/model/itemsview_model.dart';
import 'package:e_commerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';

class CustomeCard extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  //final bool active;
  const CustomeCard({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    Widget _footer({Color? color}) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${itemsModel.itemspricediscount}\$",
            maxLines: 1,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: color),
          ),
          GetBuilder<FavoriteController>(
            builder: (controller) => IconButton(
              onPressed: () {
                if (controller.isFavorite[itemsModel.itemsId] == 1) {
                  controller.setFavorite(itemsModel.itemsId, 0);
                  controller.removefavorite(itemsModel.itemsId!);
                } else {
                  controller.setFavorite(itemsModel.itemsId, 1);
                  controller.addfavorite(itemsModel.itemsId!);
                }
              },
              icon: Icon(
                controller.isFavorite[itemsModel.itemsId] == 1
                    ? Icons.favorite
                    : Icons.favorite_border,
                size: 30,
                color: Colors.red,
              ),
            ),
          ),
        ],
      );
    }

    Widget _title({Color? color}) {
      return Text(
        itemsModel.itemsName!,
        maxLines: 1,
        style:
            TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: color),
      );
    }

    Widget _content({Color? color}) {
      return Text(
        itemsModel.itemsDesc!,
        maxLines: 2,
        style: TextStyle(color: color),
      );
    }

    return InkWell(
      onTap: () {
        controller.gotoproduct(itemsModel);
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Stack(
          children: [
            FillImageCard(
              color: AppColor.backgroundcolor1,
              heightImage: 160,
              width: 200,
              imageProvider: CachedNetworkImageProvider(
                AppLink.imageitems + "/" + itemsModel.itemsImage!,
                maxHeight: 150,
              ),
              title: _title(color: Colors.white),
              description: _content(color: Colors.white),
              footer: _footer(color: Colors.white),
            ),
            if (itemsModel.itemsDiscount != 0)
              Positioned(
                left: 10,
                top: 10,
                child: Image.asset(
                  AppImageAsset.sale,
                  width: 40,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
