import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_ui_clone/feature/home/home_detail_view.dart';
import 'package:nike_ui_clone/feature/tabbar/tabbar_view.dart';
import 'package:nike_ui_clone/product/constants/enum/png_general_path.dart';
import 'package:nike_ui_clone/product/constants/project_colors.dart';
import 'package:nike_ui_clone/product/constants/project_strings.dart';
import 'package:nike_ui_clone/product/model/shoe_model.dart';
import 'package:nike_ui_clone/product/utility/extensions/context_extension.dart';

final class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ShoeModel> favoriteShoes = [
      ShoeModel(
          name: "Nike Jordan",
          category: "Best Seller",
          price: 302.00,
          imagePath: PngGeneralPath.shoe1.path,
          color1: const Color(0xffCB1D1D),
          color2: const Color(0xff0B2F8B)),
      ShoeModel(
          name: "Nike Air Max",
          category: "Best Seller",
          price: 37.8,
          imagePath: PngGeneralPath.shoe3.path,
          color1: const Color(0xff1F3267),
          color2: const Color(0xffCB1D1D)),
      ShoeModel(
          name: "Nike Club Max",
          category: "Best Seller",
          price: 47.7,
          imagePath: PngGeneralPath.shoe2.path,
          color1: const Color(0xff2256B9),
          color2: const Color(0xffA9CFEB)),
      ShoeModel(
          name: "Nike Club Max",
          category: "Best Seller",
          price: 57.6,
          imagePath: PngGeneralPath.shoe4.path,
          color1: const Color(0xff7DDBDA),
          color2: const Color(0xff606ACB))
    ];

    return Scaffold(
      backgroundColor: ProjectColors.cultured,
      appBar: const _CustomAppBar(),
      body: _FavoriteShoesGridViewList(favoriteShoes: favoriteShoes),
    );
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ProjectColors.cultured,
      leading: Container(
        margin: EdgeInsets.only(left: 10.w),
        decoration: const BoxDecoration(color: ProjectColors.white, shape: BoxShape.circle),
        child: IconButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const BottomNavBar()),
              (route) => false,
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      title: const Text(ProjectStrings.favorite),
      actions: [
        Container(
            decoration: const BoxDecoration(color: ProjectColors.white, shape: BoxShape.circle),
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border))),
        SizedBox(width: 16.w)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _FavoriteShoesGridViewList extends StatelessWidget {
  const _FavoriteShoesGridViewList({
    required this.favoriteShoes,
  });

  final List<ShoeModel> favoriteShoes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0.w),
      child: GridView.builder(
        itemCount: favoriteShoes.length,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.75,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          final favoriteShoe = favoriteShoes[index];
          return InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomeDetailView(
                      shoeModel: favoriteShoe,
                    ))),
            child: Container(
              decoration:
                  const BoxDecoration(color: ProjectColors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(color: ProjectColors.cultured, shape: BoxShape.circle),
                        child: const Icon(
                          Icons.favorite,
                          color: ProjectColors.red,
                          size: 18,
                        ),
                      ),
                      Image.asset(
                        favoriteShoe.imagePath,
                        height: 100.h,
                        fit: BoxFit.contain,
                      ),
                      Text(
                        favoriteShoe.category,
                        style: context.textTheme().bodyLarge?.copyWith(color: ProjectColors.brandeisBlue),
                      ),
                      Text(
                        favoriteShoe.name,
                        style: context.textTheme().titleMedium?.copyWith(color: ProjectColors.dimGray),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Text(
                            "\$${favoriteShoe.price}",
                            style: context.textTheme().bodyLarge,
                          ),
                          const Spacer(),
                          Container(
                            height: 15.h,
                            width: 15.w,
                            decoration: BoxDecoration(color: favoriteShoe.color1, shape: BoxShape.circle),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Container(
                            height: 15.h,
                            width: 15.w,
                            decoration: BoxDecoration(color: favoriteShoe.color2, shape: BoxShape.circle),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
