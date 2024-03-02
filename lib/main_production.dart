import 'package:api_client/api_client.dart';
import 'package:blog_repository/blog_repository.dart';
import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:http/http.dart';
import 'package:personal_blog_flutter/app/app.dart';
import 'package:personal_blog_flutter/bootstrap.dart';

void main() {
  bootstrap(() {
    final apiClient = ApiClient(baseUrl: 'api.buttercms.com', client: Client());
    final butterCmsClient = ButterCmsClient(apiClient: apiClient);
    // ignore: unused_local_variable
    final blogRepository = BlogRepository(blogApiClient: butterCmsClient);
    return App(blogRepository: blogRepository);
  });
}
