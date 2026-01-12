# 🅿️ ParkNote

ParkNote, kullanıcıların park yerlerini kolayca bulmalarını, kaydetmelerini ve yönetmelerini sağlayan modern bir Flutter mobil uygulamasıdır. Açık hava park deneyimini iyileştirmek için GPS, Harita entegrasyonu ve Akıllı özellikler sunar.

## 📱 Proje Hakkında

ParkNote, şehir içi park sorununa çözüm getirmek amacıyla geliştirilmiştir. Kullanıcılar boş park yerlerini harita üzerinde görebilir, kendi park ettikleri konumu fotoğraflı ve konum tabanlı olarak kaydedebilir ve "Aracımı Bul" özelliği ile park ettikleri yere kolayca geri dönebilirler. Ayrıca, yönetici paneli ile sistemin genel durumu izlenebilir.

## ✨ Özellikler

*   **🗺️ İnteraktif Harita:** Google Maps entegrasyonu ile çevredeki park yerlerini ve kendi konumunuzu görüntüleyin.
*   **📍 Park Yeri Ekleme & Yönetimi:** Bulunduğunuz konumu park yeri olarak işaretleyin, fotoğraf ekleyin ve detayları kaydedin.
*   **⏱️ Park Oturumu & Zamanlayıcı:** Park sürenizi başlatın, ne kadar süredir park halinde olduğunuzu takip edin.
*   **compass Aracımı Bul (Radar Modu):** Pusula ve radar arayüzü ile aracınızın tam konumuna (yön ve mesafe bilgisiyle) kolayca ulaşın.
*   **🔐 Kullanıcı İşlemleri:** Giriş yapma, kayıt olma ve profil yönetimi.
*   **📊 Aktivite Geçmişi:** Geçmiş park işlemlerinizi ve aktivitelerinizi görüntüleyin.
*   **🛠️ Yönetici (Admin) Paneli:** Uygulama istatistiklerini ve kullanıcı verilerini yönetmek için özel panel.
*   **💾 Yerel Veritabanı:** Drift (SQLite) kullanılarak verilerin cihazda güvenli ve hızlı bir şekilde saklanması.

## 🛠 Kullanılan Teknolojiler

Bu proje, modern Flutter ekosisteminin güçlü kütüphaneleri kullanılarak geliştirilmiştir:

*   **[Flutter](https://flutter.dev/):** UI Framework
*   **[Dart](https://dart.dev/):** Programlama Dili
*   **[Riverpod](https://riverpod.dev/):** State Management (Durum Yönetimi)
*   **[GoRouter](https://pub.dev/packages/go_router):** Navigasyon ve Rotalama
*   **[Drift](https://drift.simonbinder.eu/):** Reactive SQLite Veritabanı
*   **[Google Maps Flutter](https://pub.dev/packages/google_maps_flutter):** Harita Entegrasyonu
*   **[Location](https://pub.dev/packages/location) & [Flutter Compass](https://pub.dev/packages/flutter_compass):** Konum ve Pusula servisleri
*   **[Camera](https://pub.dev/packages/camera):** Fotoğraf çekimi için
*   **[Freezed](https://pub.dev/packages/freezed):** Immutable model sınıfları ve code generation (geliştirme aşamasında)

## 🚀 Kurulum ve Başlatma

Projeyi yerel makinenizde çalıştırmak için aşağıdaki adımları izleyin:

### Gereksinimler

*   [Flutter SDK](https://docs.flutter.dev/get-started/install) (Sürüm 3.10.1 veya üzeri)
*   Android Studio veya VS Code
*   Bir Google Cloud Projesi ve aktif edilmiş **Maps SDK for Android/iOS**

### Adım Adım Kurulum

1.  **Projeyi Klonlayın:**
    ```bash
    git clone https://github.com/kullaniciadi/park_note.git
    cd park_note
    ```

2.  **Bağımlılıkları Yükleyin:**
    ```bash
    flutter pub get
    ```

3.  **Code Generation (Veritabanı ve Riverpod için):**
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

4.  **🔑 API Key Yapılandırması (ÖNEMLİ):**
    Google Maps'in çalışması için geçerli bir API anahtarına ihtiyacınız vardır.

    *   **Android için:**
        `android/local.properties` dosyasını oluşturun (veya varsa açın) ve içine şunu ekleyin:
        ```properties
        MAPS_API_KEY=SIZIN_GOOGLE_MAPS_API_ANAHTARINIZ
        ```
        *(Not: Bu dosya `.gitignore` listesindedir, yani güvenlidir.)*

    *   **iOS için:**
        `ios/Runner/AppDelegate.swift` dosyasında `GMSServices.provideAPIKey("YOUR_KEY")` alanını düzenleyin veya daha güvenli bir yöntem olarak `Info.plist` içerisine ekleyin (ancak git'e atmamaya dikkat edin).

5.  **Uygulamayı Başlatın:**
    ```bash
    flutter run
    ```

## 📂 Proje Yapısı

Proje, "Feature-First" (Özellik Tabanlı) mimari yapısına göre düzenlenmiştir:

```
lib/
├── features/           # Her bir özellik ayrı klasörde (auth, map, parking, vb.)
│   ├── auth/           # Giriş/Kayıt ekranları ve mantığı
│   ├── map/            # Harita görünümü ve ilgili widget'lar
│   ├── parking/        # Park yeri ekleme, listeleme, detay
│   ├── profile/        # Profil yönetimi
│   ├── admin/          # Admin paneli
│   └── ...
├── shared/             # Ortak kullanılan widget'lar ve servisler
├── core/               # Temel yapılandırmalar (tema, sabitler, utils)
└── main.dart           # Başlangıç noktası
```

## ⚠️ Güvenlik Uyarısı

Lütfen **Google Maps API Key**'inizi asla GitHub gibi halka açık depolara (public repository) yüklemeyin. API anahtarınızı `local.properties` gibi dosyalarda saklayın ve bu dosyaların `.gitignore` listesinde olduğundan emin olun.

## 🤝 Katkıda Bulunma

1.  Bu repoyu Fork'layın.
2.  Yeni bir özellik dalı (branch) oluşturun (`git checkout -b ozellik/YeniOzellik`).
3.  Değişikliklerinizi Commit yapın (`git commit -m 'Yeni özellik eklendi'`).
4.  Dalınızı (branch) Push yapın (`git push origin ozellik/YeniOzellik`).
5.  Bir Pull Request (PR) oluşturun.

## 📄 Lisans

Bu proje [MIT](LICENSE) lisansı ile lisanslanmıştır.
