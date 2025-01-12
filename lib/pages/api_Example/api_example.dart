import 'package:demo2/pages/api_Example/cubit/post_cubit.dart';
import 'package:demo2/pages/api_Example/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiExample1 extends StatefulWidget {
  const ApiExample1({super.key});

  @override
  State<ApiExample1> createState() => _ApiExampleState();
}

class _ApiExampleState extends State<ApiExample1> {
  final _namecontroller = TextEditingController();
  final _detailscontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    _namecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _namecontroller,
                      validator: (value) {
                        if (value == null || value == "") {
                          return "Value is required";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter Your Name",
                        // hintStyle: TextStyle()

                        label: Text("Full Name"),
                        // labelStyle: TextStyle()

                        fillColor: Colors.blue[50],
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _detailscontroller,
                      validator: (value) {
                        if (value == null || value == "") {
                          return "Value is required";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter Post Details",
                        // hintStyle: TextStyle()

                        label: Text("Post Details"),
                        // labelStyle: TextStyle()

                        fillColor: Colors.blue[50],
                        filled: true,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<PostCubit>().postPost(PostModel(
                        name: _namecontroller.text,
                        description: _detailscontroller.text));
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Post Added")));
                  }
                },
                child: Text("Save Data")),
            SizedBox(height: 20),
            BlocBuilder<PostCubit, PostState>(
              builder: (context, state) {
                if (state is PostInitial) {
                  context.read<PostCubit>().getPost();
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is PostError) {
                  return Center(child: Text(state.message));
                } else if (state is PostLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is PostLoaded) {
                  return ListView.builder(
                    itemCount: state.posts.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: const Color.fromARGB(255, 239, 250, 255),
                        child: Column(
                          children: [
                            Text("Name: ${state.posts[index].name}"),
                            Text("Post: ${state.posts[index].name}"),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }
}
