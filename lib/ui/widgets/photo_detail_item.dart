import 'package:flutter/material.dart';
import 'package:serenitys/model/restaurant.dart';

class PhotoDetailItem extends StatelessWidget {
  Menus menus;

  PhotoDetailItem({required this.menus, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 150,
              width: double.infinity,
              child: Column(
                children: [
                  const Text(
                    'Makanan',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: false,
                        itemBuilder: (context, index) {
                          return Text(
                            "- ${menus.foods[index].name}",
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          );
                        },
                        separatorBuilder: (context, _) => const SizedBox(
                              height: 5,
                            ),
                        itemCount: menus.foods.length),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 150,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Minuman",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: false,
                        itemBuilder: (context, index) {
                          return Text(
                            "- ${menus.drinks[index].name}",
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          );
                        },
                        separatorBuilder: (context, _) => const SizedBox(
                              height: 5,
                            ),
                        itemCount: menus.drinks.length),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
