
class OnBoardingEntity{
  final String image;
  final String heading;
  final String description;

  OnBoardingEntity({required this.image, required this.heading, required this.description});

  static List<OnBoardingEntity> onBoardingData=[
    OnBoardingEntity(
      image: 'assets/images/brand.png',
      description: "Fringilla nunc, dolor in risus morbi blandit tempor nulla. Nibh ut fermentum vel et, sed et id. Est posuere turpis id tempor cursus nulla scelerisque vel.",
      heading: "Claim Başlığı - 1"
    ),
    OnBoardingEntity(
        image: 'assets/images/brand.png',
        description: "Mauris, id dictum egestas erat congue eget. Lacus risus, sagittis, accumsan dictum malesuada nec tristique.",
        heading: "Claim Başlığı - 2"
    ),
    OnBoardingEntity(
        image: 'assets/images/brand.png',
        description: "Fringilla nunc, dolor in risus morbi blandit tempor nulla. Nibh ut fermentum vel et, sed et id. Est posuere turpis id tempor cursus nulla scelerisque vel.",
        heading: "Claim Başlığı - 3"
    ),
  ];
}