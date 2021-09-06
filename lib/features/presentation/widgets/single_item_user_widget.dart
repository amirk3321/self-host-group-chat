import 'package:flutter/material.dart';
import 'package:self_host_group_chat_app/features/domain/entities/user_entity.dart';
import 'package:self_host_group_chat_app/features/presentation/widgets/profile_widget.dart';

class SingleItemStoriesStatusWidget extends StatelessWidget {
  final UserEntity user;

  const SingleItemStoriesStatusWidget({Key? key, required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10,right: 10,left: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      child: profileWidget(imageUrl: user.profileUrl),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${user.name}",
                          style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          user.status==null|| user.status==""?"Hi! I'm using this app":"${user.status}",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60,right: 10),
            child: Divider(thickness: 1.50,),
          ),
        ],
      ),
    );
  }}