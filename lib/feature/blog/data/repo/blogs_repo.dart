import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/db/cash_helper.dart';
import '../model/post_model.dart';



class PostsRepo {

  Future<Either<String, List<PostModel>>> getPosts() async {
    try {
      // Fetching posts from Firestore
      final querySnapshot =
      await FirebaseFirestore.instance.collection('Qhub').get();

      // Mapping Firestore documents to PostModel
      final posts = querySnapshot.docs.map((doc) {
        // Use `doc.id` as the document ID
        return PostModel.fromMap(doc.data()).copyWith(id: doc.id);
      }).toList();

      return Right(posts);
    } catch (e) {
      // Catching errors and returning them as the left side of Either
      return Left(e.toString());
    }
  }

  Future<void> likePost(String postID)async{
     String? userID=await CashHelper.getStringScoured(key: Keys.token);
    // String ?userId= FirebaseFirestore.instance.collection('users').doc(userID);
    try{
      await FirebaseFirestore.instance.collection('Qhub').doc(postID).update({'likes':FieldValue.arrayUnion([userID])});
    }catch(e){
      print(e);
    }
  }
  Future<void> disLikePost(String postID)async{
    String? userID=await CashHelper.getStringScoured(key: Keys.token);
    //DocumentReference userPath= FirebaseFirestore.instance.collection('users').doc(userID);
    try{
      await FirebaseFirestore.instance.collection('Qhub').doc(postID).update({'likes':FieldValue.arrayRemove([userID])});
    }catch(e){
      print(e);
    }
  }
  Future<Either<String, List<PostModel>>> fetchPostsByCategory(String category) async {
    try {
      // Reference to the Firestore collection
      if(category == 'All') {
        return getPosts();
      }
      else{
        final collection = FirebaseFirestore.instance.collection('Qhub');

        // Query to filter posts by category
        final querySnapshot = await collection.where('Category', isEqualTo: category).get();

        // Process the retrieved posts
        final posts = querySnapshot.docs.map((doc) => PostModel.fromMap(doc.data() as Map<String, dynamic>))
            .toList();
        print('Filtered Posts: $posts');
        return Right(posts);
      }



    } catch (e) {
      return Left(e.toString());

    }
  }
}


