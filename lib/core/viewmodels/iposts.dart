import 'package:flutter/foundation.dart';
import 'package:provider_arc/core/models/post.dart';
import 'package:provider_arc/core/viewmodels/ibase.dart';
/// The VM interfaces have to extend ChangeNotifier, since they are required
/// for ChangeNotifier Providers. 
abstract class IPosts extends ChangeNotifier with IBase{
  List<Post> posts;
  Future<List<Post>> queryPostsAsync(int userId);
}