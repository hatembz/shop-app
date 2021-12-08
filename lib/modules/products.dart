import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cubit/shop_cubit/shop_cubit.dart';
import 'package:shop/model/categories_model.dart';
import 'package:shop/model/home_model.dart';
import 'package:shop/themes/colors.dart';

class productsScreen extends StatelessWidget {
  const productsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopcubitState>(listener: (context, state) {
      // TODO: implement listener
    }, builder: (context, state) {
      return ShopCubit.get(context).homeModel == null ||
              ShopCubit.get(context).categoryModel == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : sliderBuilder(ShopCubit.get(context).homeModel,
              ShopCubit.get(context).categoryModel, context);
    });
  }

  Widget sliderBuilder(
      HomeModel? model, CategoriesModel? catmodel, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
              items: model!.data!.banners
                  .map(
                    (e) => Image(
                      image: NetworkImage('${e.image}'),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: 200,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
              )),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Categories',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        buildCategoryItem(catmodel!.data!.data[index]),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                    itemCount: catmodel!.data!.data.length,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'New Products',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey[300],
            child: GridView.count(
              shrinkWrap: true,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              childAspectRatio: 1 / 1.7,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: List.generate(
                  model.data!.products.length,
                  (index) =>
                      buildproduct(model.data!.products[index], context)),
            ),
          )
        ],
      ),
    );
  }
}

Widget buildCategoryItem(DataModel model) =>
    Stack(alignment: Alignment.bottomCenter, children: [
      Image.network(
        model.image,
        height: 100,
        width: 100,
        fit: BoxFit.cover,
      ),
      Container(
        width: 100,
        color: Colors.black.withOpacity(.8),
        child: Text(
          model.name,
          style: const TextStyle(color: Colors.white),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      )
    ]);

Widget buildproduct(ProductModel model, BuildContext context) => Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.network(
                model.image,
                width: double.infinity,
                height: 200,
              ),
              if (model.discount != 0)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    color: Colors.red,
                    child: const Text(
                      'discount',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(model.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      height: 1.3,
                      fontSize: 14,
                    )),
                Row(
                  children: [
                    Text('${model.price.round()}',
                        style: const TextStyle(
                          height: 1.3,
                          fontSize: 10,
                          color: defaultColor,
                        )),
                    const SizedBox(width: 5),
                    if (model.discount != 0)
                      Text('${model.oldPrice.round()}',
                          style: const TextStyle(
                              height: 1.3,
                              fontSize: 10,
                              decoration: TextDecoration.lineThrough)),
                    const Spacer(),
                    IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          ShopCubit.get(context).changeFavorite(model.id);
                        },
                        icon: Icon(
                          Icons.favorite_border_rounded,
                          color: ShopCubit.get(context).favorites[model.id] ==
                                  false
                              ? defaultColor
                              : Colors.red,
                        ))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
