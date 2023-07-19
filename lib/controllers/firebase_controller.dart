import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirebaseController extends GetxController{
  static FirebaseController to = Get.find();

  FirebaseFirestore db = FirebaseFirestore.instance;
  List category = [];
  void getCategory () async {

   final query = await db.collection('Category').get();
    // final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    //   // treasureLocations.add(document.data as Map<String, dynamic>);
    // print(allData);


    for (int i = 0; i < query.docs.length; i++) {
      var a = query.docs[i];
      category.add(a.id);
    }
  }




  void collectionChecking()async {
    final querySnapshot =
    await db.collection('Category').doc("exterior_service").collection("providers").get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i];
      print(a.id);
    }
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
      // treasureLocations.add(document.data as Map<String, dynamic>);
    print(allData.first);

    final query =
    await db.collection('Category').get();
    // final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    //   // treasureLocations.add(document.data as Map<String, dynamic>);
    // print(allData);


    for (int i = 0; i < query.docs.length; i++) {
      var a = query.docs[i];
      print(a.id);
      category.add(a.id);
    }
  // });
    print(category.length);
    print(category.first);

  }
}