import 'package:flutter/material.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

/// {@template blog_overview_list}
/// A widget that displays a scrollable list of blog post previews.
/// {@endtemplate}
class BlogOverviewList extends StatelessWidget {
  /// {@macro blog_overview_list}
  const BlogOverviewList({
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

  /// An optional header to be displayed within a [SliverAppBar
  /// at the top of the list.
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
