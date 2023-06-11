import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mymeal/model/food_list_model.dart';
import 'package:mymeal/pages/utils/colors.dart';
import 'package:mymeal/pages/utils/ext_text.dart';
import 'package:mymeal/pages/widget/custom_image.dart';

class FoodItem extends StatefulWidget {
  const FoodItem({super.key, required this.model});
  final FoodListModel model;

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.all(15),
              child: Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImage(
                      roundedCorner: 10,
                      containerColor: OPrimaryBlack,
                      heigt: 40,
                      iconSize: 50,
                      imageUrl: "${widget.model.meals![index].strMealThumb}",
                      textSize: 30,
                      width: 40,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 100.0,
                      child: Text(
                        widget.model.meals![index].strMeal.toString(),
                        // "Greta - Gerwig's Little Woman",
                        maxLines: 1,
                      ).p12r().calmWhite(),
                    ),
                  ],
                ),
              ),
            );
          },
          childCount: widget.model.meals!.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
        ),
      ),
    );
  }
}
