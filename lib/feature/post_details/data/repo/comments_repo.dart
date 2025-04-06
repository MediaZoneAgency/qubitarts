import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:qubitarts/feature/post_details/data/model/commentModel.dart';

class CommentsRepo{
 Future <Either<String, List <CommentModel>>>getComments(String postId)async{
    //List <CommentModel> comments=[];
    try{
      final querySnapshot= await FirebaseFirestore.instance.collection('Qhub').doc(postId).collection('comments').get();
      final posts = querySnapshot.docs.map((doc) => CommentModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
      print('post Comments: $posts');
      return Right(posts);
      // comments.add(querySnapshot.docs.map((doc) =>CommentModel.fromMap(doc.data() as Map<String, dynamic>)));
      // print(comments);
      //return right(comments);
  }
  catch(e){
      print(e.toString());
      return left(e.toString());
  }
}
Future <Either<String,dynamic>> addComment(CommentModel comment, String postID)async{
   try{
    var respose= await FirebaseFirestore.instance.collection('Qhub').doc(postID).collection('comments').add(comment.toMap());
    print(respose.id);
     return right(respose.id);


   }catch (e){
     print(e.toString());
     return left(e.toString());
   }
}
}