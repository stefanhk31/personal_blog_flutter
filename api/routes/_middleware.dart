import 'package:blogs_data_source/blogs_data_source.dart';
import 'package:dart_frog/dart_frog.dart';

final _dataSource = ButterCmsBlogsDataSource();

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(provider<BlogsDataSource>((_) => _dataSource));
}
