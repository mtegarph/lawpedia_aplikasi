part of 'model.dart';

class BannerArtikel {
  BannerArtikel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  DataBannerArtikel? data;

  factory BannerArtikel.fromJson(Map<String, dynamic> json) => BannerArtikel(
        status: json["status"],
        message: json["message"],
        data: DataBannerArtikel.fromJson(json["data"]),
      );
}

class DataBannerArtikel {
  DataBannerArtikel({
    this.articles,
  });

  List<Article>? articles;

  factory DataBannerArtikel.fromJson(Map<String, dynamic> json) =>
      DataBannerArtikel(
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );
}

class Article {
  Article({
    this.articleId,
    this.articleTitle,
    this.authorId,
    this.authorFirstName,
    this.authorLastName,
    this.publishedAt,
  });

  int? articleId;
  String? articleTitle;
  int? authorId;
  String? authorFirstName;
  dynamic? authorLastName;
  DateTime? publishedAt;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        articleId: json["article_id"],
        articleTitle: json["article_title"],
        authorId: json["author_id"],
        authorFirstName: json["author_first_name"],
        authorLastName: json["author_last_name"],
        publishedAt: DateTime.parse(json["published_at"]),
      );
}
