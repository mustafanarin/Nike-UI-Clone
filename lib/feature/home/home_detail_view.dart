import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_ui_clone/product/constants/enum/png_general_path.dart';
import 'package:nike_ui_clone/product/constants/project_colors.dart';
import 'package:nike_ui_clone/product/constants/project_strings.dart';
import 'package:nike_ui_clone/product/model/shoe_model.dart';
import 'package:nike_ui_clone/product/utility/extensions/context_extension.dart';

class HomeDetailView extends StatelessWidget {
  const HomeDetailView({super.key, required this.shoeModel});

  final ShoeModel shoeModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.cultured,
      appBar: const _CustomAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ShoeInfosText(shoeModel: shoeModel),
            _ShoeImage(imagePath: shoeModel.imagePath),
            const _ShoeHorizontalList(),
            const _ShoeDescriptionText(),
            SizedBox(height: 100.h),
            const _FavoriteAndBasketAddButtons()
          ],
        ),
      ),
    );
  }
}

class _CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppbar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ProjectColors.cultured,
      automaticallyImplyLeading: false,
      leading: Container(
        margin: EdgeInsets.only(left: 10.w),
        decoration: const BoxDecoration(color: ProjectColors.white, shape: BoxShape.circle),
        child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      title: const Text(ProjectStrings.sneakerShop),
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
        ),
        SizedBox(width: 16.w)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ShoeInfosText extends StatelessWidget {
  const _ShoeInfosText({
    required this.shoeModel,
  });

  final ShoeModel shoeModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          shoeModel.name,
          style: context.textTheme().titleLarge,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            shoeModel.category,
            style: context.textTheme().titleSmall?.copyWith(fontWeight: FontWeight.w400, color: ProjectColors.dimGray),
          ),
        ),
        Text(
          "\$${shoeModel.price}",
          style: context.textTheme().titleLarge,
        ),
      ],
    );
  }
}

class _ShoeImage extends StatelessWidget {
  const _ShoeImage({
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.asset(
            height: 200.h,
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(top: 100.h, child: Image.asset(PngGeneralPath.shoeEllips.path)),
        Positioned(
          bottom: 20.h,
          left: 160.w,
          right: 160.w,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: ProjectColors.dimGray),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back_ios, size: 15, color: ProjectColors.white),
                Icon(Icons.arrow_forward_ios, size: 15, color: ProjectColors.white),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ShoeDescriptionText extends StatelessWidget {
  const _ShoeDescriptionText();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            ProjectStrings.shoeDescription,
            style: context.textTheme().bodyLarge?.copyWith(color: ProjectColors.dimGray),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              ProjectStrings.readMore,
              style: context.textTheme().bodyLarge?.copyWith(color: ProjectColors.brandeisBlue),
            ),
          ],
        ),
      ],
    );
  }
}

class _FavoriteAndBasketAddButtons extends StatelessWidget {
  const _FavoriteAndBasketAddButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(
          flex: 6,
        ),
        Container(
            decoration: BoxDecoration(color: ProjectColors.grey.withOpacity(0.2), shape: BoxShape.circle),
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border_outlined))),
        const Spacer(
          flex: 10,
        ),
        SizedBox(
          width: 250.w,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: ProjectColors.brandeisBlue),
            icon: const Icon(
              Icons.shopping_basket_outlined,
              color: ProjectColors.white,
            ),
            onPressed: () {},
            label: const Text(
              ProjectStrings.add,
              style: TextStyle(color: ProjectColors.white),
            ),
          ),
        )
      ],
    );
  }
}

class _ShoeHorizontalList extends StatelessWidget {
  const _ShoeHorizontalList();

  @override
  Widget build(BuildContext context) {
    final List<String> shoeImages = [
      'list_shoe1',
      'list_shoe2',
      'list_shoe3',
      'list_shoe4',
      'list_shoe5',
    ];

    return SizedBox(
      height: 80.h,
      child: Row(
        children: shoeImages.map((image) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Container(
                decoration: BoxDecoration(
                  color: ProjectColors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: ProjectColors.dimGray.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/png/general/$image.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
