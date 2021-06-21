class HotelListData {
  HotelListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.adresse = "",
    this.ville = "",
    this.phone = "",
    this.Facebooklink = "",
    this.website = "",
  });

  String imagePath;
  String titleTxt;
  String adresse;
  String ville;
  String phone;
  String Facebooklink;
  String website;

  static List<HotelListData> hotelList = <HotelListData>[
    HotelListData(
      imagePath: 'assets/images/linabio.jpg',
      titleTxt: 'Lina Bio',
      adresse: 'Rue de Turquie, Bizerte',
      ville: ' Bizert',
      Facebooklink: 'https://www.facebook.com/LINA-BIO-1587306951491340/',
      phone: '98472837',
    ),
    HotelListData(
      imagePath: 'assets/images/naturelle.png',
      titleTxt: '100% Naturel',
      adresse: '''18 rue d'Espagne, Bizerte''',
      ville: 'Bizert',
      Facebooklink: 'https://www.facebook.com/LINA-BIO-1587306951491340/',
      phone: '98472837',
    ),
    HotelListData(
      imagePath: 'assets/images/vi.png',
      titleTxt: 'Vi pour la nature',
      adresse: '6 Rue Abdelhafidh El Mekki ',
      ville: 'Marsa',
      Facebooklink: "https://www.facebook.com/LINA-BIO-1587306951491340/",
      phone: '98472837',
    ),
    HotelListData(
      imagePath: 'assets/images/bebio.jpg',
      titleTxt: 'BEBIO',
      adresse: 'Résidence el Fell avenue Hédi Nouira, Ariana',
      ville: 'Ariana',
      Facebooklink: 'https://www.facebook.com/LINA-BIO-1587306951491340/',
      phone: '98472837',
    ),
    HotelListData(
      imagePath: 'assets/images/compa.jpg',
      titleTxt: 'La Campangola',
      adresse: 'Avenue Ariana les Roses, Ennasr 2, Tunis',
      ville: 'Tunis',
      Facebooklink: 'https://www.facebook.com/LINA-BIO-1587306951491340/',
      phone: '98472837',
    ),
  ];
}
