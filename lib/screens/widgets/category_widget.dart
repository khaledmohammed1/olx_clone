import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/home_services.dart';
import '../category_screen/category_screen.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeService homeService = HomeService();
    return Container(
      child: FutureBuilder<QuerySnapshot>(
        future: homeService.categoryCollectionRef.orderBy("catName",).get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Padding(
              padding:  EdgeInsets.only(top: 60),
              child:  Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return SizedBox(
            height: 200,
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(child: Text("Categories")),
                    TextButton(
                        onPressed: () {
                          Get.to(()=>const CategoriesScreen());
                        },
                        child: Row(
                          children: const [
                            Text("See all"),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            ),
                          ],
                        )),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                       physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        var doc = snapshot.data!.docs[index];
                        return Padding(
                          padding: const EdgeInsets.only(left: 10,top: 6,bottom: 6),
                          child: Column(
                            children: [
                            Image.network(doc['image'],width: MediaQuery.of(context).size.width*.22,fit: BoxFit.cover,),
                            const SizedBox(height: 10,),
                            Flexible(
                          child: Text(doc['catName'],maxLines: 2,textAlign: TextAlign.center,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w700),))

                          ],),
                        );
                      }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
