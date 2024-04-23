import 'package:equatable/equatable.dart';

import 'image_links.dart';

class VolumeInfo extends Equatable {
  final String? title;
  final List<String>? authors;
  final List<String>? categories;
  final num? averageRating;
  final int? ratingsCount;
  final ImageLinks? imageLinks;
   final String? previewLink;

  const VolumeInfo({
    this.title,
    this.authors,
    this.categories,
    this.averageRating,
    this.ratingsCount,
    required this.imageLinks,
     this.previewLink,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json['title'] == null? null :json['title']as String ,
        authors:json['authors'] == null?null :(json['authors'] as List<dynamic>?)?.cast<String>(),
        categories:json['categories']==null?null: (json['categories'] as List<dynamic>?)?.cast<String>(),
        averageRating: json['averageRating'] ==null?null : json['averageRating'] as num,
        ratingsCount:json['ratingsCount'] ==null?null : json['ratingsCount'] as int?,

        imageLinks:json['imageLinks'] ==null?null:
        ImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>),
        previewLink: json['previewLink'] ==null?null :json['previewLink'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'authors': authors,
        'categories': categories,
        'averageRating': averageRating,
        'ratingsCount': ratingsCount,
        'previewLink': previewLink,

      };

  @override
  List<Object?> get props {
    return [
      title,
      authors,
      categories,
      averageRating,
      ratingsCount,
      imageLinks,
      previewLink,
    ];
  }
}
