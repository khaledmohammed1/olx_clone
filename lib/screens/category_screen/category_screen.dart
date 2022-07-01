import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/category_services.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FireBaseService categoryService = FireBaseService();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,color: Colors.black,),
          onPressed: () => Get.back(),
        ),
        title: const Text("Categories",style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: categoryService.categoryCollectionRef.orderBy("catName").get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return
             Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        var doc = snapshot.data!.docs[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Image.network(doc['image'],width: MediaQuery.of(context).size.width*.3,),
                            title: Text(doc['catName'],style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                            trailing: IconButton(
                              icon: const Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey,size: 18,),
                              onPressed: () => {},
                            ),
                          ),
                        );
                      }),
                ),
              ],
          );
        },
      ),
    );
  }
}
