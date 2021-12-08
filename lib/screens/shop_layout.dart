import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cubit/shop_cubit/shop_cubit.dart';
import 'package:shop/modules/search.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopcubitState>(
        builder: (context, state) {
          var cubit = ShopCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchScreen(),
                          ));
                    },
                    icon: Icon(Icons.search))
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                cubit.onIndexChange(index);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.apps), label: 'catergories'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'favorits'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'settings'),
              ],
              currentIndex: cubit.currentIndex,
            ),
            body: cubit.pages[cubit.currentIndex],
          );
        },
        listener: (context, state) {});
  }
}
