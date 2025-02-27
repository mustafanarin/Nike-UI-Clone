import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_ui_clone/feature/home/home_detail_view.dart';
import 'package:nike_ui_clone/product/constants/enum/png_general_path.dart';
import 'package:nike_ui_clone/product/constants/project_colors.dart';
import 'package:nike_ui_clone/product/constants/project_strings.dart';
import 'package:nike_ui_clone/product/model/shoe_model.dart';
import 'package:nike_ui_clone/product/utility/extensions/context_extension.dart';
import 'package:nike_ui_clone/product/widgets/project_textfield.dart';

final class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  final List<ShoeModel> _popularShoes = [
    ShoeModel(name: "Nike Jordan", category: "Best Seller", price: 302.00, imagePath: PngGeneralPath.shoe1.path),
    ShoeModel(name: "Nike Club Max", category: "Best Seller", price: 47.7, imagePath: PngGeneralPath.shoe2.path),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.cultured,
      appBar: const _CustomAppbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SearchTextFieldRow(),
          _CategorySelector(
              selectedIndex: _selectedIndex,
              onCategorySelected: (index) {
                setState(() => _selectedIndex = index);
              }),
          const _RowTitleAndSeeMoreButton(ProjectStrings.popularShoes),
          _PopularShoesGridViewList(popularShoes: _popularShoes),
          const _RowTitleAndSeeMoreButton(ProjectStrings.newArrivals),
          const _SummerSaleOfferCard(),
        ],
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
      leading: const Icon(Icons.menu_outlined),
      title: SizedBox(
        width: 200.w,
        height: 60.h,
        child: Stack(
          children: [
            Positioned(left: 30, child: Image.asset(PngGeneralPath.appbarShush.path)),
            Positioned(
              top: 10.h,
              bottom: 10.h,
              left: 50.w,
              right: 10.w,
              child: Text(
                ProjectStrings.explore,
                style: context.textTheme().titleLarge,
              ),
            ),
          ],
        ),
      ),
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

class _SearchTextFieldRow extends StatelessWidget {
  const _SearchTextFieldRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: ProjectColors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const ProjectTextField(
                prefixIcon: Icon(Icons.search),
                hintText: ProjectStrings.search,
                fillColor: ProjectColors.white,
                filled: true,
                keyboardType: TextInputType.name,
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
                  color: ProjectColors.brandeisBlue.withOpacity(0.3),
                  blurRadius: 4.0,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Center(
              child: Icon(
                Icons.tune,
                color: ProjectColors.white,
                size: 24.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PopularShoesGridViewList extends StatelessWidget {
  const _PopularShoesGridViewList({
    required List<ShoeModel> popularShoes,
  }) : _popularShoes = popularShoes;

  final List<ShoeModel> _popularShoes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: GridView.builder(
        itemCount: _popularShoes.length,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.80,
          crossAxisSpacing: 20,
          mainAxisSpacing: 0,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          final popularShoe = _popularShoes[index];
          return InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  HomeDetailView(shoeModel: popularShoe,))),
            child: Container(
              decoration:
                  const BoxDecoration(color: ProjectColors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.favorite_border_outlined,
                          size: 18,
                        ),
                        Image.asset(
                          popularShoe.imagePath,
                          height: 100.h,
                          fit: BoxFit.contain,
                        ),
                        Text(
                          popularShoe.category,
                          style: context.textTheme().bodyLarge?.copyWith(color: ProjectColors.brandeisBlue),
                        ),
                        Text(
                          popularShoe.name,
                          style: context.textTheme().titleMedium?.copyWith(color: ProjectColors.dimGray),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "\$${popularShoe.price}",
                          style: context.textTheme().bodyLarge,
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -5.h,
                    right: -5.w,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: ProjectColors.brandeisBlue,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(35))),
                      child: IconButton(color: ProjectColors.white, onPressed: () {}, icon: const Icon(Icons.add)),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SummerSaleOfferCard extends StatelessWidget {
  const _SummerSaleOfferCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(color: ProjectColors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            top: 20,
            child: Text(
              ProjectStrings.summerSale,
              style: context.textTheme().bodyMedium,
            ),
          ),
          Positioned(
            left: 20,
            top: 35,
            child: Text(
              ProjectStrings.sale,
              style:
                  context.textTheme().titleLarge?.copyWith(color: ProjectColors.slateBlue, fontWeight: FontWeight.w900),
            ),
          ),
          Positioned(left: 2.w, top: 50.h, child: Image.asset(PngGeneralPath.starShush.path)),
          Positioned(left: 120.w, top: 10.h, child: Image.asset(PngGeneralPath.starShush.path)),
          Positioned(left: 330.w, top: 20.h, child: Image.asset(PngGeneralPath.starShush.path)),
          Positioned(left: 150.w, top: 60.h, child: Image.asset(PngGeneralPath.starShush.path)),
          Positioned(left: 220.w, top: 0.h, child: Image.asset(PngGeneralPath.saleShoe.path)),
          Positioned(left: 245.w, top: 85.h, child: Image.asset(PngGeneralPath.footShadow1.path)),
          Positioned(left: 200.w, top: 20.h, child: Image.asset(PngGeneralPath.saleShush.path)),
        ],
      ),
    );
  }
}

class _RowTitleAndSeeMoreButton extends StatelessWidget {
  const _RowTitleAndSeeMoreButton(this.title);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.textTheme().titleMedium,
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                ProjectStrings.seeAll,
                style: TextStyle(color: ProjectColors.brandeisBlue),
              ))
        ],
      ),
    );
  }
}

class _CategorySelector extends StatelessWidget {
  const _CategorySelector({
    required this.selectedIndex,
    required this.onCategorySelected,
    this.categories = const [
      ProjectStrings.allShoes,
      ProjectStrings.outdoor,
      ProjectStrings.tennis,
      ProjectStrings.running,
      ProjectStrings.football
    ],
  });

  final List<String> categories;
  final int selectedIndex;
  final Function(int) onCategorySelected;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 8),
          child: Text(
            ProjectStrings.selectCategory,
            style: context.textTheme().titleMedium,
          ),
        ),
        SizedBox(
          height: 45.h,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(categories.length, (index) {
                return _CategoryButton(
                    text: categories[index],
                    isSelected: selectedIndex == index,
                    onPressed: () => onCategorySelected(index));
              })),
        )
      ],
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  const _CategoryButton({
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130.w,
      child: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected ? ProjectColors.brandeisBlue : ProjectColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0,
          ),
          child: Text(text,
              style: context.textTheme().bodyLarge?.copyWith(
                    color: isSelected ? ProjectColors.white : ProjectColors.black,
                  )),
        ),
      ),
    );
  }
}
