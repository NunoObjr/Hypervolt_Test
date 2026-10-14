# Hypervolt Code Challenge — Scanner Bluetooth LE

Aplicativo **Flutter** de teste técnico que **procura dispositivos Bluetooth Low Energy (BLE) próximos**, lista os que forem encontrados e mostra os **detalhes de anúncio** (*advertisement*) de cada um.

## Funcionalidades

- Solicita a **permissão de localização**, exigida pelo Android para varredura BLE
- **Lista de dispositivos disponíveis** com nome e identificador, atualizada conforme os resultados do *scan*
- **Tela de detalhes** com id, tipo de dispositivo Bluetooth, nível de potência de transmissão (*Tx Power*) e se é conectável

## Conceitos técnicos

**Bluetooth Low Energy.** Dispositivos BLE enviam periodicamente pacotes de *advertisement* com nome, potência de transmissão, serviços e se aceitam conexão. O app apenas **escuta** esses anúncios (scan), sem conectar.

**Streams do `flutter_blue`.** `FlutterBlue.instance.scanResults` entrega um `Stream<List<ScanResult>>` que alimenta a lista; cada `ScanResult` contém o `BluetoothDevice` e o `AdvertisementData`.

**Permissões em tempo de execução.** `ServicesManager.initServices()` usa `location_permissions` para checar e pedir a permissão antes de iniciar o scan.

**Organização por páginas.** Cada tela tem a sua pasta, com `pages/` e `local_widgets/` (widgets usados só por aquela página), mais um tema central em `theme/app_theme.dart` (fonte Montserrat).

## Stack

Flutter · Dart · `flutter_blue` · `location_permissions`

## Estrutura

```
lib/
  main.dart                  # rotas: '/' (lista) e '/infoDevice' (detalhes)
  services/services_manager.dart
  theme/app_theme.dart
  pages/
    list_devices/            # lista de dispositivos encontrados
    info_device/             # detalhes de um dispositivo
```

## Como executar

Requer **dispositivo físico** com Bluetooth (o emulador não faz scan BLE).

```bash
flutter pub get
flutter run
```

> O projeto usa um SDK antigo do Dart (`>=2.7.0 <3.0.0`) e `flutter_blue` 0.8; use uma versão compatível do Flutter (por exemplo via FVM).
