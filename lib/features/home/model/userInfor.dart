class User {
  final String name;
  final String designation;
  final int distance;
  final int age;
  final String bio;
  final String imgUrl;
  final String location;
  bool? isLiked;
  bool? isSwipedOff;
  User({
    required this.name,
    required this.designation,
    required this.distance,
    required this.age,
    required this.bio,
    required this.imgUrl,
    required this.location,
    this.isLiked,
    this.isSwipedOff,
  });

  // User(
  //   this.name,
  //   this.designation,
  //   this.mutualFriends,
  //   this.age,
  //   this.bio,
  //   this.imgUrl,
  //   this.location,
  // );
}
