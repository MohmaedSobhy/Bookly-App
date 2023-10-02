class BoardingModel {
  final String image;
  final String title;
  final String discription;

  BoardingModel(
      {required this.image, required this.title, required this.discription});
}

List<BoardingModel> boardingContents = [
  BoardingModel(
    title: 'Only Books Can Help You',
    image: 'images/boarding_view_1.png',
    discription:
        "Books can help you to increase your knowledge and become more successfully",
  ),
  BoardingModel(
    title: 'Learn Smartly',
    image: 'images/boarding_view_2.png',
    discription:
        "It’s 2022 and it’s time to learn every quickly and smartly. All books are storage in cloud and you can access all of them from your laptop or PC.",
  ),
  BoardingModel(
    title: 'Book Has Power To Chnage Everything',
    image: 'images/boarding_view_1.png',
    discription:
        "We have true friend in our life and the books is that. Book has power to chnage yourself and make you more valueable.",
  ),
];
