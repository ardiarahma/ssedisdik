import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInputIncrementDecrement extends StatefulWidget {
  const NumberInputIncrementDecrement({super.key});

  @override
  State<NumberInputIncrementDecrement> createState() =>
      _NumberInputIncrementDecrementState();
}

class _NumberInputIncrementDecrementState
    extends State<NumberInputIncrementDecrement> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.text = "0";
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: size.width * 0.1,
          child: TextFormField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(8.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            controller: _controller,
            keyboardType: TextInputType.numberWithOptions(
              decimal: false,
              signed: true,
            ),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
        Container(
          height: size.height * 0.05,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.5,
                    ),
                  ),
                ),
                child: InkWell(
                  child: Icon(
                    Icons.arrow_drop_up,
                    size: 18.0,
                  ),
                  onTap: () {
                    int currentValue = int.parse(_controller.text);
                    setState(() {
                      currentValue++;
                      _controller.text =
                          (currentValue).toString(); // incrementing value
                    });
                  },
                ),
              ),
              InkWell(
                child: Icon(
                  Icons.arrow_drop_down,
                  size: 18.0,
                ),
                onTap: () {
                  int currentValue = int.parse(_controller.text);
                  setState(() {
                    print("Setting state");
                    currentValue--;
                    _controller.text = (currentValue > 0 ? currentValue : 0)
                        .toString(); // decrementing value
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
