// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_subjects_id.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$questionsSubjectsIdRiverHash() =>
    r'922217c8ac455c3ff8d161466a3d7da439d90a63';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$QuestionsSubjectsIdRiver
    extends BuildlessAutoDisposeAsyncNotifier<List<Question>?> {
  late final String id;

  FutureOr<List<Question>?> build(
    String id,
  );
}

/// See also [QuestionsSubjectsIdRiver].
@ProviderFor(QuestionsSubjectsIdRiver)
const questionsSubjectsIdRiverProvider = QuestionsSubjectsIdRiverFamily();

/// See also [QuestionsSubjectsIdRiver].
class QuestionsSubjectsIdRiverFamily
    extends Family<AsyncValue<List<Question>?>> {
  /// See also [QuestionsSubjectsIdRiver].
  const QuestionsSubjectsIdRiverFamily();

  /// See also [QuestionsSubjectsIdRiver].
  QuestionsSubjectsIdRiverProvider call(
    String id,
  ) {
    return QuestionsSubjectsIdRiverProvider(
      id,
    );
  }

  @override
  QuestionsSubjectsIdRiverProvider getProviderOverride(
    covariant QuestionsSubjectsIdRiverProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'questionsSubjectsIdRiverProvider';
}

/// See also [QuestionsSubjectsIdRiver].
class QuestionsSubjectsIdRiverProvider
    extends AutoDisposeAsyncNotifierProviderImpl<QuestionsSubjectsIdRiver,
        List<Question>?> {
  /// See also [QuestionsSubjectsIdRiver].
  QuestionsSubjectsIdRiverProvider(
    String id,
  ) : this._internal(
          () => QuestionsSubjectsIdRiver()..id = id,
          from: questionsSubjectsIdRiverProvider,
          name: r'questionsSubjectsIdRiverProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$questionsSubjectsIdRiverHash,
          dependencies: QuestionsSubjectsIdRiverFamily._dependencies,
          allTransitiveDependencies:
              QuestionsSubjectsIdRiverFamily._allTransitiveDependencies,
          id: id,
        );

  QuestionsSubjectsIdRiverProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  FutureOr<List<Question>?> runNotifierBuild(
    covariant QuestionsSubjectsIdRiver notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(QuestionsSubjectsIdRiver Function() create) {
    return ProviderOverride(
      origin: this,
      override: QuestionsSubjectsIdRiverProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<QuestionsSubjectsIdRiver,
      List<Question>?> createElement() {
    return _QuestionsSubjectsIdRiverProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QuestionsSubjectsIdRiverProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin QuestionsSubjectsIdRiverRef
    on AutoDisposeAsyncNotifierProviderRef<List<Question>?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _QuestionsSubjectsIdRiverProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<QuestionsSubjectsIdRiver,
        List<Question>?> with QuestionsSubjectsIdRiverRef {
  _QuestionsSubjectsIdRiverProviderElement(super.provider);

  @override
  String get id => (origin as QuestionsSubjectsIdRiverProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
