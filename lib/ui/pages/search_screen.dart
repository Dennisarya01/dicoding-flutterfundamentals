import 'package:flutter/material.dart';
import 'package:serenitys/model/restaurant.dart';
import 'package:serenitys/shared/theme.dart';
import 'package:serenitys/ui/widgets/card_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();
  final _scrollController = ScrollController();

  final List<Restaurant> _searchParsed = [];
  List<Restaurant> _parsed = [];

  onSearchTextChanged(String text) {
    _searchParsed.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    for (var element in _parsed) {
      if (element.name.toLowerCase().contains(text.toLowerCase())) {
        _searchParsed.add(element);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: TextField(
              controller: controller,
              onChanged: onSearchTextChanged,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    controller.clear();
                    onSearchTextChanged('');
                  },
                ),
                hintText: 'Cari Tempat Favorite mu...',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: SizedBox(
        height: double.infinity,
        child: FutureBuilder<String>(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/local_restaurant.json'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              _parsed = welcomeFromJson(snapshot.data!).restaurants;
              return _searchParsed.isNotEmpty
                  ? ListView.separated(
                      itemBuilder: (context, index) {
                        return CardItem(
                          context: context,
                          restaurant: _searchParsed[index],
                        );
                      },
                      separatorBuilder: (context, _) => const SizedBox(
                        height: 12,
                      ),
                      itemCount: _searchParsed.length,
                    )
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        return CardItem(
                          context: context,
                          restaurant: _parsed[index],
                        );
                      },
                      separatorBuilder: (context, _) => const SizedBox(
                        height: 12,
                      ),
                      itemCount: _parsed.length,
                    );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
