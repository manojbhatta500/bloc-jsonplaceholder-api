import 'package:apibloc/bloc/post_bloc.dart';
import 'package:apibloc/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    BlocProvider.of<PostBloc>(context).add(FetchPostEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Screen'),
        centerTitle: true,
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          switch (state.status) {
            case Status.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case Status.faliure:
              return Center(
                child: Text(state.message.toString()),
              );

            case Status.success:
              return ListView.builder(
                  itemCount: state.postmodellist.length,
                  itemBuilder: (context, index) {
                    final item = state.postmodellist[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Card(
                        child: ListTile(
                          title: Text(item.email.toString()),
                          subtitle: Text(
                            item.body.toString(),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    );
                  });
          }
        },
      ),
    );
  }
}
