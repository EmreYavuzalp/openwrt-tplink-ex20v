# TP-Link EX20v — OpenWrt Portu

### Sorumluluk Reddi Beyanı

İşbu kaynak kodu, tarafımızca herhangi bir garanti veya taahhüt verilmeksizin,
"olduğu gibi" esasıyla kamuya sunulmaktadır. Bu yazılımın cihazınıza
yüklenmesinden veya kullanılmasından kaynaklanabilecek her türlü arıza, veri
kaybı veya işlevsel bozulmadan bizzat kullanıcı sorumludur; tarafımıza
herhangi bir sorumluluk veya yükümlülük atfedilemez. Cihazın orijinal (stok)
yazılımına geri döndürülmesi işlemi de tamamen kullanıcının kendi
inisiyatifinde ve sorumluluğundadır. Bu konuda ücretsiz destek hizmetimiz yok.

Kaynak koddan derleyip kendi cihazınıza yüklediğiniz durumda garanti verilmez.
Kaynak kodu, İnternet Servis Sağlayıcınız (ISP) tarafından kiralanan bir cihaza yüklemeniz durumunda oluşabilecek hukuki sorunlardan ve sözleşme ihlallerinden Arı Bilişim İletişim ve Danışmanlık sorumlu değildir.
Hepsiburada'dan satın alınan cihazlar, Arı Bilişim İletişim ve Danışmanlık tarafından satılan, ISP ile ilgisi olmayan ve garantili cihazlardır. Satış koşullarındaki garanti kapsamındadır.

**Kurulumla uğraşmak istemeyen kullanıcılarımız, garantili ve
hazır/test edilmiş bir ürün için ürünümüze buradan ulaşabilir:**

* Hepsiburada: https://www.hepsiburada.com/openwrt-yuklu-tp-link-ex20v-ax1800-wifi-6-router-p-HBCV0000HAN6FM?magaza=ARI+B%C4%B0L%C4%B0%C5%9E%C4%B0M+%C4%B0LET%C4%B0%C5%9E%C4%B0M+VE+DANI%C5%9EMANLIK

Hepsiburada'dan veya doğrudan ofisimizden faturalı ve garantili olarak da satın alabilirsiniz.

Kurumsal ve toplu alımlar için: emreyavuzalp2@gmail.com

### WAN Ayarı

WAN portu, kullanılan altyapıya göre farklı bir VLAN ile çalışır:

* Türk Telekom ve Türk Telekom altyapılı ISP'ler: `eth0.35`
* Türkcell Superonline altyapısı: `eth0.2`

Bu, cihazın programlaması gereği böyledir.

### Dikkat ve Sınırlar

Bu depo, GPL kapsamındaki kaynak kodunu ve cihaza özel yapılandırma dosyalarını içerir.

Yükleme yöntemleri bu depo kapsamında değildir.

Kaynak kodu, İnternet Servis Sağlayıcınız (ISP) tarafından kiralanan bir cihaza
yüklemeniz durumunda oluşabilecek hukuki sorunlardan ve sözleşme ihlallerinden
Arı Bilişim İletişim ve Danışmanlık sorumlu değildir.

"Nasıl flashlanır?" gibi sorular için, kendi cihazınızda deneme yapmak yerine hazır ve test edilmiş cihazımızı tercih etmenizi öneririz.

Donanım riski almak istemeyenler için tak-çalıştır, test edilmiş ve garantili cihazlar Hepsiburada'da mevcuttur.

Bu depodaki imaj Kolay Menü sayfalarını içermemektedir. Kolay Menü sayfaları
yalnızca Hepsiburada üzerinden satın alınan ürünlerde mevcuttur.

### Kolay Menü

Hepsiburada'dan satın alınan cihazlarda, stok LuCI'nin üzerine eklenen
"Kolay Menü" adlı basitleştirilmiş sayfalar gelir. Amaçları, normalde
birden fazla ekranda ve teknik bilgi gerektiren ayarları tek bir sayfaya
indirmek:

* **Kolay Kurulum:** WAN/protokol seçimi ve kablosuz ayarları gibi ilk
  kurulum adımlarını tek sayfada toplar.
* **WireGuard VPN:** Road-warrior bir WireGuard sunucusunu ve istemci QR
  kodunu birkaç tıkla kurar; stok OpenWrt'te bu elle yapılandırma,
  sertifika ve istemci profili oluşturmayı gerektirir.
* **Misafir Wi-Fi:** Ayrı bir misafir ağını birkaç saniyede açar.
* **USB Paylaşım (SMB + FTP):** Cihaza takılan bir USB diski ağ üzerinden
  SMB ve FTP ile paylaşıma açar.
