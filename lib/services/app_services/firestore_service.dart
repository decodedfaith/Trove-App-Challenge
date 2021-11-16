import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trove_app_challenge/models/detail_model.dart';

class  FireService {
  FirebaseFirestore? _firestore;
  TroveDataDetails? _categories;

  TroveDataDetails? getCategories() {
    return _categories;
  }

  Future<void> getCategoriesCollectionFromFirebase() async {

    _firestore = FirebaseFirestore.instance;
    CollectionReference categories = _firestore!.collection('users');

    DocumentSnapshot snapshot =
        await categories.doc('h7ma9gmUH3KSMwINqPh5').get();

    var data = snapshot.data() as Map;

    var categoriesData = data['details'] as Map<String, dynamic>;

    _categories = TroveDataDetails.fromJson(categoriesData);
    
  }
}
