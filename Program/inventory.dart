//Jasmine Noor Fawzia [2200598] [Ilmu Komputer C2] TP 1 Provis

import 'dart:convert';

//kelas untuk merepresentasikan sebuah barang
class Item{
    final String name;
    int quantity;
    double price;

    Item(this.name, this.quantity, this.price);

    //metode untuk menampilkan informasi tentang barang
    void displayInfo(){
        print('Item        : $name');
        print('Quantity : $quantity');
        print('Price       : \$${price.toStringAsFixed(2)}');
        print('');
    }

    //metode untuk mengonversi barang ke dalam format JSON
    Map<String, dynamic> toJson() => {
        'name': name,
        'quantity': quantity,
        'price': price,
    };
}

//kelas untuk merepresentasikan daftar barang di toko
class Inventory{
    List<Item> items = [];

    //metode untuk menambahkan barang ke inventory
    void addItem(Item item){
        items.add(item);
        print('Item ${item.name} added to inventory.');
    }

    //metode untuk menampilkan daftar barang di inventory
    void displayInventory(){
        if(items.isEmpty){
            print('Inventory is empty.');
        } 
        else{
            int i = 1;
            for(var item in items){
                print('Item number $i');
                item.displayInfo();
                i++;
            }
        }
    }

    //metode untuk menyimpan inventory ke dalam file secara synchronous
    Future<void> saveToFile(String filePath) async {
        final jsonData = items.map((item) => item.toJson()).toList();
        final jsonString = jsonEncode(jsonData);
        //simulasi penulisan ke file dengan delay
        await Future.delayed(Duration(seconds: 1));
        print('Inventory saved to file: $jsonString');
    }
}

//kelas untuk merepresentasikan layanan pembelian di toko
class StoreService{
    Inventory inventory;
    StoreService(this.inventory);

    //metode untuk menambahkan pembelian ke inventory secara asynchronous
    Future<void> processPurchase(Purchase purchase) async {
        var existingItem = inventory.items.firstWhere((item) => item.name == purchase.item.name, orElse: () => Item('', 0, 0));
        if(existingItem.name.isNotEmpty){
            existingItem.quantity += purchase.quantity;
        } 
        else{
            inventory.addItem(Item(purchase.item.name, purchase.quantity, purchase.item.price));
        }

        print('');
        print('Storing inventory after the purchasing process');
        await inventory.saveToFile('inventory.json'); //menyimpan inventaris setelah pembelian
        print('');
        print('Purchase processed successfully!');
    }
}

//kelas untuk merepresentasikan transaksi pembelian
class Purchase{
    final Item item;
    final int quantity;

    Purchase(this.item, this.quantity);
}

void main() async {
    //membuat instance inventaris toko
    var inventory = Inventory();

    //menambahkan beberapa barang ke inventaris (nilai statis)
    inventory.addItem(Item('Smartphone', 10, 359.99));
    inventory.addItem(Item('Laptop', 5, 1099.99));
    inventory.addItem(Item('Camera', 25, 75.99));

    //menampilkan inventaris sebelum pembelian
    print('');
    print('Inventory before purchase:');
    inventory.displayInventory();

    //menampilkan detail pembelian
    print('Purchase:');
    var purchase = Purchase(Item('Smartphone', 0, 0), 5);
    print('Item        : ${purchase.item.name}');
    print('Quantity : ${purchase.quantity}');
    print('');
    
    var purchase2 = Purchase(Item('Camera', 0, 0), 3);
    print('Item        : ${purchase2.item.name}');
    print('Quantity : ${purchase2.quantity}');
    print('');

    //membuat instance layanan toko
    var storeService = StoreService(inventory);

    //melakukan pembelian dan memprosesnya secara asynchronous
    print('Processing purchases...');
    await storeService.processPurchase(purchase);
    await storeService.processPurchase(purchase2);
    
    print('');
    print('${purchase.quantity} Item ${purchase.item.name} added to inventory.');
    print('${purchase2.quantity} Item ${purchase2.item.name} added to inventory.');
    
    print('');
    //menampilkan inventaris setelah pembelian
    print('Inventory after purchase:');
    inventory.displayInventory();
}