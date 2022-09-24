class ReceiptModel{

  final String Color;



  final String img;
  final String name;

  ReceiptModel(this.Color, this.img, this.name);




}
List<ReceiptModel> receiptList=[
  ReceiptModel('0xffED8A5C', 'assets/pasta.png', 'Vegetarian pasta'),
  ReceiptModel('0xffA27183', 'assets/slamon.png', 'salmon salad')

];