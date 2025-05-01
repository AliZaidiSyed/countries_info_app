import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
  ));
}

class PhotoHero extends StatelessWidget {
  const PhotoHero({
    super.key,
    required this.photo,
    this.onTap,
    required this.width,
  });
  final String photo;
  final VoidCallback? onTap;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.network(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 var countryData = [
    { 
      'name': "ENGLAND", 
      'flag': "https://flagcdn.com/w320/gb.png",
      'description': "England is a country that is part of the United Kingdom, known for its rich history, royal family, and landmarks like Big Ben and the Tower of London."
    },
    { 
      'name': "CHINA", 
      'flag': "https://flagcdn.com/w320/cn.png",
      'description': "China is the world's most populous country, famous for its ancient civilization, the Great Wall, and rapid economic growth."
    },
    { 
      'name': "JAPAN", 
      'flag': "https://flagcdn.com/w320/jp.png",
      'description': "Japan is an island nation in East Asia known for its technology, traditional culture, and landmarks like Mount Fuji and Kyoto temples."
    },
    { 
      'name': "PAKISTAN", 
      'flag': "https://flagcdn.com/w320/pk.png",
      'description': "Pakistan is a South Asian country with diverse landscapes and a rich cultural heritage, home to the Indus Valley Civilization."
    },
    { 
      'name': "SOUTHAFRICA", 
      'flag': "https://flagcdn.com/w320/za.png",
      'description': "South Africa is known for its natural beauty, wildlife, and history of apartheid. It has three capital cities and a diverse culture."
    },
    { 
      'name': "FRANCE", 
      'flag': "https://flagcdn.com/w320/fr.png",
      'description': "France is a European country known for its art, cuisine, fashion, and landmarks such as the Eiffel Tower and the Louvre Museum."
    },
    { 
      'name': "GERMANY", 
      'flag': "https://flagcdn.com/w320/de.png",
      'description': "Germany is a leading European nation with a strong economy, rich history, and cultural influence, known for its engineering and Oktoberfest."
    },
    { 
      'name': "INDIA", 
      'flag': "https://flagcdn.com/w320/in.png",
      'description': "India is a diverse South Asian country with a deep cultural heritage, known for the Taj Mahal, its festivals, and a growing tech industry."
    },
    { 
      'name': "USA", 
      'flag': "https://flagcdn.com/w320/us.png",
      'description': "The United States is a large North American country known for its global influence, cultural diversity, and landmarks like the Statue of Liberty."
    },
    { 
      'name': "BRAZIL", 
      'flag': "https://flagcdn.com/w320/br.png",
      'description': "Brazil is the largest country in South America, known for the Amazon rainforest, Carnival festival, and its passion for football."
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title:  Text("WELCOME TO HOMEPAGE"),
          backgroundColor: Colors.red,
        ),
        body: _getDynamicList(),
      ),
    );
  }

  _getDynamicList() {
    return ListView.builder(
      itemCount: countryData.length,
      itemBuilder: (ctx, index) {
        return ListTile(
          title: Text(countryData[index]['name']!),
          leading: PhotoHero(photo: countryData[index]['flag']!, width: 40),
          trailing:  Icon(Icons.arrow_forward_ios, size: 10),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("CLICKED ON COUNTRY ${countryData[index]['name']}")));

            
Navigator.push(context,MaterialPageRoute(builder: (context) => DetailPage(data: countryData[index])));
          },
        );
      },
    );
  }
}

class DetailPage extends StatelessWidget {
  final Map<String, String> data;

  DetailPage({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
            title: Text("WELCOME TO DETAILS"), 
            backgroundColor: Colors.red),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              PhotoHero(
                  photo: data['flag']!,
                  width: 400.0,
                  onTap: () {
                    Navigator.pop(context);
                  }),
            
              Text(data['name']!,
                  style:  TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30)),
           
              Padding(
                padding:  EdgeInsets.all(8.0),
                child: Text(data['description']!,
                   
                    style:  TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}