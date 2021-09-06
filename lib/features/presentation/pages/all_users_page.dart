import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:self_host_group_chat_app/features/presentation/cubit/user/user_cubit.dart';
import 'package:self_host_group_chat_app/features/presentation/widgets/single_item_user_widget.dart';

class AllUsersPage extends StatefulWidget {
  final String uid;
  final String? query;

  const AllUsersPage({Key? key, required this.uid,this.query}) : super(key: key);

  @override
  _AllUsersPageState createState() => _AllUsersPageState();
}

class _AllUsersPageState extends State<AllUsersPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, userState) {
          if (userState is UserLoaded) {
            final users=userState.users.where((element) => element.uid !=widget.uid).toList();

            final filteredUsers = users.where((user) =>
            user.name.startsWith(widget.query!) ||
                user.name.startsWith(widget.query!.toLowerCase())
            ).toList();
            return Column(
              children: [
                Expanded(child: filteredUsers.isEmpty?
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(MaterialCommunityIcons.account_group,size: 40,color: Colors.black.withOpacity(.4),),
                      SizedBox(height: 10,),
                      Text("No Users Found yet",style: TextStyle(color: Colors.black.withOpacity(.2)),)
                    ],
                  ),
                ) :ListView.builder(
                  itemCount: filteredUsers.length,
                  itemBuilder: (_, index) {
                    return SingleItemStoriesStatusWidget(
                      user: filteredUsers[index],
                    );
                  },
                ))
              ],
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
