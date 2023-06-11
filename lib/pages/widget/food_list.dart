import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mymeal/bloc/food_list/food_list_bloc.dart';
import 'package:mymeal/bloc/food_list/food_list_state.dart';
import 'package:mymeal/model/food_list_model.dart';
import 'package:mymeal/pages/utils/colors.dart';
import 'package:mymeal/pages/utils/ext_text.dart';
import 'package:mymeal/pages/widget/custom_image.dart';
import 'package:mymeal/pages/widget/custom_loading.dart';

class FoodList extends StatefulWidget {
  final FoodListBloc foodListBloc;

  FoodList({
    super.key,
    required this.foodListBloc,
  });

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocProvider(
        create: (_) => widget.foodListBloc,
        child: BlocListener<FoodListBloc, FoodListState>(
          listener: (context, state) {},
          child: BlocBuilder<FoodListBloc, FoodListState>(
            builder: (context, state) {
              print("state $state");
              if (state is FoodListInitial) {
                return SliverToBoxAdapter(child: SizedBox(height: 60, child: buildLoading()));
              } else if (state is FoodListLoading) {
                return SliverToBoxAdapter(child: SizedBox(height: 60, child: buildLoading()));
              } else if (state is FoodListLoaded) {
                return _buildCard(context, state.foodList);
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, FoodListModel state) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                  
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImage(
                    roundedCorner: 10,
                    containerColor: OPrimaryBlack,
                    heigt: 130,
                    iconSize: 50,
                    imageUrl: "${state.meals![index].strMealThumb}",
                    textSize: 30,
                    width: 150,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 150.0,
                    child: Text(
                      state.meals![index].strMeal.toString(),
                      maxLines: 1,
                    ).p12r().black(),
                  ),
                ],
              ),
            );
          },
          childCount: state.meals!.length,
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
