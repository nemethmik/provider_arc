
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_arc/core/constants/app_contstants.dart';
import 'package:provider_arc/core/models/user.dart';
import 'package:provider_arc/core/services/api.dart';
import 'package:provider_arc/core/viewmodels/iposts.dart';
import 'package:provider_arc/core/viewmodels/posts_vm.dart';
import 'package:provider_arc/ui/widgets/postlist_item.dart';

class PostingList extends StatefulWidget {
  final BuildContext parentContext;
  const PostingList({Key key, @required this.parentContext}) : super(key: key);
  @override
  _PostingListState createState() => _PostingListState();
}
class _PostingListState extends State<PostingList> {
  IPosts postsVM;
  @override
  void initState() {
    super.initState();
    postsVM = PostsVM(api: Provider.of<Api>(this.widget.parentContext));
    int userId = Provider.of<User>(context,listen: false).id;
    //IPosts postsVM = Provider.of<IPosts>(context,listen: false);
    postsVM.queryPostsAsync(userId);    
  }
  @override
  Widget build(BuildContext context) {
    return postsVM.isWaiting 
      ? CircularProgressIndicator() 
      : ListView.builder(
        itemCount: postsVM.posts.length,
        itemBuilder: (context,index) => PostListItem(post: postsVM.posts[index],
          onTap: (){
            Navigator.pushNamed(context, RoutePaths.Post);
          },),
      );
  }
}
