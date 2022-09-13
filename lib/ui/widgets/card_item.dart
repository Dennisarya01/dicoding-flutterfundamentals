import 'package:flutter/material.dart';
import 'package:serenitys/model/restaurant.dart';
import 'package:serenitys/shared/theme.dart';

class CardItem extends StatelessWidget {
  BuildContext context;
  Restaurant restaurant;

  CardItem({Key? key, required this.context, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/detail-page', arguments: restaurant);
        },
        child: Container(
          height: 115,
          width: double.infinity,
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(restaurant.pictureId),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              restaurant.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            itemIconWidget(
                                restaurant.city, "assets/images/location.png"),
                          ],
                        ),
                        itemIconWidget(restaurant.rating.toString(), "assets/images/img-star-yellow.png"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget itemIconWidget(String title, String imageAssets) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          margin: const EdgeInsets.only(
            right: 8,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageAssets),
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(color: kGreyColor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
