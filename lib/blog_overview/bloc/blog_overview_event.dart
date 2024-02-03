part of 'blog_overview_bloc.dart';

@immutable
sealed class BlogOverviewEvent {}

final class BlogOverviewPostsRequested extends BlogOverviewEvent {}
