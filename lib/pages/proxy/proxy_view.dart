import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_getx_template/components/components.dart';
import 'package:flutter_getx_template/utils/utils.dart';

class ProxyPage extends StatelessWidget {
  ProxyPage({Key? key}) : super(key: key);

  final TextEditingController _controllerIP = TextEditingController();
  final TextEditingController _controllerPort = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(),
      title: "proxy settings",
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(15),
              child: TextField(
                decoration: const InputDecoration(hintText: 'Please enter IP'),
                controller: _controllerIP,
              ),
              height: 40,
              width: getDeviceWidth(context) - 80,
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: TextField(
                decoration: const InputDecoration(hintText: 'Please enter pasword'),
                controller: _controllerPort,
              ),
              height: 40,
              width: getDeviceWidth(context) - 80,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              width: getDeviceWidth(context) - 60,
              height: 50,
              child: TextButton(child: const Text('set proxy'), onPressed: () => setupProxy()),
            )
          ],
        ),
      ),
    );
  }

  // 设置代理
  void setupProxy() {
    String ip = _controllerIP.text.trim();
    String port = _controllerPort.text.trim();
    if (ip.isEmpty) {
      EasyLoading.showToast('IP cannot be empty');
      return;
    }
    if (port.isEmpty) {
      EasyLoading.showToast('Port cannot be empty');
      return;
    }
    Dio dio = Request().dio;
    // Packet capture and debugging are required in debug mode, so we use a proxy and disable HTTPS certificate verification
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      client.findProxy = (uri) {
        print('gone agent----$ip:$port');
        return "PROXY $ip:$port";
      };
      //The proxy tool will provide a self-signed certificate for capturing packets, which will fail the certificate verification, so we disable the certificate verification
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    };
    EasyLoading.showToast('Proxy setup succeeded');
  }
}
