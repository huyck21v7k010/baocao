import '../../models/product.dart';
import 'package:flutter/foundation.dart';

class ProductsManager with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'CPU',
      description: 'CPU INTEL CORE I3-10105F 3.7GHZ 4 NHÂN 8 LUỒNG',
      price: 10.99,
      imageUrl:
          'https://nguyenvu.store/wp-content/uploads/2021/03/58401_cpu_intel_core_i3_10105f_3_7ghz_turbo_up_to_4_4ghz_4_nhan_8_luong_6mb_cache_65w_socket_intel_lga_1200_1-510x510.jpg',
      isFavorite: true,
    ),
    Product(
      id: 'p2',
      title: 'MAINBOARD',
      description: 'MAINBOARD ASUS PRIME H410M-K.',
      price: 19.99,
      imageUrl:
          'https://nguyenvu.store/wp-content/uploads/2020/05/Mainboard-Asus-Prime-H410M-K-1-510x510.jpg',
    ),
    Product(
      id: 'p3',
      title: 'RAM',
      description: 'RAM APACER TEX DDR4 8GB  3200MHZ (AH4U08G32C28YTBAA-1).',
      price: 19.99,
      imageUrl:
          'https://nguyenvu.store/wp-content/uploads/2022/07/ram-apacer-tex-ddr4-8gb-3200mhz-nguyenvu.store-05-510x510.jpg',
    ),
    Product(
      id: 'p4',
      title: 'PSU',
      description: 'NGUỒN COOLER MASTER ELITE V2.',
      price: 9.99,
      imageUrl:
          'https://nguyenvu.store/wp-content/uploads/2020/05/NGUỒN-COOLER-MASTER-ELITE-V2-400w-510x510.jpg',
      isFavorite: true,
    ),
    Product(
      id: 'p5',
      title: 'VGA',
      description: 'CARD MÀN HÌNH ASUS ROG STRIX RTX 3070 8G GAMING.',
      price: 49.99,
      imageUrl:
          'https://nguyenvu.store/wp-content/uploads/2020/09/ROG-STRIX-RTX3070-8G-GAMING-01-510x510.jpg',
      isFavorite: true,
    ),
    Product(
      id: 'p6',
      title: 'SSD',
      description: 'SSD MSI SPATIUM S270 120GB/240GB 2.5 INCH SATA III.',
      price: 9.99,
      imageUrl:
          'https://nguyenvu.store/wp-content/uploads/2022/08/ssd-msi-spatium-s270-120gb-sata-iii-1-510x510.jpg',
      isFavorite: true,
    ),
  ];

  int get itemCount {
    return _items.length;
  }

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((item) => item.isFavorite).toList();
  }

  Product? findById(String id) {
    try {
      return _items.firstWhere((item) => item.id == id);
    } catch (error) {
      return null;
    }
  }
  void addProduct(Product product) {
    _items.add(
      product.copyWith(
        id: 'p${DateTime.now().toIso8601String()}',
      ),
    );
    notifyListeners();
  }
  void updateProduct(Product product) {
    final index = _items.indexWhere((item) => item.id == product.id);
    if (index >= 0) {
      _items[index] = product;
      notifyListeners();
    }
  }
  void toggleFavoriteStatus(Product product) {
    final savedStatus = product.isFavorite;
    product.isFavorite = !savedStatus;
  }
  void deleteProduct(String id) {
    final index = _items.indexWhere((item) => item.id == id);
    _items.remove(index);
    notifyListeners();
  }
}
