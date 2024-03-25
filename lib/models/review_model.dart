class Review {
  final String review;
  final String rating;
  final String userLogin;

  Review({
    required this.review,
    required this.rating,
    required this.userLogin,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      review: json['review'],
      rating: json['rating'],
      userLogin: json['user_login'] ?? 'Anonymous',
    );
  }
}
