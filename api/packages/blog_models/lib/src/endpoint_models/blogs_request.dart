import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blogs_request.g.dart';

/// {@template blogs_request}
/// Data model for the API request to fetch a list of blog posts.
/// {@endtemplate}
@JsonSerializable()
class BlogsRequest extends Equatable {
  /// {@macro blogs_request}
  const BlogsRequest({
    this.excludeBody = true,
    this.limit = 10,
    this.offset = 0,
    this.authorSlug,
    this.categorySlug,
    this.tagSlug,
  });

  /// Factory method to create a BlogsRequest object from a JSON map.
  factory BlogsRequest.fromJson(Map<String, dynamic> json) =>
      _$BlogsRequestFromJson(json);

  /// Convert the BlogsRequest object to a JSON map.
  Map<String, dynamic> toJson() => _$BlogsRequestToJson(this);

  static String _toQueryParameter(dynamic value) => value.toString();

  static bool _boolFromQueryParameter(String param) {
    return param == 'true';
  }

  static int _intFromQueryParameter(String param) {
    return int.parse(param);
  }

  /// Whether to exclude the HTML body of blog posts in the response
  /// for performance reasons.
  @JsonKey(
    toJson: _toQueryParameter,
    fromJson: _boolFromQueryParameter,
  )
  final bool excludeBody;

  /// Slug of the author to filter blog posts by.
  @JsonKey(
    toJson: _toQueryParameter,
  )
  final String? authorSlug;

  /// Slug of the category to filter blog posts by.
  @JsonKey(
    toJson: _toQueryParameter,
  )
  final String? categorySlug;

  /// Slug of the tag to filter blog posts by.
  @JsonKey(
    toJson: _toQueryParameter,
  )
  final String? tagSlug;

  /// Maximum number of blog posts to return in the response.
  @JsonKey(
    toJson: _toQueryParameter,
    fromJson: _intFromQueryParameter,
  )
  final int limit;

  /// Number of blog posts to skip in the response.
  @JsonKey(
    toJson: _toQueryParameter,
    fromJson: _intFromQueryParameter,
  )
  final int offset;

  @override
  List<Object?> get props => [
        excludeBody,
        limit,
        offset,
        authorSlug,
        categorySlug,
        tagSlug,
      ];
}

/// Default limit for how many blog posts to fetch per API call.
const defaultRequestLimit = 10;

/// Default offset for how many blog posts to skip per API call.
const defaultRequestOffset = 0;
