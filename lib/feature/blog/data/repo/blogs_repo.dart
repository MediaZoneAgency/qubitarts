import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/db/cash_helper.dart';
import '../model/post_model.dart';

class PostsRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collection = 'Qhub';

  Future<String?> _getUserId() async =>
      await CashHelper.getStringScoured(key: Keys.token);

  Future<Either<String, List<PostModel>>> getSavedPosts() async {
    final userId = await _getUserId();
    if (userId == null) return const Left('User not logged in');
    try {
      final querySnapshot = await _firestore
          .collection(_collection)
          .where('saves', arrayContains: userId)
          .get();

      final posts = querySnapshot.docs
          .map((doc) => PostModel.fromMap(doc.data()).copyWith(id: doc.id))
          .toList();

      return Right(posts);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<PostModel>>> getPosts() async {
    try {
      final querySnapshot = await _firestore.collection(_collection).get();
      final posts = querySnapshot.docs
          .map((doc) => PostModel.fromMap(doc.data()).copyWith(id: doc.id))
          .toList();
      return Right(posts);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<PostModel>>> fetchPostsByCategory(
      String category) async {
    try {
      if (category == 'All') return getPosts();

      final querySnapshot = await _firestore
          .collection(_collection)
          .where('Category', isEqualTo: category)
          .get();

      final posts = querySnapshot.docs
          .map((doc) => PostModel.fromMap(doc.data()).copyWith(id: doc.id))
          .toList();

      return Right(posts);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<void> _updateArrayField(
      String postId, String field, String userId, bool add) async {
    final ref = _firestore.collection(_collection).doc(postId);
    final update = {
      field: add
          ? FieldValue.arrayUnion([userId])
          : FieldValue.arrayRemove([userId])
    };

    await ref.update(update);
  }

  Future<void> likePost(String postId) async {
    final userId = await _getUserId();
    if (userId != null) await _updateArrayField(postId, 'likes', userId, true);
  }

  Future<void> disLikePost(String postId) async {
    final userId = await _getUserId();
    if (userId != null) await _updateArrayField(postId, 'likes', userId, false);
  }

  Future<void> savePost(String postId) async {
    final userId = await _getUserId();
    if (userId != null) await _updateArrayField(postId, 'saves', userId, true);
  }

  Future<void> disSavePost(String postId) async {
    final userId = await _getUserId();
    if (userId != null) await _updateArrayField(postId, 'saves', userId, false);
  }
}
