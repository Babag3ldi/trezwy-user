# trezwyy_user

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


lib/
├── main.dart                   # Programmanyň girelgesi
├── app.dart                    # MaterialApp, Theme sazlamalary
│
├── core/                       # (Esasy Binýat) Hemme ýerde ulanylýan umumy zatlar
│   ├── constants/              # Reňkler, URL-lar, Tekstler
│   │   ├── app_colors.dart
│   │   ├── app_strings.dart
│   │   └── api_endpoints.dart
│   │
│   ├── theme/                  # Dizaýn temalary
│   │   ├── app_theme.dart      # Light/Dark mode sazlamalary
│   │   └── text_styles.dart
│   │
│   ├── utils/                  # Kömekçi funksiýalar
│   │   ├── date_formatter.dart # Wagt formatlaýjy
│   │   ├── validators.dart     # Form barlaglary (boşmy/dälmi)
│   │   └── currency_helper.dart
│   │
│   ├── services/               # Daşarky hyzmatlar (Database, API, GPS)
│   │   ├── hive_service.dart   # Lokal baza
│   │   ├── api_service.dart    # Server bilen baglanyşyk (Dio/Http)
│   │   ├── location_service.dart # GPS
│   │   └── sms_service.dart
│   │
│   └── errors/                 # Ýalňyşlyklary dolandyrmak
│       └── failures.dart
│
├── features/                   # (Esasy Bölümler) Her funksiýa aýratyn papkada
│   │
│   ├── auth/                   # Giriş we Registrasiýa
│   │   ├── data/               # Maglumat gatlagy
│   │   │   ├── models/         # User model
│   │   │   └── auth_repo.dart  # Serverden login barlamak
│   │   ├── logic/              # State Management (Provider)
│   │   │   └── auth_provider.dart
│   │   └── presentation/       # UI (Ekranlar)
│   │       ├── screens/
│   │       │   ├── login_screen.dart
│   │       │   └── otp_screen.dart
│   │       └── widgets/        # Diňe Auth üçin gerekli widgetler
│   │
│   ├── home/                   # Karta we Baş sahypa
│   │   ├── logic/
│   │   │   └── map_provider.dart
│   │   └── presentation/
│   │       ├── screens/
│   │       │   └── home_map_screen.dart
│   │       └── widgets/
│   │           └── driver_marker.dart
│   │
│   ├── order/                  # Sargyt (Sürüji çagyrmak)
│   │   ├── data/
│   │   │   └── models/         # OrderModel (Sargyt modeli)
│   │   ├── logic/
│   │   │   └── order_provider.dart # Baha hasaplamak, sargyt ibermek
│   │   └── presentation/
│   │       ├── screens/
│   │       │   └── order_details_screen.dart
│   │       └── widgets/
│   │           ├── order_bottom_sheet.dart
│   │           └── car_selector.dart
│   │
│   └── history/                # Taryh
│       ├── ... (model, provider, screens)
│
└── shared/                     # (Umumy Widgetler) Taslamanyň islendik ýerinde ulanylýanlar
    ├── widgets/
    │   ├── custom_button.dart  # Biz ýasan Gradient Button
    │   ├── custom_textfield.dart # Biz ýasan Input
    │   └── loading_indicator.dart
    └── dialogs/
        └── error_dialog.dart