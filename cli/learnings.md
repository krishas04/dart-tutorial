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

10. **What is an API?**
  An **API (Application Programming Interface)** is a set of rules and `protocols` that allows `different software programs` to `communicate and exchange data` with each other.

  **History of APIs**
  1. `Phase 1: Commercial APIs (Early 2000s)`
  In the early 2000s, companies began creating web APIs so other businesses and developers could interact with their platforms.

  2. `Phase 2: Social Media APIs (Mid-2000s)`
  During the mid-2000s, social media companies realized APIs could help people share information and connect more easily.

  3. `Phase 3: Cloud APIs (Around 2006)`
  A major shift happened when cloud computing services started using APIs.

  4. `Phase 4: APIs for Mobile Applications (Around 2007)`
  In 2007, smartphones became popular after the launch of:
  - Apple iPhone
  - Google Android
  This created a huge demand for mobile applications, which rely heavily on APIs.

  5. `Phase 5: APIs for Connected Devices (Around 2010)`
  Around 2010, APIs started powering connected devices in the Internet of Things (IoT).

  **How APIs Work**
  APIs work through a **request–response cycle** where one application asks for data and another application provides it.
  It includes following components:
  1. API Client
  2. API Request[Endpoint, Method, Parameters, Request Headers, Request Body]
  3. API Server
  4. API Response[Status Code, Response Headers, Response Body]

  **Different Types of APIs**
  APIs can be categorized based on who has access to them. The main types are:

  1. `Private APIs (Internal APIs)`
  - Used within a single organization.
  - Not available to external developers or the public.
  - Help different parts of an application communicate with each other. 
  - These APIs work internally inside the system.

  Example:A social media app may have: A login API, A feed API

  2. `Public APIs (Open APIs)`
  - Available to external developers and the public.
  - Allow third-party applications to access services or data.
  - Some are free, while others require payment or subscription.

  Example:
  An e-commerce website using a payment API like Stripe to process payments instead of building its own payment system.

  3. `Partner APIs`
  - Shared between specific business partners.
  - Not available to the general public.
  - Require authentication and authorization.

  Example:
  Two companies sharing data through an API to collaborate on a service or project.

  **Most Common API Architectural Styles**
  1. `REST`: An API style that uses HTTP methods (GET, POST, PUT, DELETE) to access and manipulate resources through endpoints.

  2. `SOAP`: A protocol that uses XML messages to exchange structured information between client and server.

  3. `GraphQL`: A query language that allows clients to request exactly the data they need from a single API endpoint.

  4. `Webhooks`: A system where an application automatically sends data to another system when a specific event occurs.

  5. `gRPC`: A high-performance API architecture by Google that allows clients to call remote server functions like local methods.

11. **Note**: `pubspec.yaml` file manages your Dart project's `metadata`, `dependencies` (like the http package), and `assets`.

  The ^ symbol allows compatible versions to be used.
  
  Run `dart pub get` which fetches the newly added `dependency` and makes it available for use in your project.

12. **Asynchronous Programming in Dart**
`Event loop`: Continuously checks for tasks and executes callbacks, keeping the program responsive.

**Programming Types**
- `Synchronous programming`: Executes statements one by one, blocking until each completes.
- `Asynchronous programming`: Executes statements without waiting, allowing other tasks to run while operations complete.

**Asynchronous Programming Concepts**
- `Future`: Represents a single value or error available later.
- `async + await`: async marks a function as asynchronous, and await pauses only that function until a Future completes.
- `Stream`: Provides multiple asynchronous values over time, often consumed with await for.

13. **Organizing Dart Code with Packages and Libraries**
  `Dart Packages`
    A package is the main unit for sharing and organizing Dart code.
    It contains libraries, assets, dependencies, and configuration.

    `Package Structure`
    my_project/
    │
    ├── pubspec.yaml
    ├── README.md
    │
    ├── lib/
    │   └── my_project.dart
    │
    ├── bin/
    │   └── main.dart
    │
    ├── test/
    │
    └── example/

    `Important Directories and their purpose`
    `lib/`	= Main code of the package
    `bin/`	= Entry point for CLI applications
    `test/`	= Unit tests
    `example/`	= Example usage of the package

  `Libraries in Dart`
    A library is a reusable collection of Dart code. A Dart file becomes a library automatically.
    Example:
    ```library my_library;```
    However, this declaration is optional.

    `Exporting Libraries`
    Packages often export internal files to provide a clean public API.
    Example:

    lib/
    │
    ├── command_runner.dart
    └── src/
        └── command_runner_base.dart

    `Public API:`
    ```export 'src/command_runner_base.dart';```

    This means other packages can simply write:
    ```import 'package:command_runner/command_runner.dart';```
    without accessing internal files directly.

  `The src Directory Convention`
    Inside `lib/`, Dart packages often contain a `src/` folder.
    - src/ contains **internal implementation**
    - Files in src/ are not meant to be imported directly

    Instead they are exposed through export.
    Example: ```export 'src/command_runner_base.dart';```
    This keeps the *public API stable*.

  `Using Multiple Packages in a Project`
    Large projects often contain multiple packages.
    Example:
    dartpedia/
    │
    ├── cli/
    │   └── bin/cli.dart
    │
    └── command_runner/
        └── lib/command_runner.dart

    Here:
    cli = application package
    command_runner = reusable package
    The CLI depends on the command runner.

**Define relationships with classes**

  **Argument Hierarchy**
  - `OptionType`: flag or option
  - `Argument (abstract)`: Base class for Option & Command
  - `Option`: Represents CLI flags/options, supports short & long forms
  - `Command (abstract)`: Defines executable actions, own options, run() logic
  - `ArgResults`: Stores parsed commands & options, provides helpers (flag(), hasOption(), getOption())

  **CommandRunner**
  - Registers & runs commands
  - Parses CLI input → executes selected command
  - Provides usage info for app

  **HelpCommand**
  - Prints usage info
  - Uses addFlag & addOption
  - Accesses runner.commands for all commands

## Handle Errors Gracefully
  1. Errors vs Exceptions
    **Error**
    - Represents `serious problems` in the program.
    - Usually caused by programming mistakes.
    - Should generally `not be caught`.

    **Exception**
    - Represents `expected problems` that can occur during program `execution`.
    - These can be handled using `try/catch`.

  2. Creating Custom Exceptions
  - A custom `ArgumentException` class was created.
  -  Fields included:
    * `message` = Description of the error
    * `command` =	Command being executed when the error occurred
    * `argumentName` =	Argument that caused the error

  3. Using try/catch for Error Handling
    - The try/catch block allows the program to handle runtime failures safely.
    - The throw keyword is used to manually trigger an exception when an error condition occurs.
    - rethrow passes the caught exception up the call stack while preserving the original stack trace.

  4. Error Handling Callback (onError)
    - The CommandRunner now supports a custom error handling callback ie.`onError`. This allows users of the package to define their own error handling logic.

  5. Input Validation in parse()
    - The parse() method was updated to detect invalid CLI inputs.
      * `Unknown command`	= First input must be a registered command
      * `Multiple commands`	= Only one command allowed
      * `Unknown option` = Option must exist for the command
      * `Missing option` = argument	Option must have a value
      * `Too many positional arguments`	= Only one command argument allowed

  6. Exporting the Exception
    - To make the new exception available to other packages, it was exported in `command_runner/lib/command_runner.dart`.