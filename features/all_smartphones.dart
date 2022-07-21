import '../util/clean_screen.dart';
import '../util/read.dart';
import '../variables/smartphones.dart';

late int counter;
late int option;
late int optionPhone;

void phoneMenu() {
  option = readInt(
      message:
          '[1] Ver Smartphones disponíveis\n[2] Ver Smartphones por preço\n'
          '[3] Ver Smartphones por memória RAM\n[4] Ver Smartphones por armazenamento');
  cleanScreen();
  if (option == 1) {
    counter = 1;
    print('Smartphones disponíveis:');
    for (var cell in smartphones) {
      print('[${counter++}] ${cell.model}');
    }
    optionPhone = readInt(message: 'Escolha um smartphone:');
    cleanScreen();
    if (optionPhone == 1) {
      testSmartphone();
    } else if (optionPhone == 2) {
      testSmartphone();
    } else if (optionPhone == 3) {
      testSmartphone();
    }
  } else if (option == 2) {
    option = readInt(message: '[1] Menor preço      [2] Maior preço');
    cleanScreen();
    byPrice();
  } else if (option == 3) {
    option =
        readInt(message: '[1] Menor memória RAM      [2] Maior memória RAM');
    cleanScreen();
    byRamMemory();
  } else if (option == 4) {
    option = readInt(
        message: '[1] Menor armazenamento      [2] Maior armazenamento');
    cleanScreen();
    byMaxMemory();
  }
}

void byPrice() {
  if (option == 1) {
    smartphones.sort((a, b) => a.price.compareTo(b.price));
    counter = 1;
    for (var cell in smartphones) {
      print('[${counter++}] - ${cell.model}: R\$ ${cell.price}');
    }
  } else if (option == 2) {
    smartphones.sort((b, a) => a.price.compareTo(b.price));
    counter = 1;
    for (var cell in smartphones) {
      print('[${counter++}] - ${cell.model}: R\$ ${cell.price}');
    }
  }
}

void byRamMemory() {
  if (option == 1) {
    smartphones.sort((a, b) => a.ramMemory.compareTo(b.ramMemory));
    counter = 1;
    for (var cell in smartphones) {
      print('[${counter++}] - ${cell.model}: ${cell.ramMemory} GB');
    }
  } else if (option == 2) {
    smartphones.sort((b, a) => a.ramMemory.compareTo(b.ramMemory));
    counter = 1;
    for (var cell in smartphones) {
      print('[${counter++}] - ${cell.model}: ${cell.ramMemory} GB');
    }
  }
}

void byMaxMemory() {
  if (option == 1) {
    smartphones.sort((a, b) => a.maxMemory.compareTo(b.maxMemory));
    counter = 1;
    for (var cell in smartphones) {
      print('[${counter++}] - ${cell.model}: ${cell.maxMemory} GB');
    }
  } else if (option == 2) {
    smartphones.sort((b, a) => a.maxMemory.compareTo(b.maxMemory));
    counter = 1;
    for (var cell in smartphones) {
      print('[${counter++}] - ${cell.model}: ${cell.maxMemory} GB');
    }
  }
}

void testSmartphone() async {
  String answer = readString(message: 'Ligar o smartphone?');
  cleanScreen();
  if (answer == "s") {
    print('Bateria carregando ...\n...\n...');

    while (smartphones[optionPhone - 1].batteryChargeAmount <
        smartphones[optionPhone - 1].fullyChargedBattery) {
      smartphones[optionPhone - 1].recarregar();
    }
    smartphones[optionPhone - 1].chargedBattery();
    await smartphones[optionPhone - 1].turnOnSmartphone();
  } else {
    print('Impossível utilizar as funções do smartphone, enquanto desligado.');
  }

  while (smartphones[optionPhone - 1].batteryChargeAmount >= 20 &&
      smartphones[optionPhone - 1].smartphoneOff == false) {
    option = readInt(
        message:
            '[1] Jogar\n[2] Fazer chamada de voz\n[3] Usar whatsapp\n[4] Acessar youtube');
    cleanScreen();
    if (option == 1) {
      smartphones[optionPhone - 1].useGames();
    } else if (option == 2) {
      smartphones[optionPhone - 1].makeCall();
    } else if (option == 3) {
      smartphones[optionPhone - 1].useWhatsapp();
    } else if (option == 4) {
      smartphones[optionPhone - 1].useYouTube();
    }
    print(
        'Carga da bateria: ${smartphones[optionPhone - 1].batteryChargeAmount}%');
  }

  smartphones[optionPhone - 1].lowBattery();

  option = readInt(message: '[1] Recarregar\n[2] Desligar');
  cleanScreen();
  if (option == 1) {
    print('Bateria carregando ...\n...\n...');
    while (smartphones[optionPhone - 1].batteryChargeAmount <
        smartphones[optionPhone - 1].fullyChargedBattery) {
      smartphones[optionPhone - 1].recarregar();
    }
    smartphones[optionPhone - 1].chargedBattery();
  } else if (option == 2) {
    smartphones[optionPhone - 1].turnOffSmartphone();
  }
}
