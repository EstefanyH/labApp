import 'package:applab/src/core/routing/routes.dart';
import 'package:applab/src/core/theme/app_text_styles.dart';
import 'package:applab/src/shared/app_background.dart';
import 'package:applab/src/shared/card_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AccountPage extends ConsumerWidget{
  const AccountPage({super.key});
   
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi cuenta'),
      ),
      body: AppBackground(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    AccountCard()],
                ),
              ),
              
              InkWell(
                child: Column(
                  children: [
                    Text('Cerrar Session', style: AppTextStyles.body1Text,),
                    SizedBox(height: 40,)
                  ],
                ),
                onTap: () => context.push(AppRouter.login),
              )
              
            ],
          ),)
      ), 
    );
  }
}