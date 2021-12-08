import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cubit/shop_cubit/shop_cubit.dart';
import 'package:shop/model/categories_model.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopcubitState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ListView.separated(
          itemBuilder: (context, index) => builditem(
              ShopCubit.get(context).categoryModel!.data!.data[index]),
          separatorBuilder: (context, index) => const Divider(
            height: 2,
          ),
          itemCount: ShopCubit.get(context).categoryModel!.data!.data.length,
        );
      },
    );
  }

  Widget builditem(DataModel model) => Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Image.network(
              model.image,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(model.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
      );
}
