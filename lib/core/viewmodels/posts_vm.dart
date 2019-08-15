import 'package:flutter/foundation.dart';
import 'package:provider_arc/core/models/post.dart';
import 'package:provider_arc/core/services/api.dart';
import 'package:provider_arc/core/viewmodels/base_vm.dart';
import 'package:provider_arc/core/viewmodels/iposts.dart';

class PostsVM extends ChangeNotifier with BaseVM implements IPosts {
  final Api api;
  PostsVM({@required this.api});
  @override
  List<Post> posts;
  @override
  Future<List<Post>> queryPostsAsync(int userId) async {
    try {
      startWaiting();
      posts = await api.getPostsForUser(userId);
      return posts;
    } finally{ stopWaiting();}
  }
}