import 'package:butter_cms_client/butter_cms_client.dart';

/// {@template blog_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class BlogRepository {
  /// {@macro blog_repository}
  BlogRepository({required ButterCmsClient butterCmsClient})
      : _butterCmsClient = butterCmsClient;

  final ButterCmsClient _butterCmsClient;
}
