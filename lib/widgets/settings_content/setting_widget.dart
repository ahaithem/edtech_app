import 'package:flutter/material.dart';
import '../../constns/color_text_size.dart';
import 'notification_setting.dart';
import 'information_setting.dart';

class SettingWidget extends StatefulWidget {
  const SettingWidget({super.key});

  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/7.png'),
              SizedBox(height: 20),
              const NotificationSetting(),
              SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width *
                    0.8, // Align width with NotificationSetting
                child: Text(
                  'Account information',
                  style: TextStyle(
                    color: text_color,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(height: 20),
              const InformationSetting(
                  informationType: 'Name',
                  iconType: Icon(Icons.person),
                  informationValue: 'John Smith'),
              SizedBox(height: 20),
              const InformationSetting(
                  informationType: 'Email',
                  iconType: Icon(Icons.email),
                  informationValue: 'WY4nX@example.com'),
              SizedBox(height: 20),
              const InformationSetting(
                  informationType: 'Password',
                  iconType: Icon(Icons.password),
                  informationValue: 'changed 2 weeks ago'),
            ],
          ),
        ),
      ),
    );
  }
}
