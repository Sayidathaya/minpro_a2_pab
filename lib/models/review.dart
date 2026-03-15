class Review {
  final String id;
  final String title;
  final int rating;
  final String review;
  final String userId;
  final DateTime? createdAt;

  Review({
    required this.id,
    required this.title,
    required this.rating,
    required this.review,
    required this.userId,
    this.createdAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      rating: json['rating'] ?? 0,
      review: json['review'] ?? '',
      userId: json['user_id'] ?? '',
      createdAt: json['created_at'] != null 
          ? DateTime.parse(json['created_at']) 
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'rating': rating,
      'review': review,
      'user_id': userId,
    };
  }
}