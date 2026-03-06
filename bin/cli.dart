import 'dart:io';

const version = '0.0.1';
void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Hello world!');
  } else if (arguments.first == 'version') {
    print('Version is $version');
  } else if (arguments.first == 'search') {
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}

void printUsage() {
  print(
    "The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'",
  );
}

void searchWikipedia(List<String>? arguments) {
  final String articleTitle;

  // If the user didn't pass in arguments, request an article title.
  if (arguments == null || arguments.isEmpty) {
    // Await input and provide a default empty string if the input is null.
    articleTitle = stdin.readLineSync() ?? '';
  } else {
    // Otherwise, join the arguments into a single string.
    articleTitle = arguments.join(' ');
  }
  print("Looking for articles about $articleTitle. Please wait.");
  print('Here you go.');
  print('Articles on $articleTitle');
}
