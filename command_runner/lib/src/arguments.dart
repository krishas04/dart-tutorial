import 'dart:async';
import 'dart:collection';
import '../command_runner.dart';

//creating a type-safe enum
enum OptionType { flag, option }

// create a abstract class as parent class for both Command and Option.
abstract class Argument {
  String get name;
  String? get help;
  Object? get defaultValue;
  String? get valueHelp;
  String? get usage;
}

//
class Option extends Argument {
  Option(
    this.name, {
    required this.type,
    this.help,
    this.abbr,
    this.defaultValue,
    this.valueHelp,
  });

  @override
  final String name;

  @override
  final String? help;

  @override
  final Object? defaultValue;

  @override
  final String? valueHelp;

  final OptionType type;

  final String? abbr;

  // To automatically generate help text.
  @override
  String? get usage {
    if (abbr != null) {
      return '-$abbr,--$name: $help';
    }
    return '--$name: $help';
  }
}

abstract class Command extends Argument {
  @override
  String get name;

  String get description;

  bool get requiresArgument => false;

  // Giving commands a reference to the runner allows them to see or interact with global settings, other commands, and shared resources.
  late CommandRunner runner;

  @override
  String? help;

  @override
  String? defaultValue;

  @override
  String? valueHelp;

  // Each command can have its own options.
  final List<Option> _options = [];

  // We don’t want external code to modify _options directly. As, _options should only be modified via the class methods.
  UnmodifiableSetView<Option> get options =>
      UnmodifiableSetView(_options.toSet());

  void addFlag(String name, {String? help, String? abbr, String? valueHelp}) {
    _options.add(
      Option(
        name,
        help: help,
        abbr: abbr,
        valueHelp: valueHelp,
        type: OptionType.flag,
      ),
    );
  }

  void addOption(String name, {String? help, String? abbr, String? valueHelp}) {
    _options.add(
      Option(
        name,
        help: help,
        abbr: abbr,
        valueHelp: valueHelp,
        type: OptionType.option,
      ),
    );
  }

  FutureOr<Object?> run(ArgResults args);

  @override
  String get usage {
    return '$name:  $description';
  }
}

class ArgResults {
  Command? command;
  String? commandArg;
  Map<Option, Object?> options = {};

  bool flag(String name) {
    for (var option in options.keys.where(
      (option) => option.type == OptionType.flag,
    )) {
      if (option.name == name) {
        return options[option] as bool;
      }
    }
    return false;
  }

  bool hasOption(String name) {
    return options.keys.any((option) => option.name == name);
  }

  ({Option option, Object? input}) getOption(String name) {
    var mapEntry = options.entries.firstWhere(
      (entry) => entry.key.name == name || entry.key.abbr == name,
    );
    return (option: mapEntry.key, input: mapEntry.value);
  }
}
