

import 'package:facebook_clone_flutter/config/posts/posts_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postProvider = Provider((ref) {
  return PostService();
});