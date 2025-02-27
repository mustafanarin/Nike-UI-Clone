
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nike_ui_clone/feature/tabbar/tabbar_view.dart';
import 'package:nike_ui_clone/product/constants/enum/png_general_path.dart';
import 'package:nike_ui_clone/product/constants/project_colors.dart';
import 'package:nike_ui_clone/product/model/shoe_model.dart';
import 'package:nike_ui_clone/product/utility/extensions/context_extension.dart';

class CartView extends StatelessWidget {
   CartView({super.key});

  final List<ShoeModel> cartItems = [
    ShoeModel(
      name: "Nike Jordan",
      category: "Best Seller",
      price: 302.00,
      imagePath: PngGeneralPath.shoe1.path,
    ),
    ShoeModel(
      name: "Nike Air Max",
      category: "Best Seller",
      price: 37.80,
      imagePath: PngGeneralPath.shoe3.path,
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
      appBar: AppBar(
        backgroundColor: ProjectColors.cultured,
        title: const Text("My Cart"),
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
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  "${cartItems.length} item",
                  style: context.textTheme().titleMedium,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 200), 
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    return SlidableShoeItem(
                      shoe: cartItems[index],
                    );
                  },
                ),
              ),
            ],
          ),
          
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 200,
              decoration: const BoxDecoration(
                color: ProjectColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, -2),
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
                        Text(
                          "Subtotal", 
                          style: TextStyle(fontSize: 16.sp, color: Colors.grey)
                        ),
                        Text(
                          "\$387.50", 
                          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Shipping", 
                          style: TextStyle(fontSize: 16.sp, color: Colors.grey)
                        ),
                        Text(
                          "\$10.00", 
                          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Divider(),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total", 
                          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)
                        ),
                        Text(
                          "\$397.50", 
                          style: TextStyle(
                            fontSize: 18.sp, 
                            fontWeight: FontWeight.bold,
                            color: ProjectColors.brandeisBlue,
                          )
                        ),
                      ],
                    ),
                    Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ProjectColors.brandeisBlue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          "Checkout",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SlidableShoeItem extends StatelessWidget {
  final ShoeModel shoe;

  const SlidableShoeItem({
    super.key,
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
              Container(
                width: 100.w,
                height: 100.h,
                padding: EdgeInsets.all(8.w),
                child: Image.asset(
                  shoe.imagePath,
                  fit: BoxFit.contain,
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
                        "Quantity: 1",
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
