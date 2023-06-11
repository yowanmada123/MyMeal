import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mymeal/bloc/food_category/food_category_bloc.dart';
import 'package:mymeal/bloc/food_category/food_category_state.dart';
import 'package:mymeal/model/food_category_model.dart';
import 'package:mymeal/pages/utils/colors.dart';
import 'package:mymeal/pages/utils/ext_text.dart';
import 'package:mymeal/pages/widget/custom_loading.dart';

class FoodListCategory extends StatefulWidget {
  final FoodCategoryBloc categoryBloc;
  final Function(String?) categoryCallback;

  FoodListCategory({super.key, required this.categoryBloc, required this.categoryCallback});

  @override
  State<FoodListCategory> createState() => _FoodListCategoryState();
}

class _FoodListCategoryState extends State<FoodListCategory> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 60,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              color: ONetralwhite,
              child: BlocProvider(
                create: (_) => widget.categoryBloc,
                child: BlocListener<FoodCategoryBloc, FoodCategoryState>(
                    listener: (context, state) {},
                    child: BlocBuilder<FoodCategoryBloc, FoodCategoryState>(
                      builder: (context, state) {
                        print("state $state");
                        if (state is FoodCategoryInitial) {
                          return buildLoading();
                        } else if (state is FoodCategoryLoading) {
                          return buildLoading();
                        } else if (state is FoodCategoryLoaded) {
                          return _buildDropDown(context, state.foodCategory);
                        } else {
                          return Container();
                        }
                      },
                    )),
              ),
              // Text("data")
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropDown(BuildContext context, FoodCategoryModel model) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        color: ONetralwhite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 35,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: DropdownButton(
              underline: Container(),
              isExpanded: true,
              items: model.meals?.map((Meals value) {
                return DropdownMenuItem<String>(
                  value: value.strCategory,
                  child: Text(value.strCategory ?? ""),
                );
              }).toList(),
              value: selectedOption ?? "Beef",
              onChanged: (value) {
                setState(() {
                  selectedOption = value.toString();
                });
                widget.categoryCallback.call(value);
              },
            ),
          ),
        ));
  }
}
