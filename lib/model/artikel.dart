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
    this.articleThumbnail,
    this.publishedAt,
  });

  int? articleId;
  String? articleTitle;
  int? authorId;
  String? articleThumbnail;
  String? authorFirstName;
  dynamic? authorLastName;
  DateTime? publishedAt;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        articleId: json["article_id"],
        articleTitle: json["article_title"],
        articleThumbnail: json["article_thumbnail"] == null
            ? null
            : json["article_thumbnail"],
        authorId: json["author_id"],
        authorFirstName: json["author_first_name"],
        authorLastName: json["author_last_name"],
        publishedAt: DateTime.parse(json["published_at"]),
      );
}

class ArtikelList {
  ArtikelList({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  DataListArticle? data;

  factory ArtikelList.fromJson(Map<String, dynamic> json) => ArtikelList(
        status: json["status"],
        message: json["message"],
        data: DataListArticle.fromJson(json["data"]),
      );
}

class DataListArticle {
  DataListArticle({
    this.popularArticles,
    this.articles,
  });

  List<PopularArticle>? popularArticles;
  Articles? articles;

  factory DataListArticle.fromJson(Map<String, dynamic> json) =>
      DataListArticle(
        popularArticles: List<PopularArticle>.from(
            json["popular_articles"].map((x) => PopularArticle.fromJson(x))),
        articles: Articles.fromJson(json["articles"]),
      );
}

class Articles {
  Articles({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
  });

  int? currentPage;
  List<PopularArticle>? data;
  String? firstPageUrl;
  int? from;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;

  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
        currentPage: json["current_page"],
        data: List<PopularArticle>.from(
            json["data"].map((x) => PopularArticle.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
      };
}

class PopularArticle {
  PopularArticle(
      {this.articleId,
      this.articleTitle,
      this.authorId,
      this.authorFirstName,
      this.authorLastName,
      this.articleViews,
      this.publishedAt,
      this.articleThumbnail});

  int? articleId;
  String? articleTitle;
  int? authorId;
  String? authorFirstName;
  String? articleThumbnail;
  dynamic? authorLastName;
  int? articleViews;
  DateTime? publishedAt;

  factory PopularArticle.fromJson(Map<String, dynamic> json) => PopularArticle(
        articleId: json["article_id"],
        articleTitle: json["article_title"],
        articleThumbnail: json["article_thumbnail"] == null
            ? null
            : json["article_thumbnail"],
        authorId: json["author_id"],
        authorFirstName: json["author_first_name"],
        authorLastName: json["author_last_name"],
        articleViews: json["article_views"],
        publishedAt: DateTime.parse(json["published_at"]),
      );

  Map<String, dynamic> toJson() => {
        "article_id": articleId,
        "article_title": articleTitle,
        "author_id": authorId,
        "author_first_name": authorFirstName,
        "author_last_name": authorLastName,
        "article_views": articleViews,
        "published_at": publishedAt?.toIso8601String(),
      };
}

class ArtikelDetail {
  ArtikelDetail({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  DataDetailArtikel? data;

  factory ArtikelDetail.fromJson(Map<String, dynamic> json) => ArtikelDetail(
        status: json["status"],
        message: json["message"],
        data: DataDetailArtikel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class DataDetailArtikel {
  DataDetailArtikel({
    this.detailArtikel,
  });

  DetailArtikel? detailArtikel;

  factory DataDetailArtikel.fromJson(Map<String, dynamic> json) =>
      DataDetailArtikel(
        detailArtikel: DetailArtikel.fromJson(json["detail_artikel"]),
      );

  Map<String, dynamic> toJson() => {
        "detail_artikel": detailArtikel?.toJson(),
      };
}

class DetailArtikel {
  DetailArtikel(
      {this.articleId,
      this.articleTitle,
      this.articleBody,
      this.authorId,
      this.authorFirstName,
      this.authorLastName,
      this.articleViews,
      this.publishedAt,
      this.articleThumbnail});

  int? articleId;
  String? articleTitle;
  String? articleBody;
  int? authorId;
  String? authorFirstName;
  String? articleThumbnail;
  dynamic? authorLastName;
  int? articleViews;
  DateTime? publishedAt;

  factory DetailArtikel.fromJson(Map<String, dynamic> json) => DetailArtikel(
        articleId: json["article_id"],
        articleTitle: json["article_title"],
        articleBody: json["article_body"],
        authorId: json["author_id"],
        authorFirstName: json["author_first_name"],
        articleThumbnail: json["article_thumbnail"] == null
            ? null
            : json["article_thumbnail"],
        authorLastName: json["author_last_name"],
        articleViews: json["article_views"],
        publishedAt: DateTime.parse(json["published_at"]),
      );

  Map<String, dynamic> toJson() => {
        "article_id": articleId,
        "article_title": articleTitle,
        "article_body": articleBody,
        "author_id": authorId,
        "author_first_name": authorFirstName,
        "author_last_name": authorLastName,
        "article_views": articleViews,
        "published_at": publishedAt?.toIso8601String(),
      };
}

class SearchArtikel {
  SearchArtikel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  DataSearchArtikel? data;

  factory SearchArtikel.fromJson(Map<String, dynamic> json) => SearchArtikel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : DataSearchArtikel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? null : data?.toJson(),
      };
}

class DataSearchArtikel {
  DataSearchArtikel({
    this.popularArticles,
    this.articles,
  });

  List<PopularArticleSearch>? popularArticles;
  ArticlesSearch? articles;

  factory DataSearchArtikel.fromJson(Map<String, dynamic> json) =>
      DataSearchArtikel(
        popularArticles: json["popular_articles"] == null
            ? null
            : List<PopularArticleSearch>.from(json["popular_articles"]
                .map((x) => PopularArticleSearch.fromJson(x))),
        articles: json["articles"] == null
            ? null
            : ArticlesSearch.fromJson(json["articles"]),
      );

  Map<String, dynamic> toJson() => {
        "popular_articles": popularArticles == null
            ? null
            : List<dynamic>.from(popularArticles!.map((x) => x.toJson())),
        "articles": articles == null ? null : articles?.toJson(),
      };
}

class ArticlesSearch {
  ArticlesSearch({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
  });

  int? currentPage;
  List<PopularArticleSearch>? data;
  String? firstPageUrl;
  int? from;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic? prevPageUrl;
  int? to;

  factory ArticlesSearch.fromJson(Map<String, dynamic> json) => ArticlesSearch(
        currentPage: json["current_page"],
        data: json["data"] == null
            ? null
            : List<PopularArticleSearch>.from(
                json["data"].map((x) => PopularArticleSearch.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
      };
}

class PopularArticleSearch {
  PopularArticleSearch({
    this.articleId,
    this.articleTitle,
    this.authorId,
    this.authorFirstName,
    this.authorLastName,
    this.articleViews,
    this.publishedAt,
  });

  int? articleId;
  String? articleTitle;
  int? authorId;
  String? authorFirstName;
  dynamic? authorLastName;
  int? articleViews;
  DateTime? publishedAt;

  factory PopularArticleSearch.fromJson(Map<String, dynamic> json) =>
      PopularArticleSearch(
        articleId: json["article_id"],
        articleTitle: json["article_title"],
        authorId: json["author_id"],
        authorFirstName: json["author_first_name"],
        authorLastName: json["author_last_name"],
        articleViews: json["article_views"],
        publishedAt: json["published_at"] == null
            ? null
            : DateTime.parse(json["published_at"]),
      );

  Map<String, dynamic> toJson() => {
        "article_id": articleId,
        "article_title": articleTitle,
        "author_id": authorId,
        "author_first_name": authorFirstName,
        "author_last_name": authorLastName,
        "article_views": articleViews,
        "published_at":
            publishedAt == null ? null : publishedAt?.toIso8601String(),
      };
}
