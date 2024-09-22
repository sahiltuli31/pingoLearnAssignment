import 'package:pingo_learn_assignment/Models/comment.dart';
import 'package:pingo_learn_assignment/Network/network_manager.dart';
import 'package:flutter/material.dart';

class CommentsProvider extends ChangeNotifier {
  NetworkManager networkManager = NetworkManager();
  bool loading = true;
  List<Comment> comments = [];
  Future<void> getComments() async {
    loading = true;
    comments = await networkManager.getComments() ?? [];
    loading = false;
    notifyListeners();
  }
}
