class Post {
  String url;
  String publisher;
  String likes;
  String comments;
  String date;

  Post(this.url, this.publisher, this.likes, this.comments, this.date);

  @override
  String toString() {
    return ' Image url : $url \n Publisher : $publisher \n Likes: $likes \n Comments : $comments \n Publish date : $date \n\n';
  }
}
