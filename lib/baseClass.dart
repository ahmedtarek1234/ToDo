import 'package:flutter/material.dart';

abstract class BaseConncetor {
  showLoading();

  hideLoading();

  showMessage(String message);
}

class BaseViewModel<T extends BaseConncetor> extends ChangeNotifier {
  T? connector;
}

abstract class BaseView<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> implements BaseConncetor {
  late VM viewModel;

  VM initMyViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = initMyViewModel();
  }

  @override
  hideLoading() {
    Navigator.pop(context);
  }

  @override
  showLoading() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
        title: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  @override
  showMessage(String message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Okay"),
            ),
          ],
        );
      },
    );
  }
}
