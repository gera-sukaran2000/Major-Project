import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RecipeData {
  String id;
  String title;
  String imageUrl;
  int noOfServings;
  int cookTime;
  List<dynamic> ingredients;
  List<dynamic> directions;

  RecipeData({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.noOfServings,
    @required this.cookTime,
    this.ingredients,
    this.directions,
  });
}

class RecipeDataList with ChangeNotifier {
  static List<RecipeData> allRecipes = [
    // RecipeData(
    //     id: 1,
    //     title: 'Crispy Fried Chicken',
    //     imageUrl:
    //         'https://dinnerthendessert.com/wp-content/uploads/2019/01/Fried-Chicken-2.jpg',
    //     noOfServings: 8,
    //     cookTime: 65,
    //     ingredients: [
    //       '1) 1 (4 pound) chicken, cut into pieces',
    //       '2) 1 cup buttermilk',
    //       '3) 2 cups all-purpose flour for coating',
    //       '4) 1 teaspoon paprika',
    //       '5) salt and pepper to taste',
    //       '6) 2 quarts vegetable oil for frying',
    //     ],
    //     directions: [
    //       '1)Take your cut up chicken pieces and skin them if you prefer.\nPut the flour in a large plastic bag\n(let the amount of chicken you are cooking dictate the amount of flour you use).\nSeason the flour with paprika, salt and pepper to taste\n(paprika helps to brown the chicken).',
    //       '2)Dip chicken pieces in buttermilk then, a few at a time, put\nthem in the bag with the flour, seal the bag and shake to\ncoat well. Place the coated chicken on a cookie sheet or tray,\nand cover with a clean dish towel or waxed paper. LET SIT\nUNTIL THE FLOUR IS OF A PASTE-LIKE CONSISTENCY. THIS\nIS CRUCIAL!',
    //       '3)Fill a large skillet (cast iron is best) about 1/3 to 1/2 full with\nvegetable oil. Heat until VERY hot. Put in as many chicken\npieces as the skillet can hold. Brown the chicken in HOT oil\non both sides. When browned, reduce heat and cover skillet;\nlet cook for 30 minutes (the chicken will be cooked through\nbut not crispy). Remove cover, raise heat again and continue\nto fry until crispy.',
    //       '4)Drain the fried chicken on paper towels. Depending on how\nmuch chicken you have, you may have to fry in a few shifts.\nKeep the finished chicken in a slightly warm oven while\npreparing the rest.'
    //     ]),
    // RecipeData(
    //     id: 2,
    //     title: 'Authentic Pizza\nMargherita',
    //     imageUrl:
    //         'https://cookieandkate.com/images/2021/07/classic-margherita-pizza.jpg',
    //     noOfServings: 4,
    //     cookTime: 95,
    //     ingredients: [
    //       '1) 1 (4 pound) chicken, cut into pieces',
    //       '2) 1 cup buttermilk',
    //       '3) 2 cups all-purpose flour for coating',
    //       '4) 1 teaspoon paprika',
    //       '5) salt and pepper to taste',
    //       '6) 2 quarts vegetable oil for frying',
    //     ],
    //     directions: [
    //       '1)Stir flour and 1 teaspoon salt in a bowl. Set aside.\nMix water, yeast, and sugar in a large bowl.\nLet stand until yeast begins to form a creamy foam,\nabout 5 minutes.',
    //       '2)Stir half the flour mixture into yeast mixture until no dry\nspots remain. Stir in remaining flour, 1/2 cup at a time,\nmixing well after each addition. When dough pulls together,\nturn it out onto a lightly floured surface and knead until\nsmooth and elastic, about 8 minutes.',
    //       '3)Lightly oil a large bowl, then place dough in the bowl and\nturn to coat with oil. Cover with a light cloth and let rise in a\nwarm place (80 to 95 degrees F (27 to 35 degrees C)) until\ndoubled in volume, about 1 hour. Punch dough down,\ndivide into 4 equal pieces, and form each into a ball.',
    //       '4)Preheat oven with a pizza stone to 500 degrees F\n(260 degrees C).',
    //       '5)Stretch out and pat 1 dough ball to form a circle 10 to 12\ninches in diameter. Place dough on a lightly floured pizza\npeel. Top with 1/2 cup of tomato sauce and spread to cover\nwithin an inch of the edge of the dough. Arrange 5 slices of\nmozzarella cheese on top of the tomato sauce, then place 5\nbasil leaves on top. Drizzle pizza with 1 tablespoon olive oil\nand sprinkle with sea salt to taste. Repeat for 3 remaining\ndough balls.',
    //       '6)Slide each pizza onto the pizza stone in the preheated oven.\nBake until cheese is bubbly and the underside of the crust is\ngolden brown, 5 to 7 minutes.'
    //     ]),
    // RecipeData(
    //     id: 3,
    //     title: 'White Sauce for\nPasta',
    //     imageUrl:
    //         'https://lilluna.com/wp-content/uploads/2017/10/penne-pasta-resize-3.jpg',
    //     noOfServings: 4,
    //     cookTime: 15,
    //     ingredients: [
    //       '1) 2 tablespoons butter',
    //       '2) 2 tablespoons margarinet',
    //       '3) 3 tablespoons all-purpose flour',
    //       '4) 1 cube chicken bouillon, crumbled',
    //       '5) 1 cups boiling water',
    //       '6) 1 cup 2% milk',
    //       '7) 2 cups pizza sauce',
    //       '8) ground white pepper to taste',
    //     ],
    //     directions: [
    //       '1)Melt butter and margarine in a saucepan over medium-low\nheat; stir in flour and bouillon until roux is well blended.\nContinue to cook and stir until thickened and lightly\nbrowned, about 5 minutes. Increase heat to medium and\nwhisk water into roux until smooth. Stir in milk; cook and\nstir until thickened, about 2 minutes more. Season with\nwhite pepper.',
    //     ]),
    // RecipeData(
    //     id: 4,
    //     title: 'Rajma(Kidney Beans)',
    //     imageUrl:
    //         'https://www.cubesnjuliennes.com/wp-content/uploads/2020/06/Authentic-Punjabi-Rajma-Recipe.jpg',
    //     noOfServings: 4,
    //     cookTime: 15,
    //     ingredients: [
    //       '1) 1 pound dry kidney beans',
    //       '2) water to cover',
    //       '3) ¼ teaspoon ground turmeric',
    //       '4) 1 tablespoon vegetable oil',
    //       '5) 3 tomatoes, chopped',
    //       '6) 1 (2 inch) piece fresh ginger, minced',
    //       '7) 2 cloves garlic, minced',
    //       '8) 1 teaspoon cumin seeds',
    //       '9) 2 teaspoons garam masala',
    //       '10) 2 teaspoons ground coriander'
    //           '11) ½ teaspoon red chile powder',
    //       '12) ¼ teaspoon heeng (asafoetida powder)',
    //       '13) 2 teaspoons curd (plain yogurt)',
    //       '14) 2 sprigs fresh cilantro, leaves finely chopped'
    //     ],
    //     directions: [
    //       '1)Place kidney beans into a large container and cover with\nseveral inches of cool water; let stand 8 hours to overnight.\nDrain and rinse kidney beans.',
    //       "2)Combine kidney beans, ground turmeric, and salt in a\npressure cooker; add enough water to cover beans. Cover\npressure cooker with lid and cook beans according to\nmanufacturer's instructions until tender, about 20 minutes.\nRelease pressure from pressure cooker.",
    //       '3)Heat oil in a skillet over medium heat; cook and stir\ntomatoes, onion, ginger, garlic, and cumin seeds until\nheated through and fragrant, 2 to 4 minutes.',
    //       '4)Mix garam masala, ground coriander, red chile powder, and\nheeng into tomato mixture; simmer for 2 minutes.\nAdd kidney beans and curd; simmer until heated through, about\n5 minutes. Top rajma with cilantro.',
    //     ]),
    // RecipeData(
    //     id: 5,
    //     title: 'Shahi Paneer',
    //     imageUrl:
    //         'https://www.sanjanafeasts.co.uk/wp-content/uploads/2020/01/Restaurant-Style-Shahi-Paneer-500x500.jpg',
    //     noOfServings: 4,
    //     cookTime: 35,
    //     ingredients: [
    //       '1) 2 tablespoons cooking oil',
    //       '2) 1 large onion, thinly sliced',
    //       '3) 4 cloves garlic, minced',
    //       '4) 1 teaspoon ground cumin',
    //       '5) 1 teaspoon ground coriander',
    //       '6) ½ teaspoon ground turmeric',
    //       '7) ½ teaspoon Kashmiri red chili powder',
    //       '8) 4 tomatoes, pureed',
    //       '9) ½ pound paneer, cubed',
    //       '10) ¼ cup water'
    //           '11) 1 teaspoon white sugar',
    //       '12) salt to taste',
    //       '13) ¼ cup cream',
    //       '14) 2 tablespoons chopped fresh cilantro'
    //     ],
    //     directions: [
    //       '1)Heat the oil in a large skillet over medium heat. Cook the\nonion and garlic in the hot oil until the onions are soft and\ngolden brown, about 5 minutes. Sprinkle the cumin,\ncoriander, turmeric, and chili powder over the onion and\ngarlic; continue cooking until the seasonings are fragrant,\nabout 30 seconds.',
    //       "2)Pour the pureed tomatoes into the skillet; cook until the\nexcess liquid evaporates and the oil separates, 3 to 5\nminutes. Add the paneer, water, sugar, and salt to\nthe mixture; stir gently so the paneer does not break apart.\nCook until the paneer begins to absorb some of the liquid,\nabout 10 minutes. Stir the cream into the mixture and\nsimmer another 5 minutes. Garnish with cilantro to serve.",
    //     ]),
    // RecipeData(
    //     id: 6,
    //     title: 'Western Omellete',
    //     imageUrl:
    //         'https://thekitchenmagpielowcarb.com/wp-content/uploads/2018/11/HowtoMakeADenverWesternOmelette1.jpg',
    //     noOfServings: 4,
    //     cookTime: 20,
    //     ingredients: [
    //       '1) 2 tablespoons cooking oil',
    //       '2) 1 large onion, thinly sliced',
    //       '3) 4 cloves garlic, minced',
    //       '4) 1 teaspoon ground cumin',
    //       '5) 1 teaspoon ground coriander',
    //       '6) 1 (2 inch) piece fresh ginger, minced',
    //       '7) 2 cloves garlic, minced',
    //       '8) 2 eggs',
    //     ],
    //     directions: [
    //       '1)Melt 1 teaspoon butter in a small skillet over medium heat.\nAdd mushrooms, bell pepper, and green onions; cook until\ntender, about 5 minutes. Stir in ham until heated through,\nabout 1 minute. Season with salt and pepper. Set filling\nmixture aside in a small bowl and keep warm.',
    //       "2)Beat eggs together in a bowl; season with salt and pepper.",
    //       '3)Heat the same skillet over medium-high heat. Add\nremaining 1 teaspoon butter; heat until foaming. Pour in\neggs and cook for 30 seconds. Lift the edges of the omelet so\nthat the uncooked egg runs under the cooked edges and\ncomes into contact with the hot skillet. Shake and tilt the\nskillet to move the uncooked egg. Repeat until the top is set\nbut still moist and soft, about 2 minutes.',
    //       '4)Spread the filling over one side of the omelet. Fold the other\nhalf over the filling and slide omelet onto a plate.',
    //     ]),
    // RecipeData(
    //     id: 7,
    //     title: "Chole(Indian\nChickpeas)",
    //     imageUrl:
    //         'https://i1.wp.com/vegecravings.com/wp-content/uploads/2017/01/chole-recipe-step-by-step-instructions-13.jpg?fit=1840%2C1554&quality=65&strip=all&ssl=1',
    //     noOfServings: 4,
    //     cookTime: 40,
    //     ingredients: [
    //       '1) 1 tablespoon vegetable oil',
    //       '2) 1 small onion, diced',
    //       '3) 1 teaspoon minced garlic',
    //       '4) 1 teaspoon minced fresh ginger root',
    //       '5) 2 star anise pods, broken into pieces',
    //       '6) 1 (15 ounce) can chickpeas, drained and rinsed',
    //       '7) 1 (8 ounce) can tomato sauce',
    //       '8) ½ cup water',
    //       '9) ¾ teaspoon ground coriander',
    //       '10)¼ teaspoon ground turmeric',
    //       '11) 1 whole clove, or more to taste'
    //     ],
    //     directions: [
    //       '1)Heat oil in a pot over medium-high heat. Saute onion until\ntranslucent, about 5 minutes. Add garlic, ginger, and anise;\nstir. Add chickpeas, tomato sauce, water, chile powder,\ngaram masala, salt, cumin, coriander, turmeric, and clove.\nReduce heat to medium-low and simmer, covered, until\nchickpeas start to soften, 5 to 7 minutes.',
    //       "2)Mash some of the chickpeas directly in the pot to give the\nsauce a chunkier consistency. Cover and continue\nsimmering, stirring occasionally, until flavors come\ntogether, about 15 minutes. Remove star anise pieces\nand clove before serving.",
    //     ]),
    // RecipeData(
    //     id: 8,
    //     title: "Indian Naan",
    //     imageUrl:
    //         'https://www.thespruceeats.com/thmb/GLt4uTZua2Ck9IDxAl-W3XeZ624=/4145x3109/smart/filters:no_upscale()/naan-leavened-indian-flatbread-1957348-final-08-116a2e523f6e4ee693b1a9655784d9b9.jpg',
    //     noOfServings: 3,
    //     cookTime: 45,
    //     ingredients: [
    //       '1) ⅔ cup warm water (110 degrees F/45 degrees C)',
    //       '2) 1 teaspoon active dry yeast',
    //       '3) 1 teaspoon white sugar',
    //       '4) 2 cups all-purpose flour',
    //       '5) 1 teaspoon salt',
    //       '6) ¼ cup ghee',
    //       '7) 2 tablespoons plain yogurt',
    //     ],
    //     directions: [
    //       '1)Whisk the warm water with the yeast and sugar until the\nyeast is dissolved. Cover and let stand in a warm place\nfor 10 minutes.',
    //       "2)Sift flour and salt three times into a large bowl add the yeast\nmixture, half of the ghee and all the yogurt. Mix into a soft\ndough then knead on a floured surface for about 5 minutes\nor until dough is smooth and elastic. Place the dough in a\nlarge greased bowl, cover and let stand in a warm place for 1\n1/2 hours or until the dough is doubled in size .",
    //       '3)Punch down dough then knead for 5 minutes. Divide dough\ninto 6 pieces. Roll each piece out into 8 inch round naans..',
    //       '4)Cover an oven tray with foil and grease the\nfoil. Brush the naan with a little of the remaining ghee and sprinkle with\nsome of the kalonji. Cook naan one at a time under the\nbroiler for about 2 minutes on each side or until puffed and\njust browned.',
    //     ]),
    // RecipeData(
    //     id: 9,
    //     title: "Cucumber Peanut\nSalad",
    //     imageUrl:
    //         'https://data.thefeedfeed.com/static/2019/06/28/15617387535d163e01223cb.jpg',
    //     noOfServings: 2,
    //     cookTime: 15,
    //     ingredients: [
    //       '1) 1 large cucumbers - peeled, seeded, and diced',
    //       '2) salt to taste',
    //       '3) 1 tablespoon butter',
    //       '4) ½ teaspoon ground cumin',
    //       '5) 1 dried red chile pepper',
    //       '6) 3 tablespoons coarsely chopped peanuts',
    //       '7) 1 tablespoon lemon juice',
    //     ],
    //     directions: [
    //       '1)Mix together salt and cucumber, and allow to drain in a colander for ten minutes to release water. Pat dry, and place in a medium size bowl.',
    //       "2)Melt butter in a small saucepan, and stir in cumin and chili pepper.",
    //       '3)Add peanuts, lemon juice, sugar, and melted butter to cucumber, and stir together. Garnish with cilantro.',
    //     ]),
    // RecipeData(
    //     id: 10,
    //     title: "Roghan Josh\n(Rogan Josh)",
    //     imageUrl:
    //         'https://dinnerthendessert.com/wp-content/uploads/2019/01/Fried-Chicken-2.jpg',
    //     noOfServings: 2,
    //     cookTime: 75,
    //     ingredients: [
    //       '1) 4 tablespoons water',
    //       '2) 8 cloves garlic, peeled',
    //       '3) 2 ½ teaspoons chopped fresh ginger',
    //       '4) 2 pounds boneless lamb shoulder, cut into 2- inch pieces',
    //       '5) 2 cinnamon sticks',
    //       '6) 10 whole cardamom pods',
    //       '7) 10 whole peppercorns',
    //       '8) 6 whole cloves',
    //       '8) 2 bay leaves',
    //       '10) 4 medium onions, finely chopped',
    //       '11) 4 teaspoons paprika',
    //       '12) 2 teaspoons cumin seeds',
    //       '13) 1 teaspoon cayenne pepper'
    //     ],
    //     directions: [
    //       '1)Blend 4 tablespoons water, garlic, and ginger into a smooth\npaste in a blender.',
    //       "2)Heat oil in a wide, heavy pot over medium heat. Cook lamb\nin batches until browned, about 5 minutes per batch.\nTransfer to a bowl.",
    //       '3)Combine cinnamon sticks, cardamom, peppercorns, cloves,\nand bay leaves in the same pot. Stir once and cook until\ncloves swell and bay leaves change color, 2 to 3 minutes.\nAdd onions. Cook and stir until browned, about 5 minutes.\nAdd the ginger-garlic paste; stir for 30 seconds. Add paprika,\ncumin, coriander, cayenne, and salt. Cook until fragrant,\nabout 30 seconds.',
    //       "4)Stir the browned lamb and its juices into the pot. Stir for 30\nseconds. Add yogurt, 1 tablespoon at a time, blending well\nafter each addition. Cook and stir for 3 minutes more. Pour\nin 1 1/2 cups water; bring to a boil, scraping browned bits off\nthe sides and bottom of the pot. Cover and reduce heat to\nlow. Simmer until meat is tender, about 1 hour, stirring well\nevery 10 minutes.",
    //       "5)Uncover pot, increase heat to medium, and reduce some of the\nliquid if desired. Spoon accumulated fat from the\nsurface of the mixture. Mix in garam masala and black\npepper before serving."
    //     ]),
    // RecipeData(
    //     id: 11,
    //     title: 'Tandori Kabab',
    //     imageUrl:
    //         'https://www.spiceindiaonline.com/wp-content/uploads/2021/05/Tandoori-Chicken-20-500x400.jpg',
    //     noOfServings: 4,
    //     cookTime: 50,
    //     ingredients: [
    //       "1 cup low-fat plain yogurt",
    //       "Zest of 1 lemon",
    //       "1 tablespoon lemon juice",
    //       "1 ½ tablespoons tandoori spice blend or hot curry powder.\n2 cloves garlic, minced",
    //       "2 tablespoons extra-virgin olive oil, divided",
    //       "¾ teaspoon salt, divided",
    //       "½ teaspoon ground pepper, divided",
    //       "1 pound boneless, skinless chicken thighs, trimmed,\ncut into 1-inch pieces",
    //       "1 large bell pepper, cut into 1-inch pieces",
    //       "1 medium red onion, cut into 1-inch pieces",
    //     ],
    //     directions: [
    //       "1) Combine yogurt, lemon zest and juice, tandoori\nspice blend (or curry powder), garlic, 1 tablespoon oil,\n1/2 teaspoon salt and 1/4 teaspoon pepper\nin a medium bowl. Transfer 1/2 cup of the mixture to\na small bowl and refrigerate until ready to use.",
    //       "2) Add chicken to the remaining yogurt mixture\nand stir to coat. Let marinate at room temperature for\n20 minutes or refrigerate for up to 1 day.\n Step 3Preheat grill to high.Step 4Toss\nbell pepper and onion in a large bowl with the remaining 1 tablespoon\noil and 1/4 teaspoon each salt and pepper. Thread the marinated\nchicken, pepper and onion pieces alternately onto eight 10-\nto 12-inch skewers.Step 5Reducegrill heat to medium. Oil\nthe grill rack (see Tip). Grill the skewers, turning once,\nuntil the chicken is cooked through and the vegetables are tender-crisp,\n6 to 8 minutes per side. Serve with the reserved yogurt\nsauce for dipping"
    //     ]),
    // RecipeData(
    //     id: 11,
    //     title: "Falafel",
    //     imageUrl:
    //         'https://www.whiskaffair.com/wp-content/uploads/2019/12/Falafel-1-3.jpg',
    //     noOfServings: 18,
    //     cookTime: 55,
    //     ingredients: [
    //       "1 cup dried chickpeas,soaked overnight\n(don't use canned chickpeas),",
    //       "1 cup cilantro,roughly chopped (about a\none large bunch)",
    //       "1 small green chille pepper,serrano or jalapeno pepper",
    //       "3 garlic cloves",
    //       "1 tspsalt",
    //       "1/2 tspcardamom",
    //       "1/4 tspblack pepper",
    //       "2 tbspchickpea flour",
    //       "1/2 tspbaking soda",
    //       "avocado oil for frying",
    //     ],
    //     directions: [
    //       "The night before, soak the dried chickpeas in water.\nMake sure the water covers the chickpeas by 2-3 inches,\nas they'll triple in size.",
    //       "Drain and rinse the chickpeas and add them to your food processor,\nalong with the onion, parsley, cilantro, pepper, garlic, cumin,\nsalt, cardamom and black pepper.",
    //       "Pulse the food processor several times until the mixture\nresembles the texture of coarse sand.",
    //       "Transfer the falafel mixture to a bowl and\nadd the chickpea flour and baking soda.\nStir together, then cover or add a lid and refrigerate\nthe mixture for 30 minutes to one hour.",
    //       "Use your hands, an ice cream scoop or falafel\nscoop to form the falafel into balls or patties. If you\nfind the mixture is too wet, you can add another tablespoon\nof chickpea flour. If it's too dry and crumbly, you can add a\nteaspoon or two of water or lemon juice.",
    //       "Once the falafel are formed, you can cook them by your\npreferred method mentioned above. To deep fry the falafel,\nadd about 3 inches of oil to a pot on medium heat. Heat the oil\nto 350F. Cook the falafel in batches (about 6-8 at a time)\nfor 1-2 minutes or until golden.",
    //       "Use a skimmer to check the color of the falafel\nand make sure they don't over cook. Then\nremove them to a paper towel-lined plate.",
    //       "Serve the falafel immediately, while warm and crispy on the outside.\nThey're delicious served with tahini sauce as well.",
    //     ]),
    // RecipeData(
    //     id: 12,
    //     title: "Chowmein",
    //     imageUrl:
    //         'https://www.chilitochoc.com/wp-content/uploads/2021/03/Desi-Chow-Mein-featured.jpg',
    //     noOfServings: 4,
    //     cookTime: 25,
    //     ingredients: [
    //       "2tbspoil",
    //       "3 clovegarlic(finely chopped)",
    //       "1 inchginger(finely chopped)",
    //       "few spring onion(chopped)",
    //       "½ onion(sliced)",
    //       "½ green capsicum(sliced)",
    //       "½ red capsicum(sliced)",
    //       "½ carrot (julienne) ",
    //       "½ cupcabbage(shredded)",
    //     ],
    //     directions: [
    //       "firstly, in a large wok, heat 2 tbsp oil and\nstir fry 3 clove garlic,1 inch ginger and few\nspring onion.",
    //       "add ½ onion, ½ green capsicum,½ red capsicum,\n½ carrot and ½ cup cabbage.",
    //       "stir fry until the vegetables shrink yet remain\ncrunchy.",
    //       "make sone space in the centre and pour the prepared sauce.",
    //       "stir fry on high flame for a minute until everything is\nwell combined.",
    //       "add½ cup cabbage and stir fry.further, add boiled noodles and give a\ngood toss.",
    //       "make sure the spices are well combined\nwith noodles.",
    //       "finally, add more spring onions, and enjoy veg\nchowmein.",
    //     ]),
  ];

