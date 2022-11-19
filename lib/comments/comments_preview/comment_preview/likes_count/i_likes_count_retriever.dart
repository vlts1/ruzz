abstract class ILikesCountRetriever {
  Future<void> init();
  int likesCount();
  bool get isSelected;
  void switchSelection();
}
