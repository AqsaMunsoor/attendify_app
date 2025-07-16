import 'dart:io';

String toPascalCase(String input) {
  return input
      .split('_')
      .map((str) => str[0].toUpperCase() + str.substring(1))
      .join();
}

String toCamelCase(String input) {
  final parts = input.split('_');
  return parts.first +
      parts.skip(1).map((p) => p[0].toUpperCase() + p.substring(1)).join();
}

Future<void> main() async {
  stdout.write("Enter module name (e.g. user_profile, video): ");
  final input = stdin.readLineSync();

  if (input == null || input.trim().isEmpty) {
    print("❌ Invalid name.");
    return;
  }

  final folderName = input.trim().toLowerCase(); // e.g. full_library
  final className = toPascalCase(folderName); // FullLibrary
  final variableName = toCamelCase(folderName); // fullLibrary
  final routePath = '/$folderName';

  final baseDir = Directory('lib/ui/screens/$folderName');
  final widgetsDir = Directory('${baseDir.path}/widgets');
  await baseDir.create(recursive: true);
  await widgetsDir.create(recursive: true);

  final fileCon = File('${baseDir.path}/${folderName}_con.dart');
  final fileScr = File('${baseDir.path}/${folderName}_scr.dart');
  final fileBin = File('${baseDir.path}/${folderName}_bin.dart');

  final widgetFiles = [
    File('${widgetsDir.path}/first_widget.dart'),
    File('${widgetsDir.path}/second_widget.dart'),
    File('${widgetsDir.path}/third_widget.dart'),
  ];

  // Create _con.dart
  await fileCon.writeAsString('''
part of '${folderName}_bin.dart';

class ${className}Con extends GetxController {}
''');

  // Create _scr.dart
  await fileScr.writeAsString('''
part of '${folderName}_bin.dart';

class ${className}Scr extends StatelessWidget {
  const ${className}Scr({super.key});

  @override
  Widget build(BuildContext context) {
    final ${className}Con con = Get.put(${className}Con());
     return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: Space.p.horizontal.t10,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                  FirstWidget(),
                  SecondWidget(),
                  ThirdWidget(),
                  ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
''');

  // Create widgets
  final widgetTemplates = ['FirstWidget', 'SecondWidget', 'ThirdWidget'];

  for (int i = 0; i < widgetFiles.length; i++) {
    final widgetClass = widgetTemplates[i];
    final widgetFile = widgetFiles[i];

    await widgetFile.writeAsString('''
part of '../${folderName}_bin.dart';

class $widgetClass extends StatelessWidget {
  const $widgetClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('$widgetClass Placeholder');
  }
}
''');
  }

  // Create _bin.dart with widget parts
  final widgetParts = widgetFiles
      .map((file) => "part 'widgets/${file.uri.pathSegments.last}';")
      .join('\n');

  await fileBin.writeAsString('''
// Import Statements
import 'package:flutter/material.dart';
import 'package:employee_app/configs/configs.dart';
import 'package:get/get.dart';

part '${folderName}_con.dart';
part '${folderName}_scr.dart';
$widgetParts

class ${className}Bin extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ${className}Con());
  }
}
''');

  print("✅ Module '$folderName' created in lib/presentations/$folderName.");

  // Update app_routes.dart
  final appRoutesFile = File('lib/router/routes.dart');
  if (!await appRoutesFile.exists()) {
    print("⚠️  app_routes.dart not found in lib/utils/");
    return;
  }

  final appRoutesContent = await appRoutesFile.readAsString();

  final importLine =
      "import 'package:employee_app/presentations/$folderName/${folderName}_bin.dart';";

  final newGetPage = '''
    GetPage(
      name: AppRoutes.$variableName,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 200),
      page: () => const ${className}Scr(),
      bindings: [${className}Bin()],
    ),
''';

  String updatedContent = appRoutesContent;

  // Add import if not already present
  if (!appRoutesContent.contains(importLine)) {
    updatedContent = importLine + '\n' + updatedContent;
  }

  // Add static String route
  final routeEntry = "static String $variableName = '$routePath';";
  if (!updatedContent.contains(routeEntry)) {
    updatedContent = updatedContent.replaceFirst(
      'class AppRoutes {',
      'class AppRoutes {\n  $routeEntry',
    );
  }

  // Insert into pages list
  final pagesRegex = RegExp(r'static List<GetPage> pages = \[\s*([\s\S]*?)\];');
  final match = pagesRegex.firstMatch(updatedContent);
  if (match != null) {
    final existingPages = match.group(1);
    if (!existingPages!.contains('${className}Scr')) {
      final updatedPages = existingPages + newGetPage;
      updatedContent = updatedContent.replaceFirst(
        pagesRegex,
        'static List<GetPage> pages = [\n$updatedPages];',
      );
    }
  } else {
    print("⚠️ Could not find pages list in app_routes.dart");
  }

  await appRoutesFile.writeAsString(updatedContent);

  print(
    "✅ Updated app_routes.dart with route and import for '$folderName' as AppRoutes.$variableName.",
  );
}
