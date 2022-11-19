class RelativePathReceiver {
  String toRelative(String path) {
    final lastFolderIndex = path.lastIndexOf('/');

    if (lastFolderIndex == -1) {
      return path;
    }

    String relativePath = path.substring(lastFolderIndex + 1);
    relativePath = relativePath.replaceAll(")", "");
    relativePath = relativePath.replaceAll("(", "");
    
    return relativePath;
  }
}
