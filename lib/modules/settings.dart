import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cubit/login_cubit/shopapplogin_cubit.dart';
import 'package:shop/cubit/shop_cubit/shop_cubit.dart';
import 'package:shop/shared/constants.dart';
import 'package:shop/themes/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopcubitState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        TextEditingController emailController = TextEditingController();
        TextEditingController nameController = TextEditingController();
        TextEditingController phoneController = TextEditingController();
        if (ShopCubit.get(context).userModel != null) {
          emailController.text = ShopCubit.get(context).userModel!.data!.email!;
          nameController.text = ShopCubit.get(context).userModel!.data!.name!;
          phoneController.text = ShopCubit.get(context).userModel!.data!.phone!;
        }

        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    label: Text('name'), border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                    label: Text('email'), border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    label: Text('phone number'), border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                minWidth: double.infinity,
                height: 50,
                color: defaultColor,
                onPressed: () {
                  signOut(context);
                },
                child: const Text(
                  'Sign OUT',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
