import 'dart:convert';
import 'package:burger_store_ui/core/api/api.dart';
import 'package:burger_store_ui/core/routes/routes.dart';
import 'package:burger_store_ui/features/food/data/model/product_model.dart';
import 'package:burger_store_ui/features/food/presentation/widgets/app_search_bar.dart';
import 'package:burger_store_ui/features/food/presentation/widgets/product_widget.dart';
import 'package:burger_store_ui/features/food/presentation/widgets/title_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        onPressed: () {},
        backgroundColor: Colors.red,
        child: Icon(Icons.add, size: 32, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        margin: EdgeInsets.all(24),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TitleBar(),

            AppSearchBar(),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: FutureBuilder(
                future: Api().getJson(),
                builder: (context, asyncSnapshot) {
                  if (asyncSnapshot.hasData) {
                    final data = ProductModel.fromJson(
                      jsonDecode(asyncSnapshot.data!) as Map<String, dynamic>,
                    );

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      spacing: 10,
                      children: List.generate(data.categoryButtons.length, (
                        index,
                      ) {
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            width: 80,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 234, 238, 247),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              data.categoryButtons[index],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  } else {
                    return (Container());
                  }
                },
              ),
            ),

            Expanded(
              child: FutureBuilder(
                future: Api().getJson(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = ProductModel.fromJson(
                      jsonDecode(snapshot.data!) as Map<String, dynamic>,
                    );
                    return GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: data.products.length,
                      itemBuilder: (context, index) {
                        final product = data.products[index];
                        return InkWell(
                          child: Hero(
                            tag: product.name,
                            child: ProductWidget(product: product),
                          ),
                          onTap: () => {
                           context.push(
                              Routes.product,
                              extra: product,
                            )
                          },
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 240,
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 30,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text("error ${snapshot.error}"));
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.home, size: 32, color: Colors.white),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person, size: 32, color: Colors.white),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.chat, size: 32, color: Colors.white),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border, size: 32, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
