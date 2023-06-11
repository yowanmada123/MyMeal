import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mymeal/bloc/food_category/food_category_event.dart';
import 'package:mymeal/bloc/food_list/food_list_bloc.dart';
import 'package:mymeal/bloc/food_list/food_list_event.dart';
import 'package:mymeal/bloc/food_list/food_list_state.dart';
import 'package:mymeal/pages/utils/colors.dart';
import 'package:mymeal/pages/utils/ext_text.dart';
import 'package:mymeal/pages/widget/custom_image.dart';
import 'package:mymeal/pages/widget/custom_loading.dart';
import 'package:mymeal/pages/widget/food_list.dart';
import 'package:mymeal/pages/widget/food_list_category.dart';

import '../bloc/food_category/food_category_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final FoodCategoryBloc _categoryBloc = FoodCategoryBloc();
  final FoodListBloc _listBloc = FoodListBloc();

  @override
  void initState() {
    _categoryBloc.add(GetFoodCategoryList());
    _listBloc.add(GetFoodList("Beef"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ONetralwhite,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            HomePageAppBar(),
            FoodListCategory(
              categoryBloc: _categoryBloc,
              categoryCallback: (category) {
                _listBloc.add(GetFoodList(category));
              },
            ),
            FoodList(
              foodListBloc: _listBloc,
            ),
          ],
        ),
      ),
    );
  }

  Widget HomePageAppBar() {
    return SliverAppBar(
      backgroundColor: ONetralwhite,
      pinned: false,
      expandedHeight: 20.0,
      primary: false,
      centerTitle: false,
      titleSpacing: 5,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Container(
          color: OPrimaryBlack,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(Material)
                      },
                      child: Image.asset(
                        "assets/logo.png",
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "Meal",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.white,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 16.0, left: 8),
                  child: Icon(Icons.bookmark_border, color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
