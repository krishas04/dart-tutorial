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
  print("SearchWikipedia received arguments: $arguments");
}
