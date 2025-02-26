import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_ui_clone/product/constants/project_colors.dart';
import 'package:nike_ui_clone/product/utility/extensions/context_extension.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.cultured,
      appBar: AppBar(
        backgroundColor: ProjectColors.cultured,
        leading: const Icon(Icons.menu_outlined),
        title: SizedBox(
          width: 200.w,
          height: 60.h,
          child: Stack(
            children: [
              Positioned(left: 30, child: Image.asset("assets/png/general/appbar_shush.png")),
              Positioned(
                top: 10.h,
                bottom: 10.h,
                left: 50.w,
                right: 10.w,
                child: Text(
                  "Explore",
                  style: context.textTheme().titleLarge,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              Container(
                  decoration: const BoxDecoration(color: ProjectColors.white, shape: BoxShape.circle),
                  child: IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_basket_outlined))),
              Positioned(
                right: 8.w,
                top: 2.h,
                child: Container(
                  width: 8.w,
                  height: 8.h,
                  decoration: const BoxDecoration(color: ProjectColors.red, shape: BoxShape.circle),
                ),
              )
            ],
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Looking for shoes",
                          fillColor: ProjectColors.white,
                          filled: true),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16.w),
                  width: 56.0,
                  height: 56.0,
                  decoration: BoxDecoration(
                    color: ProjectColors.brandeisBlue,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.3),
                        blurRadius: 4.0,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.tune,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Select Category",style: context.textTheme().titleMedium,),

            ],
          )
        ],
      ),
    );
  }
}