* **Android/iOS USB Tethering:** Telefonu USB portuna takıp tethering'i
  açtığınızda cihaz bunu otomatik olarak yedek internet bağlantısı olarak
  kullanır. Gerekli sürücüler ve ayarlar imaja gömülüdür, ek bir
  yapılandırma gerekmez.

Aşağıda bunlardan birinin, Wi-Fi Genişletici sayfasının, nasıl çalıştığına
örnek verelim.

#### Örnek: Wi-Fi Genişletici

Kolay Menü'deki sayfalardan biri, cihazı yaklaşık 25 saniye içinde bir Wi-Fi
genişletici (repeater) ya da mesh düğümü olarak ayarlamaya yarıyor. Stok
OpenWrt'te bu işlem için ayrı ayrı arayüz, kablosuz ve ağ ayarları elle
yapılmalıdır; bu sayfa hepsini tek ekrana indiriyor.

Sayfadaki üç yöntem:

* **WDS (önerilen):** Klasik köprü yöntemi. Çok eski olmayan birçok operatör
  modem/router cihazında da desteklenir, bu yüzden en geniş uyumluluğu
  sağlayan ve önerilen seçenektir.
* **Relayd:** Ana cihaz WDS desteklemiyorsa (bazı ISP modemleri) kullanılır.
  Cihaz, modeme normal bir istemci gibi bağlanıp Wi-Fi'yi genişletir; gerçek
  bir köprü olmadığından bazı cihaz keşif protokolleri (bazı yazıcı/oyun/UPnP)
  çalışmayabilir.
* **Mesh (802.11s):** Yalnızca iki OpenWrt cihazı arasında çalışır, farklı
  marka/cihazla uyumlu değildir.

### Öne Çıkan Özellikler

Temel Ethernet sürücüsü Caleb James Delisle'nin (bkz. Teşekkür), ama aşağıdaki
donanımsal PPE/FOE offload desteği bizim tarafımızdan geliştirildi; bu
yazının yazıldığı tarihte upstream sürücüde yer almıyor.

* **Donanımsal NAT hızlandırma (PPE/FOE offload):** Yönlendirilen trafik
  SoC'nin donanım motoruna yükleniyor, gigabit kablolu hat için CPU
  kullanımını önemli ölçüde düşürüyor.
* **VLAN ayrımı:** Türk Telekom (`eth0.35`) ve Türkcell Superonline
  (`eth0.2`) için ayrı WAN yapılandırması, aynı imaj içinde.
* **Tivibu IPTV VLAN desteği (VID 55):** TT'nin IPTV servisi için ayrı VLAN
  cihazda doğrulandı.
* **NAND flash ve genel kararlılık iyileştirmeleri:** Uzun süreli kullanımda
  gözlenen kararsızlıklar için yapılan düzeltmeler.

**Bilinen sınır:** Wi-Fi üzerinden gelen trafiğin kablolu WAN'a aktarımında
donanımsal hızlandırma (WED) yoktur; bu SoC/sürücü kombinasyonunda
incelendi ve şu an için uygulanabilir bulunmadı. Saf kablolu performans bu
sınırdan etkilenmez.

### Teşekkür

