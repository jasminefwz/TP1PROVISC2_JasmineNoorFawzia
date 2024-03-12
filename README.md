# TP1PROVISC2

# Manajemen Inventory Barang di Sebuah Toko

## Object-Oriented Programming (OOP)
**1. Kelas Item**
- Kelas ini merepresentasikan sebuah barang di toko dengan properti seperti nama, jumlah, dan harga
- Penggunaan OOP memungkinkan kita untuk mengorganisir dan mengelola data terkait barang dengan lebih terstruktur
- Metode displayInfo() memungkinkan untuk menampilkan informasi tentang barang secara terpusat dan mudah dipanggil dari tempat lain dalam program
- Metode toJson() digunakan untuk mengonversi objek Item ke dalam format JSON

**2. Kelas Inventory**
- Kelas ini bertanggung jawab untuk mengelola inventory barang di toko, termasuk menambahkan, menampilkan, serta menyimpan inventory
- Penggunaan OOP memungkinkan kita untuk memisahkan logika inventory ke dalam kelas tersendiri, yang membuatnya lebih mudah dipelihara dan diperluas di masa depan
- Metode addItem() digunakan untuk menambahkan barang ke inventory
- Metode displayInventory() digunakan untuk menampilkan daftar barang di inventory ke konsol
- Metode saveToFile() digunakan untuk menyimpan inventory ke dalam file JSON secara asynchronous

**3. Kelas StoreService**
- Kelas ini bertindak sebagai layanan untuk memproses pembelian di toko
- Penggunaan OOP memungkinkan kita untuk mengabstraksi logika bisnis terkait pembelian ke dalam kelas terpisah, sehingga memudahkan untuk mengelola logika aplikasi secara keseluruhan
- Properti inventory digunakan untuk menyimpan inventory
- Metode processPurchase() digunakan untuk menambahkan pembelian ke inventory secara asynchronous

**4. Kelas Purchase**
- Kelas ini digunakan untuk merepresentasikan transaksi pembelian di toko
- Penggunaan OOP memungkinkan kita untuk menggabungkan barang yang dibeli dengan jumlahnya dalam sebuah objek transaksi yang khusus

## Asynchronous
- Metode saveToFile() diimplementasikan sebagai metode asynchronous menggunakan kata kunci async dan await yang digunakan untuk menunggu proses penyimpanan ke file selesai sebelum lanjut ke langkah selanjutnya. Ini memungkinkan program untuk melanjutkan menjalankan tugas lain tanpa harus menunggu operasi I/O selesai
- Metode processPurchase() diimplementasikan sebagai metode asynchronous menggunakan kata kunci. Saat melakukan pembelian dan memprosesnya, inventory akan disimpan ke dalam file secara asynchronous setelah pembelian diproses, memastikan bahwa program tetap responsif dan tidak terblokir saat menunggu operasi penyimpanan selesai
