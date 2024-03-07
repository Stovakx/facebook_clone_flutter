import 'package:facebook_clone_flutter/widgets/posts/make_post.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatelessWidget {
const PostsScreen({ super.key });

  @override
  Widget build(BuildContext context){
    return CustomScrollView(
      slivers: [
        MakePost(),
        
      ],
    );
  }
}