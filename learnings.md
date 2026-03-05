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