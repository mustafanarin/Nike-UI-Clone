import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nike_ui_clone/feature/home/home_detail_view.dart';
import 'package:nike_ui_clone/product/constants/enum/png_general_path.dart';
import 'package:nike_ui_clone/product/constants/project_colors.dart';
import 'package:nike_ui_clone/product/constants/project_strings.dart';
import 'package:nike_ui_clone/product/model/shoe_model.dart';
import 'package:nike_ui_clone/product/utility/extensions/context_extension.dart';
import 'package:nike_ui_clone/product/widgets/project_button.dart';

final class CartView extends StatelessWidget {
  CartView({super.key});

  final List<ShoeModel> cartItems = [
    ShoeModel(
      name: "Nike Jordan",
      category: "Best Seller",
      price: 302.00,
      imagePath: PngGeneralPath.shoe1.path,
    ),
    ShoeModel(
      name: "Nike Club Max",
      category: "Best Seller",
      price: 57.6,
      imagePath: PngGeneralPath.shoe4.path,
    ),
    ShoeModel(
      name: "Nike Club Max",
      category: "Best Seller",
      price: 47.70,
      imagePath: PngGeneralPath.shoe2.path,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.cultured,
      appBar: const _CustomAppBar(),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ItemContText(cartItems: cartItems.length),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 230.h),
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    return _SlidableShoeItem(
                      shoe: cartItems[index],
                    );
                  },
                ),
              ),
            ],
          ),
          const _TotalCostContainer(),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ProjectColors.cultured,
      title: const Text(ProjectStrings.myCart),
      leading: Container(
        margin: EdgeInsets.only(left: 10.w),
        decoration: const BoxDecoration(color: ProjectColors.white, shape: BoxShape.circle),
        child: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ItemContText extends StatelessWidget {
  const _ItemContText({
    required this.cartItems,
  });

  final int cartItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Text(
        "$cartItems ${ProjectStrings.item}",
        style: context.textTheme().titleMedium,
      ),
    );
  }
}

class _TotalCostContainer extends StatelessWidget {
  const _TotalCostContainer();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: 230.h,
        decoration: BoxDecoration(
          color: ProjectColors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: ProjectColors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(ProjectStrings.subtotal,
                      style: context.textTheme().titleMedium?.copyWith(color: ProjectColors.auroMetal)),
                  Text("\$407.30", style: context.textTheme().titleMedium),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(ProjectStrings.delivery,
                      style: context.textTheme().titleMedium?.copyWith(color: ProjectColors.auroMetal)),
                  Text("\$10.00", style: context.textTheme().titleMedium),
                ],
              ),
              SizedBox(height: 12.h),
              const Divider(),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(ProjectStrings.totalCost, style: context.textTheme().titleMedium),
                  Text("\$417.30", style: context.textTheme().titleMedium?.copyWith(color: ProjectColors.brandeisBlue)),
                ],
              ),
              const Spacer(),
              ProjectButton(title: ProjectStrings.checkout, onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}

class _SlidableShoeItem extends StatelessWidget {
  final ShoeModel shoe;

  const _SlidableShoeItem({
    required this.shoe,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Slidable(
        // right shift - quantity control
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(10),
              onPressed: null,
              backgroundColor: ProjectColors.brandeisBlue,
              foregroundColor: ProjectColors.white,
              icon: Icons.add,
            ),
            SlidableAction(
              borderRadius: BorderRadius.circular(10),
              onPressed: null,
              backgroundColor: ProjectColors.dimGray.withOpacity(0.4),
              foregroundColor: ProjectColors.white,
              icon: Icons.remove,
            ),
          ],
        ),
        // left shift - delete cart item
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.2,
          children: [
            SlidableAction(
              onPressed: null,
              borderRadius: BorderRadius.circular(10),
              backgroundColor: ProjectColors.red,
              foregroundColor: ProjectColors.white,
              icon: Icons.delete_outline,
            ),
          ],
        ),

        // Cart item
        child: Container(
          decoration: BoxDecoration(
            color: ProjectColors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              InkWell(
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomeDetailView(shoeModel: shoe))),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: ProjectColors.cultured,
                  ),
                  margin: const EdgeInsets.all(8),
                  width: 100.w,
                  height: 100.h,
                  child: Image.asset(
                    shoe.imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shoe.name,
                        style: context.textTheme().titleMedium,
                      ),
                      SizedBox(height: 8.h),
                      Text("\$${shoe.price.toStringAsFixed(2)}", style: context.textTheme().bodyLarge),
                      SizedBox(height: 4.h),
                      Text(
                        ProjectStrings.quantity,
                        style: context.textTheme().bodyLarge?.copyWith(color: ProjectColors.dimGray),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
