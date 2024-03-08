import 'package:bloc_test/bloc_test.dart';
import 'package:blog_repository/blog_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:personal_blog_flutter/app/app.dart';
import 'package:personal_blog_flutter/app/bloc/app_bloc.dart';
import 'package:personal_blog_flutter/app/widgets/footer.dart';
import 'package:personal_blog_flutter/blog_overview/view/blog_overview_page.dart';

class _MockBlogRepository extends Mock implements BlogRepository {}

class _MockAppBloc extends MockBloc<AppEvent, AppState> implements AppBloc {}

void main() {
  group('App', () {
    late BlogRepository blogRepository;
    late AppBloc appBloc;

    setUp(() {
      blogRepository = _MockBlogRepository();
      when(blogRepository.getBlogPreviews).thenAnswer((_) async => []);
      appBloc = _MockAppBloc();
    });

    test('can be instantiated', () {
      expect(
        App(blogRepository: blogRepository),
        isNotNull,
      );
    });

    testWidgets('renders', (tester) async {
      await tester.pumpWidget(
        BlocProvider.value(
          value: appBloc,
          child: App(blogRepository: blogRepository),
        ),
      );
      final context = tester.element(find.byType(App));
      expect(context.read<AppBloc>(), isA<AppBloc>());
      expect(find.byType(BlogOverviewPage), findsOneWidget);
      expect(find.byType(Footer), findsOneWidget);
    });
  });
}
