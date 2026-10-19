// Widget tests run the app without a phone or emulator: `flutter test`.
// WidgetTester lets us type, tap, and then check what is on screen.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:toddo_app/main.dart';

void main() {
  // Tests have no real device storage, so give shared_preferences a fake,
  // empty one before each test. Each test starts with no saved tasks.
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('Add, complete, and delete a task', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    // The app loads saved tasks first (spinner). pumpAndSettle() keeps
    // redrawing until loading is finished and the page is showing.
    await tester.pumpAndSettle();

    // The empty-state message shows when there are no tasks.
    expect(find.text('No tasks yet! Add one above.'), findsOneWidget);

    // Type a task and tap Add. pump() redraws the screen after setState.
    await tester.enterText(find.byType(TextField), 'Buy milk');
    await tester.tap(find.text('Add'));
    await tester.pump();

    expect(find.text('Buy milk'), findsOneWidget);
    expect(find.text('No tasks yet! Add one above.'), findsNothing);

    // Tick the checkbox: the task is now marked done.
    await tester.tap(find.byType(Checkbox));
    await tester.pump();
    expect(tester.widget<Checkbox>(find.byType(Checkbox)).value, isTrue);

    // Delete it by swiping the row to the left: we're back to the empty message.
    await tester.drag(find.text('Buy milk'), const Offset(-500, 0));
    await tester.pumpAndSettle();
    expect(find.text('Buy milk'), findsNothing);
    expect(find.text('No tasks yet! Add one above.'), findsOneWidget);
  });

  testWidgets('Empty or blank input does not add a task', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), '   ');
    await tester.tap(find.text('Add'));
    await tester.pump();

    expect(find.byType(ListTile), findsNothing);
  });

  testWidgets('Tap a task to edit its title', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'Buy milk');
    await tester.tap(find.text('Add'));
    await tester.pump();

    // Tapping the row opens the dialog. pumpAndSettle waits for its animation.
    await tester.tap(find.text('Buy milk'));
    await tester.pumpAndSettle();

    // The dialog's TextField is the last one on screen.
    await tester.enterText(find.byType(TextField).last, 'Buy bread');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(find.text('Buy bread'), findsOneWidget);
    expect(find.text('Buy milk'), findsNothing);
  });

  testWidgets('Saved tasks are loaded when the app starts', (tester) async {
    // Pretend a task was saved last time the app was open.
    SharedPreferences.setMockInitialValues({
      'tasks': '[{"title":"Saved task","isDone":true}]',
    });

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Saved task'), findsOneWidget);
    expect(tester.widget<Checkbox>(find.byType(Checkbox)).value, isTrue);
  });
}
