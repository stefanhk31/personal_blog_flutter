import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class BlogOverviewListComponent extends WidgetbookComponent {
  BlogOverviewListComponent()
      : super(
          name: 'BlogOverviewList',
          useCases: [
            _BlogOverviewListUseCase(),
          ],
        );
}

class _BlogOverviewListUseCase extends WidgetbookUseCase {
  _BlogOverviewListUseCase()
      : super(
          name: 'BlogOverviewList',
          builder: (context) => BlogOverviewList(
            itemCount: 10,
            itemBuilder: (context, index) => BlogCard(
              title: 'Example Post $index',
              subtitle: 'This is an example blog post. Pretty neat huh?',
              published: DateTime.now(),
              imageUrl: 'https://picsum.photos/${200 + index}',
              imageTag: 'Example Image $index',
              onTap: () {},
            ),
            header: const FlexibleSpaceBar(
              title: Text('Title'),
            ),
            onFetchData: () {},
          ),
        );
}
