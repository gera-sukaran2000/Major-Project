import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

import '../Providers/Article.dart';

class webScraping extends StatefulWidget {
  const webScraping({Key key}) : super(key: key);

  @override
  State<webScraping> createState() => _webScrapingState();
}

class _webScrapingState extends State<webScraping> {
  List<Article> articles = [];

  @override
  void initState() {
    getWebsiteData();
    super.initState();
  }

  Future getWebsiteData() async {
    var site = 'Paprika Powder';
    final url = Uri.parse(
        'https://www.google.com/search?tbm=shop&hl=en-GB&psb=1&ved=0CAAQvOkFahcKEwj4jMmp9773AhUAAAAAHQAAAAAQRQ&q=${site}&oq=Sugar&gs_lcp=Cgtwcm9kdWN0cy1jYxABGAAyBAgjECcyCwgAEIAEELEDEIMBMgsIABCABBCxAxCDATILCAAQgAQQsQMQgwEyCwgAEIAEELEDEIMBMgsIABCABBCxAxCDATILCAAQgAQQsQMQgwEyCwgAEIAEELEDEIMBMgUIABCABDILCAAQgAQQsQMQgwE6BwgjEOoCECdQ5ghYqRJgwyJoAXAAeACAAZgJiAH3EJIBDTAuMi4xLjUtMS4wLjGYAQCgAQGwAQo&sclient=products-cc');
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);

    final titles = html
        .querySelectorAll(
            'a > div.HUOptb > div > div.sh-np__product-title.translate-content')
        .map((element) => element.innerHtml.trim())
        .toList();

    final prices = html
        .querySelectorAll('div > span > b')
        .map((element) => element.innerHtml.trim())
        .toList();

    final shipper = html
        .querySelectorAll(
            'a > div.HUOptb > div > div.sh-np__seller-container > span')
        .map((element) => element.innerHtml.trim())
        .toList();

    // final imgUrl = html
    //     .querySelectorAll('div > img')
    //a > div.HUOptb > div > div.sh-np__product-title.translate-content  titles
    //div > span > b
    //     .map((element) => element.attributes['src'])
    //     // .toList();

    print('Count: ${titles.length}');
    for (final title in titles) {
      debugPrint(title);
    }

    setState(() {
      articles = List.generate(
          titles.length,
          (index) => Article(
              title: titles[index],
              price: prices[index],
              urlImage: '',
              source: shipper[index]));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: articles.length,
        itemBuilder: ((context, index) {
          final article = articles[index];

          return ListTile(
            subtitle: Row(
              children: [
                Icon(
                  Icons.monetization_on,
                  color: Colors.orange.shade400,
                  size: 14,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  article.price,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 13),
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.local_shipping,
                  color: Colors.orange.shade400,
                  size: 14,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  article.source,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 13),
                )
              ],
            ),
            title: Text(
              article.title,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            ),
          );
        }),
      ),
    ));
  }
}
