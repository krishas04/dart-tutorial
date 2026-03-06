1. Run the following command to check your Dart SDK version:
  ```
  dart --version
  ```

2. Run the following command to generates a basic Dart project named "cli":
  ```
  dart create cli
  ```

3. Run the following command to run your program:
  ```
  dart run
  ```
**Note**: The `bin/` directory is where your executable code lives. `cli.dart` is the entry point of your application.
Inside, you'll see the `main` function. Every Dart program starts executing from its `main` function.

4. Run your application with the version argument:
  ```
  dart bin/cli.dart version
  ```
5. Run your application with the help argument:
  ```
  dart bin/cli.dart help
  ```
6.  Run your application with the search command:
  ```
  dart bin/cli.dart search (with or without arguments)
  ```
7. **Note**: `dart:io` is a core library in the Dart SDK that provides APIs for `input and output (I/O) operations`. It allows a Dart program to interact with the operating system and system resources. Main Uses of dart:io are: 
- `File Handling`: Create, read, write, and delete files.
- `Directory Operations`: Create, delete, and list directories.
- `HTTP Clients and Servers`: Send HTTP requests or create a server.
- `Process Management`: Run other system programs from Dart.
- `Standard Input/Output`: Read input from the console and print output.

8. `stdin.readLineSync() ?? ''` reads the input from the user. While `stdin.readLineSync()` can return `null`, the **null-coalescing operator (??)** is used to provide an `empty string ('')` as a fallback if the input is `null`. *This is a concise way to ensure that the variable is a non-null string.*

9. `arguments.join(' ')` concatenates all elements of the arguments list into a single string, using `a space as the separator`. For example, ['Dart', 'Programming'] becomes "Dart Programming". This is crucial for treating multi-word command-line inputs as a single search phrase.