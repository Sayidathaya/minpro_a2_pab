import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/review.dart';

class ReviewService {
  final supabase = Supabase.instance.client;

  Future<List<Review>> getReviews() async {
    try {
      final userId = supabase.auth.currentUser?.id;
      if (userId == null) throw Exception('User tidak terautentikasi');

      final response = await supabase
          .from('reviews')
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false);

      return (response as List)
          .map((e) => Review.fromJson(e))
          .toList();
    } catch (e) {
      throw Exception('Gagal mengambil data: $e');
    }
  }

  Future<void> addReview(String title, int rating, String review) async {
    try {
      final userId = supabase.auth.currentUser?.id;
      if (userId == null) throw Exception('User tidak terautentikasi');

      await supabase.from('reviews').insert({
        'title': title,
        'rating': rating,
        'review': review,
        'user_id': userId,
        'created_at': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw Exception('Gagal menambah data: $e');
    }
  }

  Future<void> updateReview(
      String id, String title, int rating, String review) async {
    try {
      final userId = supabase.auth.currentUser?.id;
      if (userId == null) throw Exception('User tidak terautentikasi');

      await supabase
          .from('reviews')
          .update({
            'title': title,
            'rating': rating,
            'review': review,
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', id)
          .eq('user_id', userId); // Pastikan user hanya bisa update miliknya
    } catch (e) {
      throw Exception('Gagal mengupdate data: $e');
    }
  }

  Future<void> deleteReview(String id) async {
    try {
      final userId = supabase.auth.currentUser?.id;
      if (userId == null) throw Exception('User tidak terautentikasi');

      await supabase
          .from('reviews')
          .delete()
          .eq('id', id)
          .eq('user_id', userId); // Pastikan user hanya bisa hapus miliknya
    } catch (e) {
      throw Exception('Gagal menghapus data: $e');
    }
  }
}