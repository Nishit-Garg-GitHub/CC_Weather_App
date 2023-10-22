import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.blue,
      fontFamily: 'Roboto',
    ),
    home: WeatherHomePage(),
  ),
);

class WeatherHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ManageCitiesPage(),
              ),
            );
          },
        ),
        title: Center(
          child: Text('Weather App'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Implement menu functionality here
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://img.freepik.com/premium-vector/mountain-peaks-illustration-golden-glowing-lights-effects-graphic-concept-your-design_114588-1435.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 40),
              Text(
                'Vidyavihar',
                style: TextStyle(fontSize: 35.0, color: Colors.black),
              ),
              Text(
                '39°C',
                style: TextStyle(fontSize: 65.0, color: Colors.black),
              ),
              Text(
                'Haze',
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              ),
              Text(
                '🥽 AQI 165',
                style: TextStyle(fontSize: 15.0, color: Colors.black),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'More details >',
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      WeatherInfoRow('Today', 'Haze 40°/23°'),
                      WeatherInfoRow('Tomorrow', 'Haze 40°/23°'),
                      WeatherInfoRow('Sunday', 'Haze 40°/23°'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 60),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your 5-day forecast action here
                      },
                      child: Text("5-day forecast", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  WeatherDataRow('Now', '15:00', '16:00', '17:00'),
                  WeatherDataRow('39°', '39°', '40°', '39°'),
                  WeatherDataRow('☁', '☁', '☁', '☁'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherInfoRow extends StatelessWidget {
  final String day;
  final String forecast;

  WeatherInfoRow(this.day, this.forecast);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            day,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            forecast,
            style: TextStyle(fontSize: 18.0, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class WeatherDataRow extends StatelessWidget {
  final String time1;
  final String time2;
  final String time3;
  final String time4;

  WeatherDataRow(this.time1, this.time2, this.time3, this.time4);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          time1,
          style: TextStyle(fontSize: 15.0, color: Colors.black),
        ),
        Text(
          time2,
          style: TextStyle(fontSize: 15.0, color: Colors.black),
        ),
        Text(
          time3,
          style: TextStyle(fontSize: 15.0, color: Colors.black),
        ),
        Text(
          time4,
          style: TextStyle(fontSize: 15.0, color: Colors.black),
        ),
      ],
    );
  }
}

class ManageCitiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Cities'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for cities...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 80, // Shortened container height
                  color: Colors.blue,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20.0),
                        width: 150, // Width of the left column
                        child: Column(
                          children: [
                            Text(
                              "Vidyavihar",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.white),
                            ),
                            Text(
                              "AQI 158 39° / 24°",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.blue,
                          child: Center(
                            child: Text(
                              '39°',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 80, // Shortened container height
                  color: Colors.blue,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20.0),
                        width: 150, // Width of the left column
                        child: Column(
                          children: [
                            Text(
                              "Delhi",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.white),
                            ),
                            Text(
                              "AQI 158 39° / 24°",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.blue,
                          child: Center(
                            child: Text(
                              '37°',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

