class UpdateInfo {
  UpdateInfo(
    this.technology,
    this.version,
  );
  final String technology;
  final String version;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UpdateInfo &&
      other.technology == technology &&
      other.version == version;
  }

  @override
  int get hashCode => technology.hashCode ^ version.hashCode;
}
