import 'package:bloc_api/application/show_user/show_user_bloc.dart';
import 'package:bloc_api/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //
  //TextEditing Controllers
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _userNameEditingController =
      TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();

//TextFeild HintStyle
  final TextStyle _textFieldHintStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: Colors.black54,
  );

  final TextStyle _lableStyle = const TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w800,
    color: Colors.blue,
  );

  final TextStyle _buttonTextStyle = const TextStyle(
    color: Colors.blue,
    fontWeight: FontWeight.w500,
    fontSize: 20,
  );
  final TextStyle _userNameTextStyle = const TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 20,
    color: Colors.blue,
  );

  final TextStyle _emailTextStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: Colors.blueAccent,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                //name
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.black,
                      width: 4,
                    ),
                  ),
                  child: TextField(
                    cursorColor: Colors.black,
                    controller: _nameEditingController,
                    decoration: InputDecoration(
                      label: Text(
                        'Name',
                        style: _lableStyle,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: 'Your name',
                      hintStyle: _textFieldHintStyle,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                //user name
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.black,
                      width: 4,
                    ),
                  ),
                  child: TextField(
                    cursorColor: Colors.black,
                    controller: _userNameEditingController,
                    decoration: InputDecoration(
                      label: Text(
                        'User Name',
                        style: _lableStyle,
                      ),
                      focusColor: Colors.green,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: 'Your UserName',
                      hintStyle: _textFieldHintStyle,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                //email
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.black,
                      width: 4,
                    ),
                  ),
                  child: TextField(
                    cursorColor: Colors.black,
                    controller: _emailEditingController,
                    decoration: InputDecoration(
                      label: Text(
                        'Email',
                        style: _lableStyle,
                      ),
                      focusColor: Colors.green,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: 'Your email',
                      hintStyle: _textFieldHintStyle,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 5,
                      color: Colors.black,
                    ),
                  ),
                  margin: const EdgeInsets.fromLTRB(10, 30, 10, 15),
                  child: SizedBox(
                    width: 400,
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        context.read<UsersListBloc>().add(
                              UsersListAddUser(
                                user: User(
                                  email: _emailEditingController.text,
                                  name: _nameEditingController.text,
                                  userName: _userNameEditingController.text,
                                ),
                              ),
                            );
                      },
                      child: Text(
                        'Press',
                        style: _buttonTextStyle,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          BlocBuilder<UsersListBloc, UsersListState>(
            builder: (context, state) {
              if (state is UsersListLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is UsersListLoaded) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.users.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.blue, width: 5),
                        ),
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          trailing: IconButton(
                            onPressed: () {
                              context.read<UsersListBloc>().add(
                                    UsersListRemoveUser(
                                      user: User(
                                        email: _emailEditingController.text,
                                        name: _nameEditingController.text,
                                        userName:
                                            _userNameEditingController.text,
                                      ),
                                    ),
                                  );
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.blue,
                            ),
                          ),
                          leading: const Icon(
                            Icons.person,
                            color: Colors.blue,
                          ),
                          title: Text(
                            state.users[index].userName,
                            style: _userNameTextStyle,
                          ),
                          subtitle: Text(
                            state.users[index].email,
                            style: _emailTextStyle,
                          ),
                        ),
                      );
                    },

                    // children: [
                    //   ListTile(
                    //     tileColor: Colors.blue,
                    //     subtitle: Text(
                    //       state.email.toString(),
                    //     ),
                    //     subtitleTextStyle: _emailTextStyle,
                    //     leading: const Icon(
                    //       Icons.person,
                    //       color: Colors.black,
                    //     ),
                    //     title: Text(
                    //       state.userName.toString(),
                    //       style: _userNameTextStyle,
                    //     ),
                    //   ),
                    // ].toList(),
                  ),
                );
              }
              return const Text("No Users Avalable");
            },
          ),
        ],
      ),
    );
  }
}
