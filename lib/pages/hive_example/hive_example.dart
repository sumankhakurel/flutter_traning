import 'package:demo2/pages/hive_example/cubit/product_cubit.dart';
import 'package:demo2/pages/hive_example/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HiveExample extends StatefulWidget {
  const HiveExample({super.key});

  @override
  State<HiveExample> createState() => _HiveExampleState();
}

class _HiveExampleState extends State<HiveExample> {
  final _namecontroller = TextEditingController();
  final _descriptioncontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  dynamic editingId;

  @override
  void dispose() {
    super.dispose();
    _namecontroller.dispose();
    _descriptioncontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    autovalidateMode: AutovalidateMode.disabled,
                    controller: _namecontroller,
                    validator: (value) {
                      if (value == null || value == "") {
                        return "Value is required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter Product name",
                      label: Text("Product Name"),
                      fillColor: Colors.blue[50],
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.disabled,
                    controller: _descriptioncontroller,
                    validator: (value) {
                      if (value == null || value == "") {
                        return "Value is required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter Product Description",
                      label: Text("Product Description"),
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
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (editingId == null) {
                      context.read<ProductCubit>().addProduct(ProductModel(
                            description: _descriptioncontroller.text,
                            name: _namecontroller.text,
                          ));
                      _descriptioncontroller.clear();
                      _namecontroller.clear();
                    } else {
                      context.read<ProductCubit>().updateProduct(
                          editingId,
                          ProductModel(
                            description: _descriptioncontroller.text,
                            name: _namecontroller.text,
                          ));
                      _descriptioncontroller.clear();
                      _namecontroller.clear();
                      setState(() {
                        editingId = null;
                      });
                    }
                  }
                },
                child: Text("Update Product List")),
            SizedBox(height: 20),
            BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is ProductLoaded) {
                  return ListView.builder(
                    itemCount: state.product.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          _namecontroller.text = state.product[index].name;
                          _descriptioncontroller.text =
                              state.product[index].description;

                          setState(() {
                            editingId = state.productKeys[index];
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          alignment: Alignment.centerLeft,
                          height: 60,
                          width: double.infinity,
                          color: Colors.blue,
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Name: ${state.product[index].name}",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    "Description: ${state.product[index].description}",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () => context
                                      .read<ProductCubit>()
                                      .deleteProduct(state.productKeys[index]),
                                  icon: Icon(Icons.delete)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