Ethernet sürücüsünün önemli bir kısmı Sayın Caleb James Delisle'ye aittir
(GitHub: [cjdelisle](https://github.com/cjdelisle)). EcoNet için ethernet
projesini başlattığı ve bizi bu çalışmaya cesaretlendirdiği için kendisine
teşekkürü borç biliriz. Bu projeye kattığımız kısımlar ise donanımsal
hızlandırma (hardware offloading), VLAN ayrımı (VLAN split), NAND flash
kararlılığı ve genel kararlılık odaklı geliştirmelerdir.

---

### Disclaimer (English)

This source code is provided "as is", without any warranty or commitment of any kind. The user is solely responsible for any malfunction, data loss, or damage resulting from installing or using this software on their device. Restoring the original stock firmware is also entirely at the user's own risk. No free support is provided.

If you build the software from source and install it on your own device, no warranty is provided for that device. Devices purchased from Hepsiburada are sold by Arı Bilişim İletişim ve Danışmanlık. They are unrelated to any ISP and are covered by the warranty terms of the sale.
Arı Bilişim İletişim ve Danışmanlık is not responsible for any legal issues or contract violations that may arise if you install this source code on a device rented from your Internet Service Provider (ISP).

Users who prefer a ready-to-use, tested device can buy it from Hepsiburada:

* Hepsiburada: https://www.hepsiburada.com/openwrt-yuklu-tp-link-ex20v-ax1800-wifi-6-router-p-HBCV0000HAN6FM?magaza=ARI+B%C4%B0L%C4%B0%C5%9E%C4%B0M+%C4%B0LET%C4%B0%C5%9E%C4%B0M+VE+DANI%C5%9EMANLIK

You can also buy directly from our office, invoiced and under warranty.

For corporate and bulk orders: emreyavuzalp2@gmail.com

### WAN Configuration

The WAN port uses a different VLAN depending on the network infrastructure:

* Türk Telekom and ISPs on Türk Telekom infrastructure: `eth0.35`
* Türkcell Superonline infrastructure: `eth0.2`

This is determined by the device's firmware programming.

### Caution and Limits (English)

This repository contains the GPL-licensed source code and device-specific configuration files.

Installation methods are outside the scope of this repository.

Arı Bilişim İletişim ve Danışmanlık is not responsible for any legal issues or contract violations that may arise if you install this source code on a device rented from your Internet Service Provider (ISP).

The devices we sell are unrelated to any ISP and are warrantied units.

For questions such as "How is it flashed?", we recommend choosing our ready and tested device instead of experimenting on your own.

Users who want to avoid hardware risk can buy plug-and-play, tested and warrantied devices from Hepsiburada.

### Easy Menu

"Easy Menu" (Kolay Menü) is our own custom-built set of simplified pages,
on top of stock LuCI, that ship with the devices we sell. Their purpose is
to reduce settings that normally take several screens and some technical
knowledge down to a single page:

* **Easy Setup:** Gathers the initial setup steps — WAN/protocol selection,
  wireless settings — onto a single page.
* **WireGuard VPN:** Sets up a road-warrior WireGuard server and a client
  QR code in a few clicks; on stock OpenWrt this means manual
  configuration, certificates and client profiles.
* **Guest Wi-Fi:** Turns on a separate guest network in seconds.
* **USB Sharing (SMB + FTP):** Shares a USB drive plugged into the device
  over the network via SMB and FTP.
* **Android/iOS USB Tethering:** When you plug a phone into the USB port
  and enable tethering, the device automatically uses it as a backup
  internet connection. The required drivers and settings are built into
  the image, so no extra configuration is needed.

Here's an example of how one of them, the Wi-Fi extender page, works.

#### Example: Wi-Fi Extender

One of these pages sets the device up as a Wi-Fi extender (repeater) or
mesh node in about 25 seconds. On stock OpenWrt the same result requires
configuring the interface, wireless and network settings separately; this
page reduces all of that to a single screen.

The three methods on the page:

* **WDS (recommended):** The classic bridging method. Supported by many
  carrier modems/routers too, as long as they're not very old, which makes it
  the most broadly compatible and recommended choice.
* **Relayd:** Used when the main device doesn't support WDS (some ISP
  modems). The device connects to the modem as a normal client and extends
  Wi-Fi; since it isn't a real bridge, some device-discovery protocols (some
  printers/games/UPnP) may not work.
* **Mesh (802.11s):** Only works between two OpenWrt devices, not compatible
  with other brands/devices.

### Highlighted Features

The base Ethernet driver is Caleb James Delisle's (see Acknowledgments), but
the hardware PPE/FOE offload support below was developed by us; as of this
writing it is not in the upstream driver.

* **Hardware NAT acceleration (PPE/FOE offload):** Routed traffic is
  offloaded to the SoC's hardware engine, significantly reducing CPU usage
  on gigabit wired links.
* **VLAN separation:** Separate WAN configuration for Türk Telekom
  (`eth0.35`) and Türkcell Superonline (`eth0.2`), in the same image.
* **Tivibu IPTV VLAN support (VID 55):** A separate VLAN for TT's IPTV
  service, verified on hardware.
* **NAND flash and general stability fixes:** Fixes for instabilities
  observed over long-term use.

**Known limitation:** There is no hardware acceleration (WED) for traffic
coming in over Wi-Fi and going out the wired WAN; this was investigated for
this SoC/driver combination and found not currently feasible. Pure wired
throughput is not affected by this limitation.

### Acknowledgments

A significant portion of the Ethernet driver belongs to Mr. Caleb James
Delisle (GitHub: [cjdelisle](https://github.com/cjdelisle)). We owe him our
thanks for starting the Ethernet project for EcoNet and for encouraging us
along the way. Our own contributions to this project are the hardware
offloading, VLAN split, NAND flash stability, and general stability-focused
improvements.
