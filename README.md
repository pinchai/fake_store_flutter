##Route to another screen with parameter in Flutter
```
Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => CartScreen(user_id: 1)));
```

##Fetch data from API in Flutter
```
import 'dart:convert';
import 'package:http/http.dart' as http;
    @override
    void initState() {
        super.initState();
        // Load data once
        _myFuture = _getProduct();
    }

Future<List> _getProduct() async {
    var url = Uri.parse("https://fakestoreapi.com/products");
    // var url = Uri.parse("http://192.168.8.254:5050/products");
    var respone = await http.get(url);
    print(respone);
    final data = jsonDecode(respone.body);
    return data;
}
```

##Pass data from one screen to another in Flutter
````
    FutureBuilder<String>(
        future: fetchData(),
        builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
            } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
                return Text('Result: ${snapshot.data}');
            } else {
                return Text('No data found');
            }
        },
    );
````