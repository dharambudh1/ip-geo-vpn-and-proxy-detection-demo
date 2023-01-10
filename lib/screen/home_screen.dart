import "dart:async";
import "dart:io";

import "package:after_layout/after_layout.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_json_view/flutter_json_view.dart";
import "package:ipify_demo/model/vpn_api_success_response.dart";
import "package:ipify_demo/singleton/dio_singleton.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomeScreen>
    with AfterLayoutMixin<HomeScreen> {
  VPNAPISuccessResponse _vpnAPISuccessResponse = VPNAPISuccessResponse();
  String _errorMessage = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("IP, Geo, VPN & Proxy Detection"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _errorMessage = "";
          _vpnAPISuccessResponse = VPNAPISuccessResponse();
          setState(() {});
          await makeExtractInformationFromIPAPIRequest();
        },
        child: const Icon(Icons.refresh),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: _errorMessage.isEmpty && _vpnAPISuccessResponse.ip == null
                ? Column(
                    children: <Widget>[
                      const Spacer(),
                      if (Platform.isIOS)
                        const CupertinoActivityIndicator()
                      else
                        const CircularProgressIndicator(),
                      const Spacer(),
                    ],
                  )
                : _errorMessage.isNotEmpty && _vpnAPISuccessResponse.ip == null
                    ? Text(_errorMessage)
                    : JsonView.map(
                        _vpnAPISuccessResponse.toJson(),
                        theme: JsonViewTheme(
                          defaultTextStyle:
                              Theme.of(context).textTheme.labelSmall!,
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          viewType: JsonViewType.base,
                        ),
                      ),
          ),
        ),
      ),
    );
  }

  Future<void> makeExtractInformationFromIPAPIRequest() async {
    _vpnAPISuccessResponse = await DioSingleton().extractInformationFromIPAPI(
      errorMessageFunction: (String value) {
        _errorMessage = value;
      },
    );
    setState(() {});
    return Future<void>.value();
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    await makeExtractInformationFromIPAPIRequest();
    return Future<void>.value();
  }
}
