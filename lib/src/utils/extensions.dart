extension GeneralExtension<T> on T {
  bool isNullOrEmpty() => this == null
      ? true
      : false || (this is String)
          ? this == ""
          : false || (this is Map)
              ? (this as Map).isEmpty
              : false || (this is List)
                  ? (this as List).isEmpty || this == null
                  : false;
}
