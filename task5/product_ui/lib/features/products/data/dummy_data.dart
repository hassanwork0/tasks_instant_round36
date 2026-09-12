import 'product.dart';

final List<Product> products = [
  const Product(
    id: 1,
    name: 'سماعة لاسلكية Bluetooth 5.3',
    description: 'سماعة بلوتوث لاسلكية بجودة صوت عالية وعمر بطارية طويل.',
    price: 850,
    oldPrice: 1200,
    image:
        'https://images.unsplash.com/photo-1505118380757-91f5f5632de0?w=800',
    category: 'الكترونيات',
    rating: 4.5,
    reviewsCount: 328,
  ),
  const Product(
    id: 2,
    name: 'ساعة ذكية Smart Watch',
    description: 'ساعة ذكية لمتابعة اللياقة والصحة مع إشعارات فورية.',
    price: 1450,
    oldPrice: 1790,
    image:
        'https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?w=800',
    category: 'الكترونيات',
    rating: 4.2,
    reviewsCount: 156,
  ),
  const Product(
    id: 3,
    name: 'حقيبة ظهر مقاومة للماء',
    description: 'حقيبة ظهر عملية بحجرة مخصصة للابتوب ومقاومة للماء.',
    price: 480,
    image:
        'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=800',
    category: 'اكسسوارات',
    rating: 4.8,
    reviewsCount: 210,
  ),
  const Product(
    id: 4,
    name: 'حذاء رياضي خفيف',
    description: 'حذاء رياضي خفيف ومريح للجري اليومي.',
    price: 620,
    oldPrice: 750,
    image:
        'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
    category: 'أحذية',
    rating: 4.1,
    reviewsCount: 76,
  ),
  const Product(
    id: 5,
    name: 'ماكينة قهوة أوتوماتيك',
    description: 'ماكينة قهوة سريعة بسعة 12 كوب مع مؤقت قابل للبرمجة.',
    price: 999,
    oldPrice: 1250,
    image:
        'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=800',
    category: 'أدوات منزلية',
    rating: 4.4,
    reviewsCount: 152,
  ),
  const Product(
    id: 6,
    name: 'زجاجة مياه ستانلس ستيل',
    description: 'تحافظ على البرودة 24 ساعة وعلى السخونة 12 ساعة.',
    price: 199,
    image:
        'https://images.unsplash.com/photo-1602143407151-7111542de6e8?w=800',
    category: 'أدوات منزلية',
    rating: 4.0,
    reviewsCount: 64,
    isAvailable: false,
  ),
];
