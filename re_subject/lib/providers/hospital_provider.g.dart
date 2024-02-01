// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchHospitalsHash() => r'6966e450989742e533f03b7ef3bfc7c5e73c2c4c';

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

/// See also [fetchHospitals].
@ProviderFor(fetchHospitals)
const fetchHospitalsProvider = FetchHospitalsFamily();

/// See also [fetchHospitals].
class FetchHospitalsFamily extends Family<AsyncValue<List<HospitalModel>>> {
  /// See also [fetchHospitals].
  const FetchHospitalsFamily();

  /// See also [fetchHospitals].
  FetchHospitalsProvider call({
    required double lat,
    required double lng,
    required String distance,
  }) {
    return FetchHospitalsProvider(
      lat: lat,
      lng: lng,
      distance: distance,
    );
  }

  @override
  FetchHospitalsProvider getProviderOverride(
    covariant FetchHospitalsProvider provider,
  ) {
    return call(
      lat: provider.lat,
      lng: provider.lng,
      distance: provider.distance,
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
  String? get name => r'fetchHospitalsProvider';
}

/// See also [fetchHospitals].
class FetchHospitalsProvider
    extends AutoDisposeFutureProvider<List<HospitalModel>> {
  /// See also [fetchHospitals].
  FetchHospitalsProvider({
    required double lat,
    required double lng,
    required String distance,
  }) : this._internal(
          (ref) => fetchHospitals(
            ref as FetchHospitalsRef,
            lat: lat,
            lng: lng,
            distance: distance,
          ),
          from: fetchHospitalsProvider,
          name: r'fetchHospitalsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchHospitalsHash,
          dependencies: FetchHospitalsFamily._dependencies,
          allTransitiveDependencies:
              FetchHospitalsFamily._allTransitiveDependencies,
          lat: lat,
          lng: lng,
          distance: distance,
        );

  FetchHospitalsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.lat,
    required this.lng,
    required this.distance,
  }) : super.internal();

  final double lat;
  final double lng;
  final String distance;

  @override
  Override overrideWith(
    FutureOr<List<HospitalModel>> Function(FetchHospitalsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchHospitalsProvider._internal(
        (ref) => create(ref as FetchHospitalsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        lat: lat,
        lng: lng,
        distance: distance,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<HospitalModel>> createElement() {
    return _FetchHospitalsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchHospitalsProvider &&
        other.lat == lat &&
        other.lng == lng &&
        other.distance == distance;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, lat.hashCode);
    hash = _SystemHash.combine(hash, lng.hashCode);
    hash = _SystemHash.combine(hash, distance.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchHospitalsRef on AutoDisposeFutureProviderRef<List<HospitalModel>> {
  /// The parameter `lat` of this provider.
  double get lat;

  /// The parameter `lng` of this provider.
  double get lng;

  /// The parameter `distance` of this provider.
  String get distance;
}

class _FetchHospitalsProviderElement
    extends AutoDisposeFutureProviderElement<List<HospitalModel>>
    with FetchHospitalsRef {
  _FetchHospitalsProviderElement(super.provider);

  @override
  double get lat => (origin as FetchHospitalsProvider).lat;
  @override
  double get lng => (origin as FetchHospitalsProvider).lng;
  @override
  String get distance => (origin as FetchHospitalsProvider).distance;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
