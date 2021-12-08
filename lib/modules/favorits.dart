import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cubit/shop_cubit/shop_cubit.dart';
import 'package:shop/model/favorites_model.dart';
import 'package:shop/themes/colors.dart';

class FavoritScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopcubitState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return state is ShopLoadingGetFavoritesState
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                itemBuilder: (context, index) => buildFavItem(context,
                    ShopCubit.get(context).favModel!.data!.data![index]),
                itemCount: ShopCubit.get(context).favModel!.data!.data!.length,
                separatorBuilder: (context, index) => const Divider(
                  height: 3,
                ),
              );
      },
    );
  }

  Widget buildFavItem(BuildContext context, FavoritesData model) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 120,
          child: Row(
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image.network(
                    model.product!.image,
                    width: 120,
                    height: 120,
                  ),
                  if (model.product!.discount != 0)
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
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.product!.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          height: 1.3,
                          fontSize: 14,
                        )),
                    const Spacer(),
                    Row(
                      children: [
                        Text('${model.product!.price}',
                            style: const TextStyle(
                              height: 1.3,
                              fontSize: 10,
                              color: defaultColor,
                            )),
                        const SizedBox(width: 5),
                        if (model.product!.discount != 0)
                          Text('${model.product!.oldPrice}',
                              style: const TextStyle(
                                  height: 1.3,
                                  fontSize: 10,
                                  decoration: TextDecoration.lineThrough)),
                        const Spacer(),
                        IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              ShopCubit.get(context)
                                  .changeFavorite(model.product!.id);
                            },
                            icon: Icon(
                              Icons.favorite_border_rounded,
                              color: ShopCubit.get(context)
                                          .favorites[model.product!.id] ==
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
        ),
      );
}
