import 'package:flutter/material.dart';
import 'package:self_host_group_chat_app/features/domain/entities/single_chat_entity.dart';
import 'package:self_host_group_chat_app/features/presentation/pages/create_group_page.dart';
import 'package:self_host_group_chat_app/features/presentation/pages/single_chat_page.dart';
import 'package:self_host_group_chat_app/page_const.dart';
import 'features/presentation/pages/forgot_page.dart';
import 'features/presentation/pages/login_page.dart';
import 'features/presentation/pages/registration_page.dart';



class OnGenerateRoute {
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;


    switch (settings.name) {
      case PageConst.createGroupPage:
        {
          if (args is String){
            return materialBuilder(
              widget: CreateGroupPage(uid: args,),
            );
          }else{
            return materialBuilder(
              widget: ErrorPage(),
            );
          }
          break;
        }
        case PageConst.singleChatPage:
        {
          if (args is SingleChatEntity){
            return materialBuilder(
              widget: SingleChatPage(singleChatEntity: args,),
            );
          }else{
            return materialBuilder(
              widget: ErrorPage(),
            );
          }
          break;
        }
        case PageConst.loginPage:
        {
          return materialBuilder(
            widget: LoginPage(),
          );
          break;
        }
      case PageConst.forgotPage:
        {
          return materialBuilder(
            widget: ForgetPassPage(),
          );
          break;
        }
      case PageConst.loginPage:
        {
          return materialBuilder(
            widget: LoginPage(),
          );
          break;
        }
        case PageConst.registrationPage:
        {
          return materialBuilder(
            widget: RegistrationPage(),
          );
          break;
        }      case PageConst.phoneRegistrationPage:
      default:
        return materialBuilder(
          widget: ErrorPage(),
        );
    }
  }
}

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("error"),
      ),
      body: Center(
        child: Text("error"),
      ),
    );
  }
}

MaterialPageRoute materialBuilder({required Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget);
}
