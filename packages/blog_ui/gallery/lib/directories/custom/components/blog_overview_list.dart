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

class _BlogOverviewList extends StatefulWidget {
  const _BlogOverviewList();

  @override
  State<_BlogOverviewList> createState() => _BlogOverviewListState();
}

class _BlogOverviewListState extends State<_BlogOverviewList> {
  int itemCount = 10;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlogOverviewList(
      itemCount: itemCount,
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
      isLoading: isLoading,
      onFetchData: () async {
        setState(() {
          isLoading = true;
        });

        await Future<void>.delayed(const Duration(seconds: 3));

        if (!mounted) {
          return;
        }
        setState(() {
          itemCount += 10;
          isLoading = false;
        });
      },
    );
  }
}

class _BlogOverviewListUseCase extends WidgetbookUseCase {
  _BlogOverviewListUseCase()
      : super(
          name: 'BlogOverviewList',
          builder: (context) => const _BlogOverviewList(),
        );
}
