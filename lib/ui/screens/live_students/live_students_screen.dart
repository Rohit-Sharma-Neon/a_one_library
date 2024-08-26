import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:learning_project/ui/base_components/animated_list_builder.dart';
import 'package:learning_project/ui/base_components/base_app_bar.dart';

class LiveStudentsScreen extends StatefulWidget {
  const LiveStudentsScreen({super.key});

  @override
  State<LiveStudentsScreen> createState() => _LiveStudentsScreenState();
}

class _LiveStudentsScreenState extends State<LiveStudentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: "Live Students"),
      body: AnimationLimiter(
        child: ListView.builder(
          itemCount: 20, 
          itemBuilder: (context, index){
            return AnimatedListBuilder(
              index: index,
              child: Container(),
            );
          },
        ),
      ),
    );
  }
}
