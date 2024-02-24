import 'package:api_client/api_client.dart';
import 'package:blogs_data_source/blogs_data_source.dart';
import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:http/http.dart';

final _dataSource = ButterCmsBlogsDataSource(
  client: ButterCmsClient(
    apiClient: ApiClient(baseUrl: 'api.buttercms.com', client: Client()),
  ),
);

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(provider<BlogsDataSource>((_) => _dataSource));
}
