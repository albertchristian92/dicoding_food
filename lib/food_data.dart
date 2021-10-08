import 'package:flutter/material.dart';

import 'model/category.dart';
import 'model/food.dart';

const food_type = const [
  Category(
    id: 'c1',
    title: 'Beverages',
    color: Colors.brown,
  ),
  Category(
    id: 'c2',
    title: 'Snacks',
    color: Colors.red,
  ),
  Category(
    id: 'c3',
    title: 'Sweets',
    color: Colors.orange,
  ),
  Category(
    id: 'c4',
    title: 'Rice',
    color: Colors.green,
  ),
  Category(
    id: 'c5',
    title: 'Chicken and Duck',
    color: Colors.pink,
  )
];

const food_data = const [
  Food(
    id: 'f1',
    categories: [
      'c1',
    ],
    title: 'Xie Xie Boba Semarang Pusponjolo',
    description: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa. Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna.",
    openTime: 'Everyday',
    distance: '2',
    imageUrl:
        'https://1.bp.blogspot.com/-EMMo3KISmGc/X_p3-Pa4miI/AAAAAAAAX1g/8-w9y0gR1wcQoTbSj62untojYXqBhCfDQCLcBGAsYHQ/s1000/XIE%2BXIE%2BBOBA%2BSEMARANG.jpg',
    duration: '15-20',
    menu: [
      'Dalgona Brown Sugar Boba,  - Rp 21.000,-',
      'Dalgona Chocolate,  - Rp 21.000,-',
      'Dalgona Matcha,  - Rp 15.000,-',
      'Boba Dirumahaja,  - Rp 18.000,-',
      'Speculoos Milk Boba Sugar,  - Rp 18.000,-',
    ],
    isHalal: true,
    isGlutenFree: false,
    isVegetarian: false,
  ),
  Food(
    id: 'f2',
    categories: [
      'c1','c2'
    ],
    title: 'sel sel cheese tea',
    description: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa. Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna.",
    openTime: 'Everyday',
    distance: '2',
    imageUrl:
    'https://d1sag4ddilekf6.azureedge.net/compressed/merchants/6-CYNKNNJ1UB62V2/hero/801dfc6069aa45f4a2785c0aabd7258f_1561958012316763555.jpeg',
    duration: '10',
    menu: [
      'Cookies N Cream,  - Rp 20.000,-',
      'Ovaltine tanpa boba,  - Rp 13.750,-',
      'Mermaid Blue Cheese Cream,  - Rp 20.000,-',
      'Joyfull Greentea tanpa boba,  - Rp 13.750,-',
      'Sweet Original Tea,  - Rp 13.750,-',
    ],
    isHalal: true,
    isGlutenFree: false,
    isVegetarian: true,
  ),
  Food(
    id: 'f3',
    categories: [
      'c4','c5'
    ],
    title: 'Warung Mbak Yanti',
    description: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa. Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna.",
    openTime: 'Everyday',
    distance: '2',
    imageUrl:
    'https://d1sag4ddilekf6.azureedge.net/compressed/merchants/6-CY5YCXEKMF6FLX/hero/eea58e617da646588ac7cfd9a48042cd_1577515361813337676.jpg',
    duration: '18',
    menu: [
      'Nasi + Ayam Goreng,  - Rp 12.000,-',
      'Nasi + Lele Goreng,  - Rp 8.000,-',
      'Nasi + Bebek Goreng,  - Rp 20.000,-',
      'Nasi + Telur Goreng,  - Rp 6.750,-',
      'Es teh Manis,  - Rp 2.000,-',
    ],
    isHalal: true,
    isGlutenFree: false,
    isVegetarian: true,
  ),
  Food(
    id: 'f4',
    categories: [
      'c3'
    ],
    title: 'Buah segar Pak Sentot',
    description: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa. Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna.",
    openTime: 'Everyday',
    distance: '0.5',
    imageUrl:
    'https://1.bp.blogspot.com/-3_xT4tLk_NQ/Xv96nl14S9I/AAAAAAAACXE/VMFVUtqB2mo0RbPGdCrjCef02gqDIHgcwCK4BGAsYHg/w640-h480/013%2B-%2BToko%2BBuah%2BJakarta.jpg',
    duration: '7',
    menu: [
      'Mangga 1 kg,  - Rp 15.000,-',
      'Apel 1 kg,  - Rp 9.000,-',
      'Jeruk 1 kg,  - Rp 8.000,-',
      'Bengkoang 1 kg,  - Rp 7.750,-',
      'Pisang 1 sisir,  - Rp 6.000,-',
    ],
    isHalal: true,
    isGlutenFree: true,
    isVegetarian: true,
  ),
];
