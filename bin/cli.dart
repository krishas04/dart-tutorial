import 'dart:io';
import 'package:http/http.dart' as http;

const version = '0.0.1';
void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Hello world!');
  } else if (arguments.first == 'version') {
    print('Version is $version');
  } else if (arguments.first == 'wikipedia') {
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(
      inputArgs,
    ); //Since main doesn't need to do anything after searchWikipedia completes, you don't need to await it from main. Therefore main doesn't need to be async.
  } else {
    printUsage();
  }
}

void printUsage() {
  print(
    "The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'",
  );
}

Future<String> getWikipediaArticle(String articleTitle) async {
  final url = Uri.http(
    'en.wikipedia.org', // Wikipedia API domain
    '/api/rest_v1/page/summary/$articleTitle', // API path for article summary
  );
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return response.body;
  }
  return 'Error: Failed to fetch article on "$articleTitle". Statuscode: ${response.statusCode}';
}

void searchWikipedia(List<String>? arguments) async {
  final String articleTitle;

  // If the user didn't pass in arguments, request an article title.
  if (arguments == null || arguments.isEmpty) {
    print('Please provide an article title:');
    final inputStdin = stdin.readLineSync();
    if (inputStdin == null || inputStdin.isEmpty) {
      print('No article title provided. Exiting.');
      return;
    }
    articleTitle = inputStdin;
  } else {
    articleTitle = arguments.join(' ');
  }
  print("Looking for articles about $articleTitle. Please wait.");
  var articleContent = await getWikipediaArticle(articleTitle);
  print(articleContent);
}