  Future<void> getData() async {
    // final url = Uri.parse(
    //   'https://yummly2.p.rapidapi.com/feeds/list?limit=18&start=0&tag=list.recipe.popular',
    // );
    // final response = await http.get(url, headers: {
    //   'x-rapidapi-host': 'yummly2.p.rapidapi.com',
    //   'x-rapidapi-key': '52fbb99030msh1db6d74b4c9fc97p1524d0jsn7d791ba0268c'
    // });
    // final extractedData = json.decode(response.body) as Map<String, dynamic>;
    // final recipesList = extractedData['results'];
    // print(extractedData);
    // print(recipesList.length);
    // for (int i = 0; i < recipesList.length; i++) {
    //   allRecipes.add(RecipeData(
    //       id: recipesList[i]['id'],
    //       title: recipesList[i]['title'],
    //       imageUrl: recipesList[i]['image'],
    //       noOfServings: recipesList[i]['servings'],
    //       cookTime: recipesList[i]['readyInMinutes']));
    // }
    Firestore.instance.collection('Recipes/').snapshots().listen((data) {
      data.documents.forEach((document) {
        RecipeDataList.allRecipes.add(RecipeData(
          id: document.documentID,
          title: document['title'],
          imageUrl: document['imageUrl'],
          noOfServings: document['noOfServings'],
          cookTime: document['cookTime'],
          // directions: document['Directions'] as List<dynamic>,
          // ingredients: document['Ingredients'] as List<dynamic>
        ));
      });
    });

    // notifyListeners();
  }

  List<RecipeData> get values {
    return [...allRecipes];
  }
}
