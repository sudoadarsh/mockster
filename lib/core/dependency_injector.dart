class DependencyInjector {
  /// Singleton pattern.
  static final DependencyInjector _instance = DependencyInjector._();

  factory DependencyInjector() => _instance;

  DependencyInjector._();

  /// To store the registered lazy objects.
  final Map<Type, dynamic Function()> lazyObjects = {};

  /// Register lazy object. The instance will only be created when accessed.
  void registerLazy<T>(T Function() constructor) {
    lazyObjects[T] = constructor;
  }

  /// Access lazy object.
  T accessLazy<T>() {
    final T? instance = lazyObjects[T]?.call();
    if (instance == null) throw "Please register $T before accessing it.";
    return instance;
  }
}
