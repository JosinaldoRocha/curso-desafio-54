class SmartphoneModel {
  String color;
  String model;
  String brand;
  String operationalSystem;
  String dimensions;
  String weight;
  double inches;
  String megapixelCamera;
  int ramMemory;
  int maxMemory;
  String expandableMemory;
  String resolution;
  String processor;
  int fullyChargedBattery;
  double price;

  SmartphoneModel(
      {required this.color,
      required this.model,
      required this.brand,
      required this.operationalSystem,
      required this.dimensions,
      required this.weight,
      required this.inches,
      required this.megapixelCamera,
      required this.ramMemory,
      required this.maxMemory,
      required this.expandableMemory,
      required this.resolution,
      required this.processor,
      required this.fullyChargedBattery,
      required this.price});

  int batteryChargeAmount = 0;
  bool smartphoneOff = true;
  bool noCharge = true;

  Future<void> turnOnSmartphone() async {
    print('Inicializando...');
    await Future.delayed(Duration(seconds: 5));
    print("Seu disposito está pronto para uso.");
    smartphoneOff = false;
  }

  Future<void> turnOffSmartphone() async {
    print('Desligando...');
    await Future.delayed(Duration(seconds: 5));
    smartphoneOff = true;
    print('BYE!');
  }

  void recarregar() {
    batteryChargeAmount += 20;
  }

  void chargedBattery() {
    print('Bateria totalmente carregada!');
    batteryChargeAmount = fullyChargedBattery;
  }

  void deadBattery() {
    print('Bateria descarregada.');
    batteryChargeAmount == 0;
  }

  void lowBattery() {
    print('Bateria fraca! Algumas funções podem não funcionar corretamente.\n'
        'Conecte seu smartphone ao carregador.');
  }

  void makeCall() {
    print('Relizando chamada de voz');
    batteryChargeAmount -= 5;
  }

  void useGames() {
    print('Jogos em uso.');
    batteryChargeAmount -= 10;
  }

  void useWhatsapp() {
    print('Whatsapp em uso.');
    batteryChargeAmount -= 10;
  }

  void useYouTube() {
    print('Youtube em uso.');
    batteryChargeAmount -= 15;
  }
}
