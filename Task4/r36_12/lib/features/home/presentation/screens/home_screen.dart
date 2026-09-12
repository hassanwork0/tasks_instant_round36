import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../../core/contants.dart';
import '../cubit/home_cubit.dart';
import '../widgets/header_home_screen.dart';
import '../widgets/list_of_categories.dart';
import '../widgets/list_of_items.dart';
import '../widgets/row_search_filter.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeCubit>().getFoodList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: redColor,
        shape: CircleBorder(),
        child: Icon(
          Icons.add_rounded,
          size: iconSize30,
          color: whiteColor,
          fontWeight: fontWeightBold,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: SafeArea(
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state)  async{
            if (state is HomeLoadingState) {
              EasyLoading.show(
                status: 'Loading...',
              );
            }
            else if (state is HomeLoadedState) {
              EasyLoading.dismiss();
            }

            else if (state is HomeFailureState) {
              EasyLoading.dismiss();
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error, size: 88),
                  Text(
                    (context.read<HomeCubit>().state as HomeFailureState)
                        .errorMessage,
                    style: const TextStyle(fontSize: 22),
                  ),
                ],
              );
            }

          },
          builder: (context, state)  {
             if (state is HomeLoadedState) {
               return Column(
                children: [
                  //text foodgo, text order your , profile image
                  HeaderHomeScreen(),
                  //search bar, icon filter
                  RowSearchFilter(),

                  //list of categories
                  ListOfCategories(
                    categories: state.categoryButtons,
                    selectedCategory: state.selectedCategory,
                    onCategorySelected: (category) {
                      context.read<HomeCubit>().selectCategory(category);
                    },
                  ),

                  //list of items
                  ListOfItems(
                    foodList: state.foods,
                    selectedCategory: state.selectedCategory,
                  ),
                ],
              );
            }
             return const SizedBox();
          },


        ),
      ),

      bottomNavigationBar: BottomAppBar(
        color: redColor,
        shape: CircularNotchedRectangle(),
        elevation: 4,
        notchMargin: 8,
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //home
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                });
              },
              icon: Icon(
                Icons.home_filled,
                color: whiteColor,
                size: currentIndex == 0 ? iconSize30 : iconSize25,
              ),
            ),
            //profile
            Padding(
              padding: const EdgeInsets.only(right: 70),
              child: IconButton(
                icon: Icon(
                  Icons.perm_identity_sharp,
                  color: whiteColor,
                  size: currentIndex == 1 ? iconSize30 : iconSize25,
                ),
                onPressed: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
              ),
            ),
            //chat
            IconButton(
              icon: Icon(
                Icons.chat_outlined,
                color: whiteColor,
                size: currentIndex == 2 ? iconSize30 : iconSize25,
              ),
              onPressed: () {
                setState(() {
                  currentIndex = 2;
                });
              },
            ),
            //favorite
            IconButton(
              icon: Icon(
                Icons.favorite_rounded,
                color: whiteColor,
                size: currentIndex == 3 ? iconSize30 : iconSize25,
              ),
              onPressed: () {
                setState(() {
                  currentIndex = 3;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
