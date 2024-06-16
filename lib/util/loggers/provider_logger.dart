// ignore_for_file: always_put_control_body_on_new_line

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ouchi_stocker/util/extensions/string_ex.dart';
import 'package:ouchi_stocker/util/functions/debug_log.dart';

/// A [ProviderObserver] that logs all provider changes.
class ProviderLogger extends ProviderObserver {
  /// Whether to disable logging.
  static bool disabled = false;

  /// Whether to log only named providers.
  static bool namedOnly = true;

  /// The maximum length of the state to log.
  static int maxStateLength = 50;

  /// The list of provider names to log.
  /// If empty, all providers are logged.
  static List<String> onlyMatched = [];

  /// Returns a string representation of the value.
  static String? _limitedValueString(Object? value) {
    return value?.toString().ellipsis(maxStateLength);
  }

  /// Logs the initialization of a provider.
  static void logInit(String providerName, Object? value) {
    if (disabled) return;
    if (onlyMatched.isNotEmpty && !onlyMatched.contains(providerName)) return;
    debugLog(
      '[Provider Init] $providerName '
      '{value: ${_limitedValueString(value)}}',
    );
  }

  /// Logs the update of a provider.
  static void logUpdate(
    String providerName,
    Object? previousValue,
    Object? newValue,
  ) {
    if (disabled) return;
    if (onlyMatched.isNotEmpty && !onlyMatched.contains(providerName)) return;
    debugLog(
      '[Provider Update] $providerName '
      '{prev: ${_limitedValueString(previousValue)}, '
      'new: ${_limitedValueString(newValue)}}',
    );
  }

  /// Logs the disposal of a provider.
  static void logDispose(String providerName) {
    if (disabled) return;
    if (onlyMatched.isNotEmpty && !onlyMatched.contains(providerName)) return;
    debugLog('[Provider Dispose] $providerName');
  }

  /// Logs the initialization of a provider.
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    final name = provider.name;
    if (namedOnly && name == null) return;
    logInit('${name ?? provider.runtimeType}', value);
  }

  /// Logs the update of a provider.
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    final name = provider.name;
    if (namedOnly && provider.name == null) return;
    logUpdate('${name ?? provider.runtimeType}', previousValue, newValue);
  }

  /// Logs the disposal of a provider.
  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    final name = provider.name;
    if (namedOnly && name == null) return;
    logDispose('${name ?? provider.runtimeType}');
  }
}
