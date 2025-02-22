# AngryBirdsKlon
Angry Birds tarzı bir oyun yapmak için Swift ve SpriteKit kullanabilirsiniz. SpriteKit, Apple’ın 2D oyun geliştirme framework’üdür ve fizik motoru içerir, bu yüzden Angry Birds gibi nesnelerin fırlatıldığı ve fizik etkileşimlerinin olduğu oyunlar için çok uygundur.

Adımlar
Xcode'da Yeni SpriteKit Projesi Oluşturun
Xcode’u açın → "Create a new Xcode project" → Game seçin.
Oyun motoru olarak SpriteKit ve dili Swift seçin.
Ana Oyun Sahnesini Oluşturun
Arka planı ayarlayın.
Fırlatılacak bir kuş nesnesi (bird) ve hedef olarak düşmanlar (pigs) ekleyin.
Fizik Motorunu Ayarlayın
SKPhysicsBody kullanarak kuşun, hedeflerin ve engellerin fizik özelliklerini ayarlayın.
Yer çekimi ve çarpışmalar için fizik motorunu etkinleştirin.
Sapan (Slingshot) Mekaniğini Yapın
UITouch kullanarak ekranda sürükleme hareketiyle kuşu geriye çekme ve bırakma işlemini yapın.
SKAction ile kuşa hız kazandırarak fırlatma yapın.
Düşmanlara Hasar Verme ve Yok Olma Mekaniği
Kuş çarptığında düşmanlara hasar vermek için çarpışmaları algılayın.
Belirli bir kuvvet uygulanırsa düşman yok olsun.
Kazanma/Kaybetme Koşullarını Belirleyin
Tüm düşmanlar yok olunca kazanın.
Kuşları bitirince kaybedin.
