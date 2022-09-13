import 'package:flutter/material.dart';
import 'package:serenitys/model/restaurant.dart';
import 'package:serenitys/shared/theme.dart';
import 'package:serenitys/ui/widgets/card_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Stack(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(color: kBackgroundColor),
              ),
              customShadow(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(top: 30),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      child: const Text(
                        'SERENITY RESTAURANT',
                        style: TextStyle(
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 30,
                        right: 20,
                      ),
                      width: 24,
                      height: 24,
                      child: InkWell(
                        child: const Icon(Icons.search),
                        onTap: () {
                          Navigator.pushNamed(context, '/search-page');
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: const Text(
              'Recommended restaurant for you!',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 550,
            child: FutureBuilder<String>(
              future: DefaultAssetBundle.of(context)
                  .loadString('assets/local_restaurant.json'),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final List<Restaurant> parsed =
                      welcomeFromJson(snapshot.data!).restaurants;
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return CardItem(
                          context: context,
                          restaurant: parsed[index],
                        );
                      },
                      separatorBuilder: (context, _) => const SizedBox(
                            height: 12,
                          ),
                      itemCount: parsed.length);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }


  Widget customShadow() {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.65),
            kWhiteColor.withOpacity(0),
          ],
        ),
      ),
    );
  }
}
