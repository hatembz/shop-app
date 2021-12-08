import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop/cubit/login_cubit/shopapplogin_cubit.dart';
import 'package:shop/network/cache_helper.dart';
import 'package:shop/screens/shop_layout.dart';
import 'package:shop/shared/constants.dart';
import 'package:shop/themes/colors.dart';

class LoginScreen extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BlocConsumer<ShopAppLogingCubit, ShopAppLoginState>(
      listener: (context, state) {
        if (state is ShoppingloginSuccesState) {
          if (state.loginmodel.status == true) {
            CacheHelper.setData(
                    key: 'token', data: state.loginmodel.data!.token)
                .then((value) {
              token = CacheHelper.getData(key: 'token');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ShopLayout()));
            });
            Fluttertoast.showToast(
                msg: state.loginmodel.message,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
          } else {
            Fluttertoast.showToast(
                msg: state.loginmodel.message,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formkey,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'loging now to browse our hot offers',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter valide email';
                          }
                          return null;
                        },
                        controller: emailController,
                        decoration: const InputDecoration(
                            label: Text('email'), border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'enter a valide password';
                          }
                          return null;
                        },
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: ShopAppLogingCubit.get(context).isPasswod,
                        decoration: InputDecoration(
                            label: const Text('password'),
                            suffixIcon: IconButton(
                                icon: Icon(
                                    ShopAppLogingCubit.get(context).suffix),
                                onPressed: ShopAppLogingCubit.get(context)
                                    .changePasswordVisibility),
                            border: const OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      state is ShoppingloginLodingState
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : MaterialButton(
                              minWidth: double.infinity,
                              height: 50,
                              color: defaultColor,
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  ShopAppLogingCubit.get(context).UserLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              child: const Text(
                                'login',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
