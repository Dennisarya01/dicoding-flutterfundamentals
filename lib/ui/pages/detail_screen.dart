import 'package:flutter/material.dart';
import 'package:serenitys/model/restaurant.dart';
import 'package:serenitys/shared/theme.dart';
import 'package:serenitys/ui/widgets/photo_detail_item.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Restaurant;

    Widget arrowBack() {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget headerImage() {
      return Stack(
        children: [
          Container(
            width: double.infinity,
            height: 450,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(args.pictureId),
              ),
            ),
          ),
          arrowBack(),
        ],
      );
    }

    Widget customShadow() {
      return Container(
        width: double.infinity,
        height: 214,
        margin: const EdgeInsets.only(top: 236),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kWhiteColor.withOpacity(0),
              Colors.black.withOpacity(0.95),
            ],
          ),
        ),
      );
    }

    Widget contentDetailPage() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(
          top: 60,
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 256),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          args.name,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: kWhiteColor),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          args.city,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: kWhiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        margin: const EdgeInsets.only(right: 4),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage('assets/images/img-star-yellow.png'),
                          ),
                        ),
                      ),
                      Text(
                        args.rating.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kWhiteColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // NOTE: DESCRIPTION
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    args.description,
                    style: const TextStyle(color: Colors.black, height: 2.6),
                  ),
                  // NOTE: MENUS
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'Menu',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      PhotoDetailItem(
                        menus: args.menus,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            headerImage(),
            customShadow(),
            contentDetailPage(),
          ],
        ),
      ),
    );
  }
}
