class AppMetaData {
  final String label;
  final List<int> imageBytes;
  final String packageName;
  AppMetaData({this.label, this.imageBytes, this.packageName});
  @override
  String toString() {
    return '${this.label}: ${this.packageName}';
  }
}

List<AppMetaData> installedApps;