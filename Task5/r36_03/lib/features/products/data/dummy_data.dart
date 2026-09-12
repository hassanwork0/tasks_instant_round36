// LocalStorage => SQLite, Hive, SharedPreferences
  // APIs => Dio, http | ( Backend ) PHP, DotNet, NodeJs
  // Backendless => Firebase, Supabase
  // SOLID => Single Respoinbillty Princnble


import 'package:task_5/features/products/data/product.dart';

List<Product> products = [
    Product(
      id: 1,
      name: 'سماعة لاسلكية Bluetooth 5.3',
      description:
          'سماعة أذن لاسلكية بعزل ضوضاء نشط، بطارية تدوم 30 ساعة مع علبة الشحن.',
      price: 850,
      oldPrice: 1200,
      image: 'https://picsum.photos/seed/headphones/400/400',
      category: 'إلكترونيات',
      rating: 4.5,
      reviewsCount: 328,
    ),
    Product(
      id: 2,
      name: 'ساعة ذكية Smart Watch',
      description:
          'شاشة AMOLED مقاس 1.4 بوصة، قياس نبض القلب والأكسجين، مقاومة للماء IP68.',
      price: 1450,
      oldPrice: 1800,
      image: 'https://picsum.photos/seed/watch/400/400',
      category: 'إلكترونيات',
      rating: 4.2,
      reviewsCount: 156,
    ),
    Product(
      id: 3,
      name: 'شاحن سريع 65W GaN',
      description:
          'ثلاث منافذ USB-C و USB-A، يشحن اللابتوب والموبايل في نفس الوقت.',
      price: 620,
      image: 'https://picsum.photos/seed/charger/400/400',
      category: 'إكسسوارات',
      rating: 4.7,
      reviewsCount: 92,
    ),
    Product(
      id: 4,
      name: 'كيبورد ميكانيكي RGB',
      description:
          'مفاتيح Red Switch، إضاءة RGB قابلة للتخصيص، تصميم 87 مفتاح.',
      price: 1100,
      oldPrice: 1350,
      image: 'https://picsum.photos/seed/keyboard/400/400',
      category: 'إكسسوارات',
      rating: 4.4,
      reviewsCount: 210,
    ),
    Product(
      id: 5,
      name: 'ماوس لاسلكي للألعاب',
      description:
          'حساسية 16000 DPI، ستة أزرار قابلة للبرمجة، بطارية 70 ساعة.',
      price: 480,
      image: 'https://picsum.photos/seed/mouse/400/400',
      category: 'إكسسوارات',
      rating: 4.1,
      reviewsCount: 74,
      isAvailable: false,
    ),
    Product(
      id: 6,
      name: 'باور بانك 20000mAh',
      description:
          'شحن سريع PD 22.5W، شاشة رقمية تعرض نسبة البطارية.',
      price: 750,
      oldPrice: 900,
      image: 'https://picsum.photos/seed/powerbank/400/400',
      category: 'إلكترونيات',
      rating: 4.6,
      reviewsCount: 415,
    ),
    Product(
      id: 7,
      name: 'حقيبة لابتوب 15.6 بوصة',
      description:
          'مقاومة للماء، بطانة إسفنجية، جيب خارجي للإكسسوارات.',
      price: 390,
      image: 'https://picsum.photos/seed/bag/400/400',
      category: 'حقائب',
      rating: 4.3,
      reviewsCount: 61,
    ),
    Product(
      id: 8,
      name: 'مكبر صوت Bluetooth محمول',
      description: 'قوة 20 واط، مقاوم للماء IPX7، بطارية 12 ساعة.',
      price: 980,
      oldPrice: 1150,
      image: 'https://picsum.photos/seed/speaker/400/400',
      category: 'إلكترونيات',
      rating: 4.0,
      reviewsCount: 133,
    ),
  ];