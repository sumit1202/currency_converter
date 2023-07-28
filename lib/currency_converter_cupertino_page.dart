import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinioPage extends StatefulWidget {
  const CurrencyConverterCupertinioPage({super.key});

  @override
  State<CurrencyConverterCupertinioPage> createState() =>
      _CurrencyConverterCupertinioPageState();
}

class _CurrencyConverterCupertinioPageState
    extends State<CurrencyConverterCupertinioPage> {
  var result = 0.0;
  var inputController = TextEditingController();

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.black,
        middle: Text('Currency Converter'),
      ),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              CupertinoColors.systemMint,
              CupertinoColors.systemTeal,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Rs ${result.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CupertinoTextField(
                  controller: inputController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  placeholder: 'Amount (in USD)',
                  prefix: const Icon(
                    CupertinoIcons.money_dollar,
                    color: CupertinoColors.black,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: CupertinoColors.black,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: CupertinoButton(
                  color: CupertinoColors.black,
                  onPressed: () {
                    var inputInDouble = double.parse((inputController.text));
                    setState(() {
                      result = inputInDouble * 82.29;
                    });
                  },
                  child: const Text('Convert (in INR)'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
