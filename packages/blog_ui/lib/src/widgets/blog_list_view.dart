import 'package:flutter/material.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

/// {@template blog_overview_list}
/// A widget that displays an infinitely scrolling list of blog content
/// within a [CustomScrollView]. Can take an optional header widget
/// that must also be a sliver.
/// {@endtemplate}
class BlogListView extends StatelessWidget {
  /// {@macro blog_overview_list}
  const BlogListView({
    required this.itemBuilder,
    required this.itemCount,
    required this.onFetchData,
    this.isLoading = false,
    this.header,
    super.key,
  });

  /// A function that builds a widget for each item in the list.
  final Widget Function(BuildContext, int) itemBuilder;

  /// The total number of items in the list.
  final int itemCount;

  /// Whether the list is currently loading more data.
  final bool isLoading;

  /// A function that is called when more data needs to be fetched
  /// since the user has scrolled to the bottom of a list.
  final void Function() onFetchData;

  /// An optional header to be displayed at the top of the list.
  final Widget? header;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        if (header != null) header!,
        SliverInfiniteList(
          itemCount: itemCount,
          onFetchData: onFetchData,
          isLoading: isLoading,
          itemBuilder: itemBuilder,
          loadingBuilder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}
