import 'package:flutter/material.dart';
import 'package:food_app/Widgets/app_button.dart';
import 'package:food_app/Widgets/product_card.dart';
import 'package:food_app/Widgets/search_field.dart';
import 'package:food_app/Widgets/title_bar.dart';
import 'package:food_app/core/colors/colors.dart';
import 'package:food_app/dummy/dummy.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    int selectedNavBarIndex = 0;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          spacing: 10,
          children: [
            //Title bar
            TitleBar(),
            //search bar
            Row(
              spacing: 13,
              children: [
                Expanded(
                    child: SearchField(hintText: 'Search'),
                  ),
                AppButton(icon: Icons.tune,),
            ],),

            //Catigories
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 20,
                children: Dummy.appCategories
              ),
            ),
            SizedBox(
              height: 450,
              child: GridView.builder(
                itemCount: Dummy.cardData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 225,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15  
                ),
                itemBuilder: (context, index){
                  final item = Dummy.cardData[index] ;
                  return ProductCard(item: item);
                }),
            )
          ],),
      ),


      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          BottomNavigationBar(
            currentIndex: selectedNavBarIndex,
            onTap: (index){
              selectedNavBarIndex = index;
              setState(() {
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.appRed,
            selectedItemColor: Colors.white,
            unselectedItemColor: AppColors.appLiteGrey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 10,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded), label: "Profile"),
              BottomNavigationBarItem(icon: Icon(Icons.chat_outlined), label: "Chat"),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_rounded), label: "Favorite"),
            ],
          ),
          Positioned(
            top: -25, // يطلع فوق البار
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: FloatingActionButton(
              shape: CircleBorder(),
              onPressed: () {},
              backgroundColor: Colors.red,
              child: const Icon(Icons.add, color: Colors.white,),
            ),
          ),
      ],),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}





