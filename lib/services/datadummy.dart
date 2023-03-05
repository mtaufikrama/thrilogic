import 'package:thrilogic_shop/API/object_class/category.dart';
import 'package:thrilogic_shop/API/object_class/keranjang.dart';

final GetKeranjang getKeranjangDummy = GetKeranjang.fromJson({
  "code": "00",
  "info": "Keranjang Berhasil Diambil",
  "data": [
    {
      "id": 163,
      "user_id": 6,
      "product_id": 3,
      "qty": 2,
      "created_at": "2023-02-21T16:38:57.000000Z",
      "updated_at": "2023-02-21T16:38:57.000000Z",
      "product": {
        "id": 3,
        "name": "VURRION MOTHERBOARD DURAVEL H61M-SV2 / MAIN-VR04",
        "category_id": 3,
        "image":
            "https://aki.nurulfikri.com/storage/product//3mFFh6CjdvLQYBpejfMMUkrgzQYbDW91ZKVJ8f3V.jpg",
        "image_path":
            "public/product//3mFFh6CjdvLQYBpejfMMUkrgzQYbDW91ZKVJ8f3V.jpg",
        "harga": 570000,
        "deskripsi":
            "GARANSI RESMI 2 TAHUN\n\n>MOBO HOSE H61 INTEL LGA 1155 <\n> Specifications and possibilities <\nSPESIFIKASI\nSupport :\nHdd : • Dimm sockets : 2* DDR3\n• Supported Memory : support DDR3 1066/1333/1600MHz\nVga : • Onboard VGA : VGA and Lan integrated on board\nFitur : • Audio : HD sound channel , 6 sound channel output\n• LAN : on board 1000/100M lan chip\n• USB : 8* USB 2.0 ( 4 usb onboard and 4 need to be extended)\n• Special Features : support Hyper- Threading\nKeterangan : integrated in one chipset , and called H61chipset.\n• Max. Memory : 8GB\n• Expansion slots : 1*PCIE 16X, 2*PCIE 1X\n• Serial ATA Controller : 4*SATA",
        "stock": 11,
        "created_at": "2022-12-26 04:12:34",
        "updated_at": "2023-02-21 16:02:57",
        "deleted_at": null
      }
    }
  ]
});

final List<DataGetKategoriById> getDataKategorybyIdDummy = [
  DataGetKategoriById.fromJson(
    {
      "id": 5,
      "name": "Kemeja Wanita",
      "created_at": "2022-12-26T11:26:47.000000Z",
      "updated_at": "2022-12-26T11:26:47.000000Z",
      "deleted_at": null,
      "products": [
        {
          "id": 20,
          "name": "Kemeja Berkerut",
          "category_id": 5,
          "image":
              "https://aki.nurulfikri.com/storage/product//j5i8YYGRhIFvrJRflJrp6t5MfkeWScBxUkxSfZJJ.png",
          "image_path":
              "public/product//j5i8YYGRhIFvrJRflJrp6t5MfkeWScBxUkxSfZJJ.png",
          "harga": 120000,
          "deskripsi":
              "Kemeja dari tenunan berkerut dengan kerah, kancing di bagian depan, dan pas bahu lapis ganda dengan lipitan di belakang. Saku dada terbuka, bahu menurun lembut, dan lengan panjang dengan manset berkancing. Kelim membulat.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 55 cm\nPanjang Lengan\t: 44 cm\nBahan\t\t: Viskose\nGaya\t\t: Kerah resort\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 11:12:26",
          "updated_at": "2022-12-26 11:12:26",
          "deleted_at": null
        },
        {
          "id": 21,
          "name": "Cotton Shirt",
          "category_id": 5,
          "image":
              "https://aki.nurulfikri.com/storage/product//Q41TGKk8lMxdXw0uqrrHBelhKZMoJqwGS9sCkH9F.png",
          "image_path":
              "public/product//Q41TGKk8lMxdXw0uqrrHBelhKZMoJqwGS9sCkH9F.png",
          "harga": 100000,
          "deskripsi":
              "Kemeja oversized dalam tenunan katun dengan kerah, kancing di bagian depan dan kuk berlapis ganda dengan lipit di bagian belakang. Bahu turun, lengan panjang dengan manset berkancing, saku dada terbuka, dan keliman bundar.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 55 cm\nPanjang Lengan\t: 44 cm\nBahan\t\t: Viskose\nGaya\t\t: Kerah resort\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 11:12:44",
          "updated_at": "2022-12-26 11:12:44",
          "deleted_at": null
        },
        {
          "id": 22,
          "name": "Kemeja Resor Tebal",
          "category_id": 5,
          "image":
              "https://aki.nurulfikri.com/storage/product//hZTryHvsFjp7Hx19oJGR7qvB5V6SgiBJo02i67HK.png",
          "image_path":
              "public/product//hZTryHvsFjp7Hx19oJGR7qvB5V6SgiBJo02i67HK.png",
          "harga": 110000,
          "deskripsi":
              "Kemeja tebal dengan tenunan viscose yang tersampir lembut dengan sedikit kemilau. Kerah resor, kerah V, dan saku dada. Kancing deret di depan, yoke di belakang, bahu turun, dan lengan sepanjang siku.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 45 cm\nPanjang Lengan\t: 38 cm\nBahan\t\t: Viskose\nGaya\t\t: Vneck, Kerah resort\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 11:12:44",
          "updated_at": "2022-12-26 11:12:44",
          "deleted_at": null
        },
        {
          "id": 23,
          "name": "Oversized Linen Shirt BLACK",
          "category_id": 5,
          "image":
              "https://aki.nurulfikri.com/storage/product//0UOiqreGTvV2kESdD8azIS2MHDHF4qr0XganB2Ih.png",
          "image_path":
              "public/product//0UOiqreGTvV2kESdD8azIS2MHDHF4qr0XganB2Ih.png",
          "harga": 130000,
          "deskripsi":
              "Kemeja oversized dalam tenunan katun dengan kerah, kancing di bagian depan dan kuk berlapis ganda dengan lipit di bagian belakang. Bahu turun, lengan panjang dengan manset berkancing, saku dada terbuka, dan keliman bundar.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 55 cm\nPanjang Lengan\t: 44 cm\nBahan\t\t: Viskose\nGaya\t\t: Long Shirt \nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 9,
          "created_at": "2022-12-26 11:12:49",
          "updated_at": "2023-01-08 17:01:55",
          "deleted_at": null
        },
        {
          "id": 24,
          "name": "Oversized Linen Shirt",
          "category_id": 5,
          "image":
              "https://aki.nurulfikri.com/storage/product//HSAzTRNVAd4ywSe0Q9G4Ne57KLeQG1kOLTmFXqzp.png",
          "image_path":
              "public/product//HSAzTRNVAd4ywSe0Q9G4Ne57KLeQG1kOLTmFXqzp.png",
          "harga": 130000,
          "deskripsi":
              "Kemeja oversized dalam tenunan katun dengan kerah, kancing di bagian depan dan kuk berlapis ganda dengan lipit di bagian belakang. Bahu turun, lengan panjang dengan manset berkancing, saku dada terbuka, dan keliman bundar.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 55 cm\nPanjang Lengan\t: 44 cm\nBahan\t\t: Chambray\nGaya\t\t: Long Shirt\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 11:12:44",
          "updated_at": "2022-12-26 11:12:44",
          "deleted_at": null
        },
        {
          "id": 25,
          "name": "Oversized Cotton Shirt CREAM",
          "category_id": 5,
          "image":
              "https://aki.nurulfikri.com/storage/product//iIJPbxGwTfmQIIJLDXZKWOTOWPLO5aTDw33RYz6u.png",
          "image_path":
              "public/product//iIJPbxGwTfmQIIJLDXZKWOTOWPLO5aTDw33RYz6u.png",
          "harga": 130000,
          "deskripsi":
              "Kemeja tebal dengan tenunan viscose yang tersampir lembut dengan sedikit kemilau. Kerah resor, kerah V, dan saku dada. Kancing deret di depan, yoke di belakang, bahu turun, dan lengan sepanjang siku.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 65 cm\nPanjang Lengan\t: 48 cm\nBahan\t\t: Drill\nGaya\t\t: Turn-down collar\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 11:12:30",
          "updated_at": "2022-12-26 11:12:30",
          "deleted_at": null
        },
        {
          "id": 26,
          "name": "Oversized Cotton Shirt WHITE STRIPED",
          "category_id": 5,
          "image":
              "https://aki.nurulfikri.com/storage/product//LVjYbC7CcYmLASok3CvBgTILl3Wz0HvSKTn0eMCI.png",
          "image_path":
              "public/product//LVjYbC7CcYmLASok3CvBgTILl3Wz0HvSKTn0eMCI.png",
          "harga": 150000,
          "deskripsi":
              "Kemeja panjang oversized berbahan linen lapang dengan kerah, berkancing di bagian depan, dan kuk berlapis ganda dengan lipit di bagian belakang. Saku dada besar, bahu turun, lengan panjang dengan manset berkancing, dan keliman bundar. Sedikit lebih panjang di belakang.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 65 cm\nPanjang Lengan\t: 48 cm\nBahan\t\t: Drill\nGaya\t\t: Turn-down collar\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 11:12:23",
          "updated_at": "2022-12-26 11:12:23",
          "deleted_at": null
        },
        {
          "id": 27,
          "name": "Shirt Dress CREAM",
          "category_id": 5,
          "image":
              "https://aki.nurulfikri.com/storage/product//FTZxcvoui9awmIjwtLfIpP6mS6gvrdo9J9aNSsyg.png",
          "image_path":
              "public/product//FTZxcvoui9awmIjwtLfIpP6mS6gvrdo9J9aNSsyg.png",
          "harga": 110000,
          "deskripsi":
              "CONSCIOUS CHOICE Dress kemeja 3/4 dari tenunan viscose dengan kerah, plaket kancing di bagian depan dan pas bahu di bagian belakang. Lengan panjang yang tampak penuh dengan manset berkancing, dan saku samping. Tanpa furing.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 55 cm\nPanjang Lengan\t: 44 cm\nBahan\t\t: Viscose\nGaya\t\t: Shirt collar, Shirt dress\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 11:12:32",
          "updated_at": "2022-12-26 11:12:32",
          "deleted_at": null
        },
        {
          "id": 28,
          "name": "Crinkled Cotton Shirt",
          "category_id": 5,
          "image":
              "https://aki.nurulfikri.com/storage/product//Vxi7VKceklrDYg8sRnS6hPzwNPMQRT1MZBUMpsJZ.png",
          "image_path":
              "public/product//Vxi7VKceklrDYg8sRnS6hPzwNPMQRT1MZBUMpsJZ.png",
          "harga": 220000,
          "deskripsi":
              "Kemeja dalam tenunan katun berkerut dengan kerah runcing dan kancing di bagian depan. Pas santai dengan kuk berlapis ganda di bagian belakang dan jahitan bahu diposisikan sedikit ke depan. Lengan panjang dengan manset berkancing, dan keliman bulat. Sedikit lebih panjang di belakang.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 75 cm\nPanjang Lengan\t: 48 cm\nBahan\t\t: Viscose\nGaya\t\t: Shirt collar, Shirt dress\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 8,
          "created_at": "2022-12-26 11:12:46",
          "updated_at": "2023-01-08 17:01:36",
          "deleted_at": null
        }
      ]
    },
  ),
  DataGetKategoriById.fromJson(
    {
      "id": 6,
      "name": "Blouse Wanita",
      "created_at": "2022-12-26T11:27:03.000000Z",
      "updated_at": "2022-12-26T11:27:03.000000Z",
      "deleted_at": null,
      "products": [
        {
          "id": 29,
          "name": "Draped Blouse GREEN",
          "category_id": 6,
          "image":
              "https://aki.nurulfikri.com/storage/product//pnlf4J8gWbOM3cKZkwGTqJivhspPJKWt9SyrQ2vr.png",
          "image_path":
              "public/product//pnlf4J8gWbOM3cKZkwGTqJivhspPJKWt9SyrQ2vr.png",
          "harga": 110000,
          "deskripsi":
              "CONSCIOUS CHOICE Blus dari kain tenun dengan sedikit kilau. Kerah stand-up dengan draping di salah satu sisi depan untuk menciptakan efek mengalir. Pembukaan lubang kunci dengan tombol tersembunyi di bagian belakang leher. Lengan panjang dengan belahan di ujung lengan, dan keliman berpotongan lurus.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 75 cm\nPanjang Lengan\t: 48 cm\nBahan\t\t: Thaisilk\nGaya\t\t: Stand-up collar\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 11:12:26",
          "updated_at": "2022-12-26 11:12:26",
          "deleted_at": null
        },
        {
          "id": 30,
          "name": "Draped Blouse BLACK",
          "category_id": 6,
          "image":
              "https://aki.nurulfikri.com/storage/product//i6HSnEBDpvTQ1Tp4ngzjAg0P3pAxWEzJR9jYzwT9.png",
          "image_path":
              "public/product//i6HSnEBDpvTQ1Tp4ngzjAg0P3pAxWEzJR9jYzwT9.png",
          "harga": 120000,
          "deskripsi":
              "CONSCIOUS CHOICE Blus dari kain tenun dengan sedikit kilau. Kerah dengan bukaan berbentuk V dan kancing di bagian depan. Bahu jatuh, lengan panjang dengan manset lebar, dan lipit di pinggang yang menciptakan efek terbungkus.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 75 cm\nPanjang Lengan\t: 48 cm\nBahan\t\t: Thaisilk\nGaya\t\t: Draped\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 9,
          "created_at": "2022-12-26 11:12:07",
          "updated_at": "2022-12-26 11:12:31",
          "deleted_at": null
        },
        {
          "id": 31,
          "name": "Stand-up Collar Satin Blouse",
          "category_id": 6,
          "image":
              "https://aki.nurulfikri.com/storage/product//fhYuAF0ckIFhjdmt52EdtYDI7He5d2cVK6yhAAof.png",
          "image_path":
              "public/product//fhYuAF0ckIFhjdmt52EdtYDI7He5d2cVK6yhAAof.png",
          "harga": 140000,
          "deskripsi":
              "Blus berpotongan lurus dengan kain satin bermotif lembut dengan kerah berdiri yang memiliki bukaan kecil dengan kancing tertutup di bagian belakang. Lengan balon panjang, manset dengan kancing tertutup, dan keliman bulat.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 75 cm\nPanjang Lengan\t: 48 cm\nBahan\t\t: Chiffon\nGaya\t\t: Balloon sleeve\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 11:12:49",
          "updated_at": "2022-12-26 11:12:49",
          "deleted_at": null
        },
        {
          "id": 32,
          "name": "Draped Blouse FLORAL",
          "category_id": 6,
          "image":
              "https://aki.nurulfikri.com/storage/product//1HWQKWsXtNlgBtgPUoFjbWF1Vpo2InOJn7EKP90y.png",
          "image_path":
              "public/product//1HWQKWsXtNlgBtgPUoFjbWF1Vpo2InOJn7EKP90y.png",
          "harga": 130000,
          "deskripsi":
              "Blus pas di kain tenun. V-neck dalam dengan tali serut dekoratif di bagian depan dan menyatu di samping untuk efek terbungkus lembut. Lengan panjang dan tebal dengan elastisitas sempit di ujung lengan, smocking lebar di bagian belakang, jahitan sempit elastis di pinggang, dan peplum melebar.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 75 cm\nPanjang Lengan\t: 48 cm\nBahan\t\t: Chiffon\nGaya\t\t: Deep neckline\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 11:12:32",
          "updated_at": "2022-12-26 11:12:32",
          "deleted_at": null
        },
        {
          "id": 33,
          "name": "Draped Blouse BLACK",
          "category_id": 6,
          "image":
              "https://aki.nurulfikri.com/storage/product//wZRzciON6mHKueZTn6ksBJPO5B1TrVob6NwEN7AF.png",
          "image_path":
              "public/product//wZRzciON6mHKueZTn6ksBJPO5B1TrVob6NwEN7AF.png",
          "harga": 150000,
          "deskripsi":
              "Blus pendek pas di kepar dengan garis leher persegi dan bukaan kecil di bagian depan dengan tali sempit yang mengikat di bagian belakang leher. Jahitan yang terkumpul di bagian samping untuk efek terbungkus. Lengan panjang dengan elastisitas sempit di ujung lengan. Ritsleting di satu sisi. Tidak bergaris.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 75 cm\nPanjang Lengan\t: 48 cm\nBahan\t\t: Chiffon\nGaya\t\t: Square neckline\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 11:12:58",
          "updated_at": "2022-12-26 11:12:58",
          "deleted_at": null
        },
        {
          "id": 34,
          "name": "Draped Blouse RED",
          "category_id": 6,
          "image":
              "https://aki.nurulfikri.com/storage/product//3qvsbo0Tut6jmw6R7gsj9xc4wKzAPbfGEuGJ8KS3.png",
          "image_path":
              "public/product//3qvsbo0Tut6jmw6R7gsj9xc4wKzAPbfGEuGJ8KS3.png",
          "harga": 130000,
          "deskripsi":
              "Blus pendek pas di kepar dengan garis leher persegi dan bukaan kecil di bagian depan dengan tali sempit yang mengikat di bagian belakang leher. Jahitan yang terkumpul di bagian samping untuk efek terbungkus. Lengan panjang dengan elastisitas sempit di ujung lengan. Ritsleting di satu sisi. Tidak bergaris.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 68 cm\nPanjang Lengan\t: 35 cm\nBahan\t\t: Chiffon\nGaya\t\t: Puff sleeve\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mapinguaries warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 11:12:18",
          "updated_at": "2022-12-26 11:12:18",
          "deleted_at": null
        },
        {
          "id": 35,
          "name": "Crinkle Tie Detail Blouse",
          "category_id": 6,
          "image":
              "https://aki.nurulfikri.com/storage/product//KvrwVWb4PQqePKNCu0xyoKBWefVYsEcBUgxkvmef.png",
          "image_path":
              "public/product//KvrwVWb4PQqePKNCu0xyoKBWefVYsEcBUgxkvmef.png",
          "harga": 130000,
          "deskripsi":
              "Blus dari tenunan berkerut dengan kerah runcing dan V-neck rendah. Tali sempit dan kancing kait tersembunyi di bagian depan. Lengan panjang bermanset lebar dengan belahan dan tali sempit. Tanpa furing.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 75 cm\nPanjang Lengan\t: 48 cm\nBahan\t\t: Chiffon\nGaya\t\t: Square neckline\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:46",
          "updated_at": "2022-12-26 12:12:46",
          "deleted_at": null
        },
        {
          "id": 37,
          "name": "Trimmed Chiffon Blouse",
          "category_id": 6,
          "image":
              "https://aki.nurulfikri.com/storage/product//FOgKonXzVYZUK5FGrfYMg3E72Wam6XE0cjfIPAuN.png",
          "image_path":
              "public/product//FOgKonXzVYZUK5FGrfYMg3E72Wam6XE0cjfIPAuN.png",
          "harga": 130000,
          "deskripsi":
              "Blus dengan bahan chiffon airy dengan trim bergelombang di sekitar garis leher, depan, belakang, dan lengan. Bukaan dalam berbentuk V di bagian depan yang disatukan oleh jahitan kecil di bagian tengah. Tali serut di sekitar garis leher dan di bagian bawah bukaan berbentuk V. Kerutan dekoratif di sepanjang gelombang di bagian belakang untuk menambah lebar.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 75 cm\nPanjang Lengan\t: 48 cm\nBahan\t\t: Polyester\nGaya\t\t: Garis leher dalam\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:33",
          "updated_at": "2022-12-26 12:12:33",
          "deleted_at": null
        }
      ]
    },
  ),
  DataGetKategoriById.fromJson(
    {
      "id": 8,
      "name": "Cropped Top Wanita",
      "created_at": "2022-12-26T11:27:31.000000Z",
      "updated_at": "2022-12-26T11:27:31.000000Z",
      "deleted_at": null,
      "products": [
        {
          "id": 48,
          "name": "Printed Cropped Top DARK GREY",
          "category_id": 8,
          "image":
              "https://aki.nurulfikri.com/storage/product//abkphgyBqvviP17GSohL97C1z5Rz6n536Wp0gL35.png",
          "image_path":
              "public/product//abkphgyBqvviP17GSohL97C1z5Rz6n536Wp0gL35.png",
          "harga": 130000,
          "deskripsi":
              "Crop top berbahan kaos katun lembut dengan motif print. Garis leher berusuk dan lengan pendek.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 60 cm\nPanjang Lengan\t: 35 cm\nBahan\t\t: Katun \nGaya\t\t: Crop top\nKonsep\t\t: Divided\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:04",
          "updated_at": "2022-12-26 12:12:04",
          "deleted_at": null
        },
        {
          "id": 49,
          "name": "Button-front Cropped Top",
          "category_id": 8,
          "image":
              "https://aki.nurulfikri.com/storage/product//SvPUW5zZLNtN0HxwcyILPlnfva3NpoXEv5CXcQWW.png",
          "image_path":
              "public/product//SvPUW5zZLNtN0HxwcyILPlnfva3NpoXEv5CXcQWW.png",
          "harga": 130000,
          "deskripsi":
              "Atasan cropped pas badan dengan kaos katun lembut dengan leher V dalam, kancing di bagian depan, lengan pendek dengan pinggiran overlock dan hem overlock.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 60 cm\nPanjang Lengan\t: 35 cm\nBahan\t\t: Katun \nGaya\t\t: Crop top\nKonsep\t\t: Divided\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:42",
          "updated_at": "2022-12-26 12:12:42",
          "deleted_at": null
        },
        {
          "id": 50,
          "name": "Collared Cropped Top",
          "category_id": 8,
          "image":
              "https://aki.nurulfikri.com/storage/product//41C1V3KQCValtxb07hSZLa9A8Gegst4lBOGb4s9v.png",
          "image_path":
              "public/product//41C1V3KQCValtxb07hSZLa9A8Gegst4lBOGb4s9v.png",
          "harga": 130000,
          "deskripsi":
              "Atasan cropped pas badan dengan kaos katun lembut dengan leher V dalam, kancing di bagian depan, lengan pendek dengan pinggiran overlock dan hem overlock.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 60 cm\nPanjang Lengan\t: 35 cm\nBahan\t\t: Katun \nGaya\t\t: Turn-down collar\nKonsep\t\t: Divided\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 8,
          "created_at": "2022-12-26 12:12:13",
          "updated_at": "2023-01-08 17:01:17",
          "deleted_at": null
        },
        {
          "id": 52,
          "name": "Cropped Sports Top",
          "category_id": 8,
          "image":
              "https://aki.nurulfikri.com/storage/product//IFH6rvzoQ7bvYMZw9hw12Lf3t7zjiatJ0Ro02PCp.png",
          "image_path":
              "public/product//IFH6rvzoQ7bvYMZw9hw12Lf3t7zjiatJ0Ro02PCp.png",
          "harga": 130000,
          "deskripsi":
              "Atasan dengan potongan kain fungsional cepat kering yang dirancang untuk membantu Anda tetap kering dan sejuk saat berolahraga. Garis leher bulat, bahu turun, lengan pendek, dan elastisitas tersembunyi di ujungnya.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 60 cm\nPanjang Lengan\t: 35 cm\nBahan\t\t: Katun \nGaya\t\t: Turn-down collar\nKonsep\t\t: Divided\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:51",
          "updated_at": "2022-12-26 12:12:51",
          "deleted_at": null
        },
        {
          "id": 54,
          "name": "Airy Tie-hem Top",
          "category_id": 8,
          "image":
              "https://aki.nurulfikri.com/storage/product//RZfuYNFxZJnk85qIOFmPl6MCGo10imUACysoQOfn.png",
          "image_path":
              "public/product//RZfuYNFxZJnk85qIOFmPl6MCGo10imUACysoQOfn.png",
          "harga": 130000,
          "deskripsi":
              "Atasan cropped pas badan dengan kaos katun lembut dengan leher V dalam, kancing di bagian depan, lengan pendek dengan pinggiran overlock dan hem overlock.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 60 cm\nPanjang Lengan\t: 35 cm\nBahan\t\t: Katun \nGaya\t\t: Trumpet sleeve\nKonsep\t\t: Divided\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:29",
          "updated_at": "2022-12-29 13:12:05",
          "deleted_at": null
        }
      ]
    },
  ),
  DataGetKategoriById.fromJson(
    {
      "id": 9,
      "name": "Kaos Wanita",
      "created_at": "2022-12-26T11:27:39.000000Z",
      "updated_at": "2022-12-26T11:27:39.000000Z",
      "deleted_at": null,
      "products": [
        {
          "id": 56,
          "name": "Viscose T-shirt",
          "category_id": 9,
          "image":
              "https://aki.nurulfikri.com/storage/product//McX1Q8Tc7rFZSbLoKQGOdrjcuZAP36qAgsdrXMxB.png",
          "image_path":
              "public/product//McX1Q8Tc7rFZSbLoKQGOdrjcuZAP36qAgsdrXMxB.png",
          "harga": 85000,
          "deskripsi":
              "T-shirt V-neck berbahan jersey viscose lembut dengan keliman membulat.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 73 cm\nPanjang Lengan\t: 39 cm\nBahan\t\t: Viscose\nGaya\t\t: T-Shirt\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 9,
          "created_at": "2022-12-26 12:12:36",
          "updated_at": "2022-12-27 01:12:44",
          "deleted_at": null
        },
        {
          "id": 57,
          "name": "Low-necked T-shirt",
          "category_id": 9,
          "image":
              "https://aki.nurulfikri.com/storage/product//5IkIvNsA1puW3wlSO9j5DrI4dVxOCihSSEWIwU5K.png",
          "image_path":
              "public/product//5IkIvNsA1puW3wlSO9j5DrI4dVxOCihSSEWIwU5K.png",
          "harga": 85000,
          "deskripsi":
              "T-shirt berbahan jersey viscose yang lembut dengan garis leher yang dalam di bagian tersebut\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 73 cm\nPanjang Lengan\t: 39 cm\nBahan\t\t: Viscose\nGaya\t\t: T-Shirt\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:13",
          "updated_at": "2022-12-26 12:12:13",
          "deleted_at": null
        },
        {
          "id": 59,
          "name": "Print-motif T-shirt",
          "category_id": 9,
          "image":
              "https://aki.nurulfikri.com/storage/product//Il6yvtqIGJAaFlVnYZkL0VqRp2uwTOIwPpN3a3yn.png",
          "image_path":
              "public/product//Il6yvtqIGJAaFlVnYZkL0VqRp2uwTOIwPpN3a3yn.png",
          "harga": 85000,
          "deskripsi":
              "T-shirt santai berbahan jersey katun dengan motif print dan garis leher bulat bergaris.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 73 cm\nPanjang Lengan\t: 39 cm\nBahan\t\t: Katun \nGaya\t\t: Round neck \nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:34",
          "updated_at": "2022-12-26 12:12:34",
          "deleted_at": null
        },
        {
          "id": 61,
          "name": "Printed T-shirt WHITE",
          "category_id": 9,
          "image":
              "https://aki.nurulfikri.com/storage/product//J4LnO4br2s1p7oF4raKSuIb1CRns0TtGfBiWKc6y.png",
          "image_path":
              "public/product//J4LnO4br2s1p7oF4raKSuIb1CRns0TtGfBiWKc6y.png",
          "harga": 85000,
          "deskripsi":
              "Kaus pas badan dari jersey katun lembut dengan motif gambar di bagian depan.\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 73 cm\nPanjang Lengan\t: 39 cm\nBahan\t\t: Katun \nGaya\t\t: Round neck\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 8,
          "created_at": "2022-12-26 12:12:13",
          "updated_at": "2023-02-21 16:02:31",
          "deleted_at": null
        },
        {
          "id": 63,
          "name": "Linen T-shirt",
          "category_id": 9,
          "image":
              "https://aki.nurulfikri.com/storage/product//yttF6s8538LeSCijzGFyNzvZ9CRo1dT6Oh2oelCK.png",
          "image_path":
              "public/product//yttF6s8538LeSCijzGFyNzvZ9CRo1dT6Oh2oelCK.png",
          "harga": 85000,
          "deskripsi":
              "T-shirt berpotongan lurus dengan kaos linen lapang dengan leher V dalam dan bahu turun.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 73 cm\nPanjang Lengan\t: 39 cm\nBahan\t\t: Polyester\nGaya\t\t: T-Shirt\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:53",
          "updated_at": "2022-12-26 12:12:53",
          "deleted_at": null
        }
      ]
    },
  ),
  DataGetKategoriById.fromJson(
    {
      "id": 10,
      "name": "Hoodie Wanita",
      "created_at": "2022-12-26T11:27:46.000000Z",
      "updated_at": "2022-12-26T11:27:46.000000Z",
      "deleted_at": null,
      "products": [
        {
          "id": 64,
          "name": "Cropped Hoodie",
          "category_id": 10,
          "image":
              "https://aki.nurulfikri.com/storage/product//hpvdtlery9bw4dJlv7rn7TD8wZvAkoG3kcwF04Vj.png",
          "image_path":
              "public/product//hpvdtlery9bw4dJlv7rn7TD8wZvAkoG3kcwF04Vj.png",
          "harga": 165000,
          "deskripsi":
              "Cropped hoodie lengan panjang dari kain sweatshirt dengan corak di bagian depan, tudung bertali serut serta rib di bagian manset dan keliman. Permukaan berbulu lembut di bagian dalam.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 60 cm\nPanjang Lengan\t: 39 cm\nBahan\t\t: Polyester 38%, Katun 62%\nGaya\t\t: Hoodie\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:04",
          "updated_at": "2022-12-26 12:12:04",
          "deleted_at": null
        },
        {
          "id": 66,
          "name": "Motif Front Hoodie",
          "category_id": 10,
          "image":
              "https://aki.nurulfikri.com/storage/product//RnofgigaAI7kWgAeGLCtxD8mRFk58JkGowDHuSbp.png",
          "image_path":
              "public/product//RnofgigaAI7kWgAeGLCtxD8mRFk58JkGowDHuSbp.png",
          "harga": 165000,
          "deskripsi":
              "Hoodie lengan panjang dari kain sweatshirt dengan corak di bagian depan, tudung bertali serut serta rib di bagian manset dan keliman. Permukaan berbulu lembut di bagian dalam.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 83 cm\nPanjang Lengan\t: 39 cm\nBahan\t\t: Katun 60%, Poliester 40%\nGaya\t\t: Hoodie\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:46",
          "updated_at": "2022-12-26 12:12:46",
          "deleted_at": null
        },
        {
          "id": 68,
          "name": "Motif-detail Hoodie",
          "category_id": 10,
          "image":
              "https://aki.nurulfikri.com/storage/product//ad7z9iRJuH2zBeWtiZA2jjF93jVfllBab23H5xyP.png",
          "image_path":
              "public/product//ad7z9iRJuH2zBeWtiZA2jjF93jVfllBab23H5xyP.png",
          "harga": 165000,
          "deskripsi":
              "Hoodie dalam bahan sweatshirt terbuat dari campuran katun dengan motif di bagian depan dan brushed lembut di bagian dalam. Tudung serut berlapis ganda, saku kangguru, bahu jatuh, lengan panjang, dan ribbing di bagian manset dan keliman.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 83 cm\nPanjang Lengan\t: 39 cm\nBahan\t\t: Polyester 38%, Katun 62%\nGaya\t\t: Hoodie\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:31",
          "updated_at": "2022-12-26 12:12:31",
          "deleted_at": null
        },
        {
          "id": 70,
          "name": "Hooded Sweatshirt Dress",
          "category_id": 10,
          "image":
              "https://aki.nurulfikri.com/storage/product//TXWNd8BY4Ptp2EeZzI5zQleuPUrdO1ciWwF6c556.png",
          "image_path":
              "public/product//TXWNd8BY4Ptp2EeZzI5zQleuPUrdO1ciWwF6c556.png",
          "harga": 85000,
          "deskripsi":
              "Gaun sepanjang lutut tanpa lengan dari bahan kaus dengan tudung berfuring dan tali serut, saku di jahitan samping, dan belahan di samping. Berbulu lembut di dalam. Kandungan poliester pada gaun adalah hasil daur ulang.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 80 cm\nPanjang Lengan\t: 10 cm\nBahan\t\t: Polyester 38%, Katun 62%\nGaya\t\t: Hoodie\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:17",
          "updated_at": "2022-12-26 12:12:17",
          "deleted_at": null
        },
        {
          "id": 71,
          "name": "Hoodie LIGHT GREIGE",
          "category_id": 10,
          "image":
              "https://aki.nurulfikri.com/storage/product//kUyaRemRQWmVk5stXDikwuBN3br9hJ0ga7p2vDlw.png",
          "image_path":
              "public/product//kUyaRemRQWmVk5stXDikwuBN3br9hJ0ga7p2vDlw.png",
          "harga": 85000,
          "deskripsi":
              "Hoodie dari kain sweat berbahan campuran katun dengan efek sikat lembut di bagian dalam. Tudung berfuring jersey dengan tali serut di bagian depan, lengan raglan panjang dengan rib di manset, saku kanguru, dan belahan di sisi kelim.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 83 cm\nPanjang Lengan\t: 39 cm\nBahan\t\t: Katun 55%, Elastane 5%, Polyester 40%\nGaya\t\t: Hoodie\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:48",
          "updated_at": "2022-12-26 12:12:48",
          "deleted_at": null
        }
      ]
    },
  ),
  DataGetKategoriById.fromJson(
    {
      "id": 11,
      "name": "Joger Wanita",
      "created_at": "2022-12-26T11:27:55.000000Z",
      "updated_at": "2022-12-26T11:27:55.000000Z",
      "deleted_at": null,
      "products": [
        {
          "id": 74,
          "name": "Block Coloured Teddy Joggers",
          "category_id": 11,
          "image":
              "https://aki.nurulfikri.com/storage/product//CaBXNnqtHH9MhWmKqm2czIV9BFh1XsONDmCuGDAq.png",
          "image_path":
              "public/product//CaBXNnqtHH9MhWmKqm2czIV9BFh1XsONDmCuGDAq.png",
          "harga": 85000,
          "deskripsi":
              "Jogger dengan shearling imitasi lembut dengan bagian warna kontras pada kain tenun. High-waist dengan karet tertutup, saku samping yang tersembunyi dan kaki yang meruncing lembut dengan kelim rib.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Mid Waist\nPanjang \t: 90 cm \nLebar Pinggang \t: 88 cm \nBahan\t\t: Polyester\nGaya\t\t: Joggers\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 9,
          "created_at": "2022-12-26 12:12:49",
          "updated_at": "2022-12-31 06:12:05",
          "deleted_at": null
        },
        {
          "id": 75,
          "name": "Printed Joggers",
          "category_id": 11,
          "image":
              "https://aki.nurulfikri.com/storage/product//Tbhafh9f8eYmbUnH9CnXrRCGKTGFGKUjDydn0y6L.png",
          "image_path":
              "public/product//Tbhafh9f8eYmbUnH9CnXrRCGKTGFGKUjDydn0y6L.png",
          "harga": 85000,
          "deskripsi":
              "Joggers dengan bahan sweater yang terbuat dari campuran katun dengan bagian dalam brushed yang lembut dan motif print pada salah satu kaki. Pinggang reguler dan elastis dengan tali serut internal, saku samping yang tersembunyi, dan karet elastis di bagian keliman.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Mid Waist\nPanjang \t: 90 cm \nLebar Pinggang \t: 88 cm \nBahan\t\t: Polyester\nGaya\t\t: Joggers\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 9,
          "created_at": "2022-12-26 12:12:39",
          "updated_at": "2022-12-31 06:12:05",
          "deleted_at": null
        },
        {
          "id": 76,
          "name": "Patterned Joggers",
          "category_id": 11,
          "image":
              "https://aki.nurulfikri.com/storage/product//q0uXZMgnkAgDvUruzJHjh8jetAmo4FBPINPEHq35.png",
          "image_path":
              "public/product//q0uXZMgnkAgDvUruzJHjh8jetAmo4FBPINPEHq35.png",
          "harga": 85000,
          "deskripsi":
              "Jogger dari bahan sweatshirt ringan dengan ikat pinggang elastis, saku samping, saku belakang, dan kelim elastis.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Mid Waist\nPanjang \t: 90 cm \nLebar Pinggang \t: 88 cm \nBahan\t\t: Katun 70%, Polyester 30%\nGaya\t\t: Joggers\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 9,
          "created_at": "2022-12-26 12:12:18",
          "updated_at": "2022-12-31 06:12:59",
          "deleted_at": null
        },
        {
          "id": 77,
          "name": "Jogger Denim",
          "category_id": 11,
          "image":
              "https://aki.nurulfikri.com/storage/product//umy6PSmYJsKXW09POKmShBuZ7JMLSuFXU7fWruOf.png",
          "image_path":
              "public/product//umy6PSmYJsKXW09POKmShBuZ7JMLSuFXU7fWruOf.png",
          "harga": 85000,
          "deskripsi":
              "Celana jogger dari bahan denim katun airy yang lembut. Pinggang tinggi bertali serut dengan smock dan karet. Saku samping dan belakang serta model kaki tapered dengan kelim bertepi gulung yang dijahit.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Loose fit\nPanjang \t: 90 cm \nLebar Pinggang \t: 88 cm \nBahan\t\t: Katun 35%, Poliester 65%\nGaya\t\t: Joggers\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 9,
          "created_at": "2022-12-26 12:12:05",
          "updated_at": "2022-12-31 06:12:00",
          "deleted_at": null
        },
        {
          "id": 78,
          "name": "Side Panel Joggers",
          "category_id": 11,
          "image":
              "https://aki.nurulfikri.com/storage/product//jWIUmWSU6fyG2rUbBAe9xjwu3LJUy4DK0IRHvyaC.png",
          "image_path":
              "public/product//jWIUmWSU6fyG2rUbBAe9xjwu3LJUy4DK0IRHvyaC.png",
          "harga": 85000,
          "deskripsi":
              "Jogger dari tenunan katun dengan pinggang elastis dan tali serut, saku samping diagonal dan kaki lurus dengan panel samping.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Long\nPanjang \t: 90 cm \nLebar Pinggang \t: 88 cm \nBahan\t\t: Katun\nGaya\t\t: Joggers\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:46",
          "updated_at": "2022-12-26 12:12:46",
          "deleted_at": null
        }
      ]
    },
  ),
  DataGetKategoriById.fromJson(
    {
      "id": 12,
      "name": "Kulot Wanita",
      "created_at": "2022-12-26T11:28:03.000000Z",
      "updated_at": "2022-12-26T11:28:03.000000Z",
      "deleted_at": null,
      "products": [
        {
          "id": 80,
          "name": "Culottes",
          "category_id": 12,
          "image":
              "https://aki.nurulfikri.com/storage/product//gYAZT43vpy7p7mbRlMOeR4O21y5emhYQkacgjV5S.png",
          "image_path":
              "public/product//gYAZT43vpy7p7mbRlMOeR4O21y5emhYQkacgjV5S.png",
          "harga": 92000,
          "deskripsi":
              "Kulot dari kain tenun. Pinggang reguler dengan karet, saku tersembunyi di jahitan samping dan saku belakang imitasi. Model relaxed fit dengan kaki lurus.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Long\nPanjang \t: 102 cm \nLebar Pinggang \t: 70 cm \nBahan\t\t: Shell Polyester\nGaya\t\t: Culottes\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:43",
          "updated_at": "2022-12-26 12:12:43",
          "deleted_at": null
        },
        {
          "id": 81,
          "name": "Crop Pull-on Pants",
          "category_id": 12,
          "image":
              "https://aki.nurulfikri.com/storage/product//IkM21kZ6AByuFYSeLBXk5yleYRWI0J0tAPNi4CHE.png",
          "image_path":
              "public/product//IkM21kZ6AByuFYSeLBXk5yleYRWI0J0tAPNi4CHE.png",
          "harga": 105000,
          "deskripsi":
              "Celana selutut dengan kain tenun viscose yang tersampir lembut. Pinggang tinggi, karet pinggang tertutup, dan saku jahitan samping yang tersembunyi. Kaki lurus dan lebar.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Long\nPanjang \t: 90 cm \nLebar Pinggang \t: 70 cm \nBahan\t\t: Polyester\nGaya\t\t: Culottes\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:35",
          "updated_at": "2022-12-26 12:12:35",
          "deleted_at": null
        },
        {
          "id": 82,
          "name": "Wide-cut Jersey Pants",
          "category_id": 12,
          "image":
              "https://aki.nurulfikri.com/storage/product//mMHNpLvhcpRfhLeGTn7peMQGPoi0bCb9pCGMnO8c.png",
          "image_path":
              "public/product//mMHNpLvhcpRfhLeGTn7peMQGPoi0bCb9pCGMnO8c.png",
          "harga": 135000,
          "deskripsi":
              "Celana berbahan jersey viscose yang lembut. Pinggang tinggi dengan ruffle trim di bagian atas, karet pinggang tertutup, dan kaki lurus lebar.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Long\nPanjang \t: 102 cm \nLebar Pinggang \t: 70 cm \nBahan\t\t: Viscose\nGaya\t\t: Culottes\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:13",
          "updated_at": "2022-12-26 12:12:13",
          "deleted_at": null
        },
        {
          "id": 83,
          "name": "Wide-leg Pants",
          "category_id": 12,
          "image":
              "https://aki.nurulfikri.com/storage/product//89EjEy6IfTufFATxLF0LZRYz1oY0HWZRLkS7Yr37.png",
          "image_path":
              "public/product//89EjEy6IfTufFATxLF0LZRYz1oY0HWZRLkS7Yr37.png",
          "harga": 135000,
          "deskripsi":
              "Celana dalam kain tenun dengan kilau. Pinggang tinggi, dilapisi karet di pinggang, dan saku samping. Kaki lurus dan lebar dengan lipatan yang dijahit.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Long\nPanjang \t: 102 cm \nLebar Pinggang \t: 70 cm \nBahan\t\t: Polyester\nGaya\t\t: Culottes\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:17",
          "updated_at": "2022-12-26 12:12:17",
          "deleted_at": null
        },
        {
          "id": 85,
          "name": "Flared Textured Jersey Leggings",
          "category_id": 12,
          "image":
              "https://aki.nurulfikri.com/storage/product//U3SR6Jde8UW7rDcwtt0VCKTX7e86HMKSABZr2EYg.png",
          "image_path":
              "public/product//U3SR6Jde8UW7rDcwtt0VCKTX7e86HMKSABZr2EYg.png",
          "harga": 140000,
          "deskripsi":
              "Legging berbahan jersey bertekstur. Pinggang tinggi, tersembunyi, ikat pinggang elastis, dan kaki panjang melebar dengan keliman tepi kasar.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Long\nPanjang \t: 102 cm \nLebar Pinggang \t: 70 cm \nBahan\t\t: Polyester\nGaya\t\t: Culottes\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.",
          "stock": 10,
          "created_at": "2022-12-26 12:12:56",
          "updated_at": "2022-12-26 12:12:56",
          "deleted_at": null
        }
      ]
    },
  ),
  DataGetKategoriById.fromJson(
    {
      "id": 13,
      "name": "Kemeja Pria",
      "created_at": "2022-12-26T11:28:14.000000Z",
      "updated_at": "2022-12-26T11:28:14.000000Z",
      "deleted_at": null,
      "products": [
        {
          "id": 86,
          "name": "Relaxed Fit Twill Shirt",
          "category_id": 13,
          "image":
              "https://aki.nurulfikri.com/storage/product//KeOJ0O3k5Xj3W4Oe5ba0YSKupznPrwVS8czXpaSd.png",
          "image_path":
              "public/product//KeOJ0O3k5Xj3W4Oe5ba0YSKupznPrwVS8czXpaSd.png",
          "harga": 125000,
          "deskripsi":
              "Kemeja kotak-kotak santai dengan kepar katun lembut. Kerah turn-down, saku rok kancing klasik, dan kuk di belakang. Kantong dada terbuka, lengan panjang dengan kancing di manset, dan saku rok lengan dengan kancing tautan. Keliman membulat.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 55 cm\nPanjang Lengan\t: 44 cm\nBahan\t\t: Cotton\nGaya\t\t: Kerah resort\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:34",
          "updated_at": "2022-12-26 12:12:34",
          "deleted_at": null
        },
        {
          "id": 87,
          "name": "Slim Fit Easy-iron Shirt",
          "category_id": 13,
          "image":
              "https://aki.nurulfikri.com/storage/product//s7WvJJUPm8XBrDBlFIpuSw0b1SlP8zTsNtEPZTtb.png",
          "image_path":
              "public/product//s7WvJJUPm8XBrDBlFIpuSw0b1SlP8zTsNtEPZTtb.png",
          "harga": 125000,
          "deskripsi":
              "Kemeja slim-fit berbahan kain tenun dengan sentuhan akhir yang mudah disetrika. Kerah turn-down, saku rok kancing klasik, dan anak panah dan kuk di belakang. Lengan panjang dengan kancing yang bisa disesuaikan di ujung lengan dan saku rok lengan dengan kancing penghubung. Keliman bulat lembut.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 55 cm\nPanjang Lengan\t: 44 cm\nBahan\t\t: Polyester 65%, Cotton 35%\nGaya\t\t: Kerah resort\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 9,
          "created_at": "2022-12-26 12:12:28",
          "updated_at": "2023-01-08 02:01:47",
          "deleted_at": null
        },
        {
          "id": 88,
          "name": "Relaxed Fit Overshirt",
          "category_id": 13,
          "image":
              "https://aki.nurulfikri.com/storage/product//H6POz02eiVpILA5gF4LM2Eok8H7jtvY2b2SC832j.png",
          "image_path":
              "public/product//H6POz02eiVpILA5gF4LM2Eok8H7jtvY2b2SC832j.png",
          "harga": 130000,
          "deskripsi":
              "Overshirt santai dengan bahan tenun. Kerah lipat, kancing di depan, dan saku dada dengan tutup dan kancing. Kuk di belakang, lengan panjang dengan kancing di manset, dan keliman yang bulat lembut. Tidak bergaris.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 55 cm\nPanjang Lengan\t: 44 cm\nBahan\t\t: Polyester\nGaya\t\t: Kerah resort\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:13",
          "updated_at": "2022-12-26 12:12:13",
          "deleted_at": null
        },
        {
          "id": 89,
          "name": "Regular Fit Teddy-lined Overshirt",
          "category_id": 13,
          "image":
              "https://aki.nurulfikri.com/storage/product//uGs9ChNgQXcf1s3JaZqkdxORxC33VIsI8s6AWX7P.png",
          "image_path":
              "public/product//uGs9ChNgQXcf1s3JaZqkdxORxC33VIsI8s6AWX7P.png",
          "harga": 178000,
          "deskripsi":
              "Overshirt dengan bantalan ringan dan regular-fit dalam kepar katun lembut. Kerah, kancing di depan, dan kuk di belakang. Saku dada dengan penutup dan kancing jepret tersembunyi, lengan panjang dengan saku rok lengan dan kancing di manset, serta keliman berpotongan lurus. Lapisan bulu teddy.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 55 cm\nPanjang Lengan\t: 44 cm\nBahan\t\t: Shell: Cotton 100% Lining: Polyester 100% Padding: Polyester 100%\nGaya\t\t: Kerah resort\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 9,
          "created_at": "2022-12-26 12:12:21",
          "updated_at": "2023-01-08 02:01:40",
          "deleted_at": null
        },
        {
          "id": 90,
          "name": "Shaggy Overshirt",
          "category_id": 13,
          "image":
              "https://aki.nurulfikri.com/storage/product//QZ5DdWFtw1vV2ik9813Ry19zsjwxvqiyktQ5csPv.png",
          "image_path":
              "public/product//QZ5DdWFtw1vV2ik9813Ry19zsjwxvqiyktQ5csPv.png",
          "harga": 152000,
          "deskripsi":
              "Overshirt dengan kain yang lembut dan terasa. Kerah, kancing di depan, kuk di belakang, dan saku dada dengan penutup dan pengikat jepret. Lengan panjang dengan kancing di manset.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm - 110 cm\nPanjang Baju\t: 55 cm\nPanjang Lengan\t: 44 cm\nBahan\t\t: Shell: Polyester 96%, Acrylic 3%, Polyamide 1% Lining: Polyester 82%, Cotton 18%\nGaya\t\t: Kerah resort\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:05",
          "updated_at": "2022-12-26 12:12:05",
          "deleted_at": null
        }
      ]
    },
  ),
  DataGetKategoriById.fromJson(
    {
      "id": 14,
      "name": "Kaos Pria",
      "created_at": "2022-12-26T11:28:20.000000Z",
      "updated_at": "2022-12-26T11:28:20.000000Z",
      "deleted_at": null,
      "products": [
        {
          "id": 91,
          "name": "Oversized Fit Short-sleeved Rugby Shirt",
          "category_id": 14,
          "image":
              "https://aki.nurulfikri.com/storage/product//y12sh9OJ0YLiJasw9QqrNoCNaQ4gszLIhdKzHVIl.png",
          "image_path":
              "public/product//y12sh9OJ0YLiJasw9QqrNoCNaQ4gszLIhdKzHVIl.png",
          "harga": 78000,
          "deskripsi":
              "Kemeja rugby oversized dengan jersey katun lembut. Kerah, saku rok kancing tersembunyi, bahu turun berat, dan lengan pendek. Hem berpotongan lurus dengan belahan di samping.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 55 cm \nPanjang Baju\t: 73 cm\nPanjang Lengan\t: 20 cm\nBahan\t\t: Cutton\nGaya\t\t: Rugby Shirt\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:20",
          "updated_at": "2022-12-26 12:12:20",
          "deleted_at": null
        },
        {
          "id": 92,
          "name": "Regular Fit Crew-neck T-shirt",
          "category_id": 14,
          "image":
              "https://aki.nurulfikri.com/storage/product//jLZovjPIEc7Jb52fHvqfwaRMV8T7Fx6RPjvWHjBZ.png",
          "image_path":
              "public/product//jLZovjPIEc7Jb52fHvqfwaRMV8T7Fx6RPjvWHjBZ.png",
          "harga": 53000,
          "deskripsi":
              "Baju T-shirt regular-fit berbahan kaos katun lembut. Leher kru berusuk dan keliman lurus.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 55 cm \nPanjang Baju\t: 73 cm\nPanjang Lengan\t: 20 cm\nBahan\t\t: Cutton\nGaya\t\t: Rugby Shirt\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:59",
          "updated_at": "2022-12-26 12:12:59",
          "deleted_at": null
        },
        {
          "id": 93,
          "name": "Oversized Cotton T-shirt",
          "category_id": 14,
          "image":
              "https://aki.nurulfikri.com/storage/product//aR8kLIikSlDlJ1NvJb0YYkvtSX9oq3V4JoWctm5U.png",
          "image_path":
              "public/product//aR8kLIikSlDlJ1NvJb0YYkvtSX9oq3V4JoWctm5U.png",
          "harga": 100000,
          "deskripsi":
              "Baju T-shirt regular-fit berbahan kaos katun lembut. Leher kru berusuk dan keliman lurus.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 55 cm \nPanjang Baju\t: 73 cm\nPanjang Lengan\t: 20 cm\nBahan\t\t: Cutton\nGaya\t\t: Rugby Shirt\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:42",
          "updated_at": "2022-12-26 12:12:42",
          "deleted_at": null
        },
        {
          "id": 94,
          "name": "Oversized Fit Cotton T-shirt",
          "category_id": 14,
          "image":
              "https://aki.nurulfikri.com/storage/product//RjYBCtzWkIfg8YHvABaFPxfWm1fWeDukg17oZZuB.png",
          "image_path":
              "public/product//RjYBCtzWkIfg8YHvABaFPxfWm1fWeDukg17oZZuB.png",
          "harga": 100000,
          "deskripsi":
              "T-shirt oversized berbahan kaos katun lembut. Leher kru berusuk, bahu turun, dan keliman lurus.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 55 cm \nPanjang Baju\t: 73 cm\nPanjang Lengan\t: 20 cm\nBahan\t\t: Cutton\nGaya\t\t: Rugby Shirt\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:10",
          "updated_at": "2022-12-26 12:12:10",
          "deleted_at": null
        },
        {
          "id": 95,
          "name": "Sports Shirt in DryMove™ Orange",
          "category_id": 14,
          "image":
              "https://aki.nurulfikri.com/storage/product//8cJhXFXkyJKV99msQBGibJXX237g705CKu3WQhbz.png",
          "image_path":
              "public/product//8cJhXFXkyJKV99msQBGibJXX237g705CKu3WQhbz.png",
          "harga": 100000,
          "deskripsi":
              "Kaos olahraga lengan pendek berbahan kain fungsional DryMove™ untuk menghilangkan kelembapan dari kulit dan membuat Anda tetap kering dengan nyaman saat beraktivitas. Otot yang pas dengan bahu sempit dan lengan meruncing untuk siluet yang menawan.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 55 cm \nPanjang Baju\t: 73 cm\nPanjang Lengan\t: 20 cm\nBahan\t\t: Polyester 95%, Spandex 5%\nGaya\t\t: Rugby Shirt\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:43",
          "updated_at": "2022-12-26 12:12:43",
          "deleted_at": null
        }
      ]
    },
  ),
  DataGetKategoriById.fromJson(
    {
      "id": 15,
      "name": "Hoodie Pria",
      "created_at": "2022-12-26T11:28:27.000000Z",
      "updated_at": "2022-12-26T11:28:27.000000Z",
      "deleted_at": null,
      "products": [
        {
          "id": 97,
          "name": "Relaxed Fit Terry Polo Shirt",
          "category_id": 15,
          "image":
              "https://aki.nurulfikri.com/storage/product//7tyw5O1xkslHi9DHdnSuEsLUFQqzZY9f0xwc0HkU.png",
          "image_path":
              "public/product//7tyw5O1xkslHi9DHdnSuEsLUFQqzZY9f0xwc0HkU.png",
          "harga": 165000,
          "deskripsi":
              "Hoodie sweater blok warna yang pas untuk bersantai dalam bahan campuran katun dengan bagian dalam yang lembut dan disikat. Kerudung serut berjajar, detail teks tercetak di depan, dan saku kanguru. Lengan panjang dan ribbing di manset dan hem.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm\nPanjang Baju\t: 70 cm\nPanjang Lengan\t: 39 cm\nBahan\t\t: Shell: Cotton 60%, Polyester 40%Hood lining: Cotton 60%, Polyester 40%\nGaya\t\t: Hoodie\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:49",
          "updated_at": "2022-12-26 12:12:49",
          "deleted_at": null
        },
        {
          "id": 98,
          "name": "Relaxed Fit Hooded Jacket",
          "category_id": 15,
          "image":
              "https://aki.nurulfikri.com/storage/product//75zIBInAsyIwl5RQMQun79cAaW4OvEwuGbtimPE7.png",
          "image_path":
              "public/product//75zIBInAsyIwl5RQMQun79cAaW4OvEwuGbtimPE7.png",
          "harga": 165000,
          "deskripsi":
              "Jaket kaus santai dengan bagian dalam yang lembut dan disikat. Berlapis kaos, tudung serut, ritsleting di depan, dan saku samping diagonal. Ribbing di manset dan hem.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm\nPanjang Baju\t: 70 cm\nPanjang Lengan\t: 39 cm\nBahan\t\t: Shell: Cotton 60%, Polyester 40%Hood lining: Cotton 100%\nGaya\t\t: Hoodie\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:20",
          "updated_at": "2022-12-26 12:12:20",
          "deleted_at": null
        },
        {
          "id": 99,
          "name": "Long Hooded Cardigan",
          "category_id": 15,
          "image":
              "https://aki.nurulfikri.com/storage/product//39yXggpmnwqVVaZOrSUGMbyEK0NN05fWeanBSSaQ.png",
          "image_path":
              "public/product//39yXggpmnwqVVaZOrSUGMbyEK0NN05fWeanBSSaQ.png",
          "harga": 165000,
          "deskripsi":
              "Cardigan panjang dari kain kaus ringan dengan jahitan yang terlihat dan tudung serut berlapis jersey. Lengan panjang, saku samping, dan keliman asimetris. Tidak ada pengencang.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm\nPanjang Baju\t: 90 cm\nPanjang Lengan\t: 39 cm\nBahan\t\t: Cotton \nGaya\t\t: Hoodie\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:02",
          "updated_at": "2022-12-26 12:12:02",
          "deleted_at": null
        },
        {
          "id": 100,
          "name": "Regular Fit Hoodie",
          "category_id": 15,
          "image":
              "https://aki.nurulfikri.com/storage/product//QhxKOsZDwyAQ1h6shOx25tM3414GB91PcfxUruMw.png",
          "image_path":
              "public/product//QhxKOsZDwyAQ1h6shOx25tM3414GB91PcfxUruMw.png",
          "harga": 165000,
          "deskripsi":
              "Hoodie kaus lembut dengan tudung berlapis ganda di bagian depan dengan tali serut. Kantung kanguru, lengan panjang, dan ribbing pada manset dan keliman.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm\nPanjang Baju\t: 70 cm\nPanjang Lengan\t: 39 cm\nBahan\t\t: Shell: Cotton 60%, Polyester 40%Hood lining: Cotton 60%, Polyester 40%\nGaya\t\t: Hoodie\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:48",
          "updated_at": "2022-12-26 12:12:48",
          "deleted_at": null
        },
        {
          "id": 101,
          "name": "Relaxed Fit Hoodie Black NASA",
          "category_id": 15,
          "image":
              "https://aki.nurulfikri.com/storage/product//gxNcevEO2xNmeQ1XnKO5Gj7QaeS97fYEhmJySgTf.png",
          "image_path":
              "public/product//gxNcevEO2xNmeQ1XnKO5Gj7QaeS97fYEhmJySgTf.png",
          "harga": 165000,
          "deskripsi":
              "Hoodie sweatshirt santai berbahan katun dengan motif print di bagian depan dan belakang serta bagian dalam yang lembut dan brushed. Kerudung berlapis dengan tali serut elastis, saku kanguru dengan ritsleting tersembunyi di samping, dan lengan panjang. Ribbing lebar di manset dan keliman. Detail reflektif.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm\nPanjang Baju\t: 70 cm\nPanjang Lengan\t: 39 cm\nBahan\t\t: Shell: Cotton 60%, Polyester 40% Hood lining: Cotton 60%, Polyester 40%\nGaya\t\t: Hoodie\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:37",
          "updated_at": "2022-12-26 12:12:37",
          "deleted_at": null
        }
      ]
    },
  ),
  DataGetKategoriById.fromJson(
    {
      "id": 16,
      "name": "Sweater Pria",
      "created_at": "2022-12-26T11:28:33.000000Z",
      "updated_at": "2022-12-26T11:28:33.000000Z",
      "deleted_at": null,
      "products": [
        {
          "id": 102,
          "name": "Slim Fit Fine-knit Turtleneck Sweater",
          "category_id": 16,
          "image":
              "https://aki.nurulfikri.com/storage/product//JgCNHb3cAY8voKU8vbEtKxjD9k3aB4jHCi3DPrRu.png",
          "image_path":
              "public/product//JgCNHb3cAY8voKU8vbEtKxjD9k3aB4jHCi3DPrRu.png",
          "harga": 165000,
          "deskripsi":
              "Sweter rajutan halus berbahan katun lembut dengan turtleneck bergaris, lengan panjang, dan kancing di ujung lengan dan keliman.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm\nPanjang Baju\t: 70 cm\nPanjang Lengan\t: 80 cm\nBahan\t\t: Cotton 60%, Polyester 40%\nGaya\t\t: Hoodie\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:39",
          "updated_at": "2022-12-26 12:12:39",
          "deleted_at": null
        },
        {
          "id": 103,
          "name": "Regular Fit Jacquard-knit Sweater",
          "category_id": 16,
          "image":
              "https://aki.nurulfikri.com/storage/product//MRC3kKcLgEf64wz62F0qpvpp5nCcR9m0gTBVt20L.png",
          "image_path":
              "public/product//MRC3kKcLgEf64wz62F0qpvpp5nCcR9m0gTBVt20L.png",
          "harga": 165000,
          "deskripsi":
              "Sweter rajutan jacquard yang lembut dengan leher bulat, lengan panjang, dan ribbing halus di bagian leher, manset, dan keliman. Cocok secara teratur.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm\nPanjang Baju\t: 70 cm\nPanjang Lengan\t: 80 cm\nBahan\t\t: Polyester 60%, Polyamide 35%, Wool 5%\nGaya\t\t: Hoodie\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 7,
          "created_at": "2022-12-26 12:12:12",
          "updated_at": "2023-01-04 15:01:07",
          "deleted_at": null
        },
        {
          "id": 104,
          "name": "Relaxed Fit Rib-knit Sweater",
          "category_id": 16,
          "image":
              "https://aki.nurulfikri.com/storage/product//9Z5zWQyM1PzonluGxpOC5afA2Iwn1kbYbTYgWN31.png",
          "image_path":
              "public/product//9Z5zWQyM1PzonluGxpOC5afA2Iwn1kbYbTYgWN31.png",
          "harga": 165000,
          "deskripsi":
              "Sweter santai dalam rajutan tulang rusuk yang lembut dengan kandungan wol. Leher bulat, bahu turun, dan lengan panjang. Ribbing lebar di leher, manset, dan keliman.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm\nPanjang Baju\t: 70 cm\nPanjang Lengan\t: 80 cm\nBahan\t\t: Polyester 60%, Polyamide 35%, Wool 5%\nGaya\t\t: Hoodie\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:44",
          "updated_at": "2022-12-26 12:12:44",
          "deleted_at": null
        },
        {
          "id": 105,
          "name": "Regular Fit Jacquard-knit Sweater",
          "category_id": 16,
          "image":
              "https://aki.nurulfikri.com/storage/product//THNQ6qjDLa8pDMviDjefkRABG3eaMgZkNe6JXHle.png",
          "image_path":
              "public/product//THNQ6qjDLa8pDMviDjefkRABG3eaMgZkNe6JXHle.png",
          "harga": 165000,
          "deskripsi":
              "Sweter regular-fit dengan kain rajut jacquard yang lembut dengan kandungan wol. Leher bulat, lengan panjang, dan ribbing di leher, manset, dan hem.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm\nPanjang Baju\t: 70 cm\nPanjang Lengan\t: 80 cm\nBahan\t\t: Polyester 60%, Polyamide 35%, Wool 5%\nGaya\t\t: Hoodie\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:24",
          "updated_at": "2022-12-26 12:12:24",
          "deleted_at": null
        },
        {
          "id": 106,
          "name": "V-neck Cotton Sweater",
          "category_id": 16,
          "image":
              "https://aki.nurulfikri.com/storage/product//oHvQFJt2OwJd9fUUf20hjnIPfxNiBlTO4mZnGHps.png",
          "image_path":
              "public/product//oHvQFJt2OwJd9fUUf20hjnIPfxNiBlTO4mZnGHps.png",
          "harga": 165000,
          "deskripsi":
              "Rajutan halus, sweater katun V-neck dengan ribbing di garis leher, manset, dan keliman.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Fit to L\nLingkar Dada\t: 100 cm\nPanjang Baju\t: 70 cm\nPanjang Lengan\t: 80 cm\nBahan\t\t: Cutton\nGaya\t\t: Sweater\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:57",
          "updated_at": "2022-12-26 12:12:57",
          "deleted_at": null
        }
      ]
    },
  ),
  DataGetKategoriById.fromJson(
    {
      "id": 17,
      "name": "Jeans Pria",
      "created_at": "2022-12-26T11:28:39.000000Z",
      "updated_at": "2022-12-26T11:28:39.000000Z",
      "deleted_at": null,
      "products": [
        {
          "id": 107,
          "name": "Skinny Jeans",
          "category_id": 17,
          "image":
              "https://aki.nurulfikri.com/storage/product//u8baos0ojXITjgDyD8d5AUOA8ODnFCD6V1B6YtA0.png",
          "image_path":
              "public/product//u8baos0ojXITjgDyD8d5AUOA8ODnFCD6V1B6YtA0.png",
          "harga": 85000,
          "deskripsi":
              "Jeans 5 saku berbahan denim stretch yang telah dicuci dengan detail yang sangat tertekan. Pinggang biasa, zip fly dengan kancing, dan kaki kurus.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Mid Waist\nPanjang \t: 90 cm \nLebar Pinggang \t: 88 cm \nBahan\t\t: Cotton 98%, Spandex 2%\nGaya\t\t: Jeans\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:08",
          "updated_at": "2022-12-26 12:12:08",
          "deleted_at": null
        },
        {
          "id": 108,
          "name": "Loose Jeans Denim blue",
          "category_id": 17,
          "image":
              "https://aki.nurulfikri.com/storage/product//CHHxYCv79jWif2SwYsPHkYYslriyPCjuQmvrsRdd.png",
          "image_path":
              "public/product//CHHxYCv79jWif2SwYsPHkYYslriyPCjuQmvrsRdd.png",
          "harga": 85000,
          "deskripsi":
              "Jeans longgar dengan 5 saku berbahan denim stretch. Pinggang reguler, zip fly dengan kancing, dan kaki lebar dengan penutup lutut besar untuk menambah daya tarik. Kain mengandung TENCEL™ lyocell yang dibuat dengan teknologi REFIBRA™, viscose CIRCULOSE®, dan kapas daur ulang. Selesai dengan teknik pencucian berdampak rendah.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Mid Waist\nPanjang \t: 90 cm \nLebar Pinggang \t: 88 cm \nBahan\t\t: Shell: Cotton 98%, Spandex 2% Pocket lining: Cotton 100%\nGaya\t\t: Jeans\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:01",
          "updated_at": "2022-12-26 12:12:01",
          "deleted_at": null
        },
        {
          "id": 109,
          "name": "Loose Jeans Denim blue",
          "category_id": 17,
          "image":
              "https://aki.nurulfikri.com/storage/product//hy7SxG4t0rEFnPHqrmXCEFXYEkdLATERvTzDLTRZ.png",
          "image_path":
              "public/product//hy7SxG4t0rEFnPHqrmXCEFXYEkdLATERvTzDLTRZ.png",
          "harga": 85000,
          "deskripsi":
              "Jeans loose-fit sepanjang pergelangan kaki dengan bahan denim tebal. Pinggang biasa dan ikat pinggang dengan karet tertutup, tali serut tersembunyi, dan mock fly. Saku samping, saku belakang, dan kaki lebar. Terbuat dari kain yang mengandung ECOVERO® viscose dan TENCEL™ lyocell yang dibuat dengan teknologi REFIBRA™. Selesai menggunakan teknik pencucian dampak rendah.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Mid Waist\nPanjang \t: 90 cm \nLebar Pinggang \t: 88 cm \nBahan\t\t: Shell: Rayon 50%, Lyocell 50% Pocket lining: Polyester 65%, Cotton 35%\nGaya\t\t: Jeans\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:38",
          "updated_at": "2022-12-26 12:12:38",
          "deleted_at": null
        },
        {
          "id": 110,
          "name": "Loose Jeans Hots",
          "category_id": 17,
          "image":
              "https://aki.nurulfikri.com/storage/product//gXIq3M1trUKEMguAHYuRA85RhhRAArdg0lwIrULB.png",
          "image_path":
              "public/product//gXIq3M1trUKEMguAHYuRA85RhhRAArdg0lwIrULB.png",
          "harga": 85000,
          "deskripsi":
              "Jeans longgar dengan 5 saku berbahan denim katun tebal dengan detail yang sangat tertekan. Pinggang reguler, zip fly dengan kancing, dan kaki lebar.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Mid Waist\nPanjang \t: 90 cm \nLebar Pinggang \t: 88 cm \nBahan\t\t: Shell: Cotton 100% Pocket lining: Polyester 65%, Cotton 35%\nGaya\t\t: Jeans\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 8,
          "created_at": "2022-12-26 12:12:10",
          "updated_at": "2023-01-04 15:01:02",
          "deleted_at": null
        },
        {
          "id": 111,
          "name": "Freefit® Slim Jeans",
          "category_id": 17,
          "image":
              "https://aki.nurulfikri.com/storage/product//8jH1HW6TS9pdgOaM63IIzXgEBr2owqRmCCpIeaLi.png",
          "image_path":
              "public/product//8jH1HW6TS9pdgOaM63IIzXgEBr2owqRmCCpIeaLi.png",
          "harga": 85000,
          "deskripsi":
              "Jeans denim 5 saku dengan pinggang biasa, zip fly dengan kancing, dan kaki ramping. Dibuat dengan teknologi Lycra® Freefit® untuk kelenturan lembut, super murah hati, kebebasan bergerak maksimum, dan kenyamanan optimal.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Mid Waist\nPanjang \t: 90 cm \nLebar Pinggang \t: 88 cm \nBahan\t\t: Shell: Cotton 89%, Elastomultiester 9%, Spandex 2% Pocket lining: Polyester 80%, Cotton 20%\nGaya\t\t: Jeans\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:43",
          "updated_at": "2022-12-26 12:12:43",
          "deleted_at": null
        }
      ]
    },
  ),
  DataGetKategoriById.fromJson(
    {
      "id": 18,
      "name": "Joger Pria",
      "created_at": "2022-12-26T11:28:51.000000Z",
      "updated_at": "2022-12-26T11:28:51.000000Z",
      "deleted_at": null,
      "products": [
        {
          "id": 112,
          "name": "Skinny Fit Nylon Cargo Joggers",
          "category_id": 18,
          "image":
              "https://aki.nurulfikri.com/storage/product//4k3PeMhzjymnp7cjvmM9ofnuQRtZW4XgzuIPfFMz.png",
          "image_path":
              "public/product//4k3PeMhzjymnp7cjvmM9ofnuQRtZW4XgzuIPfFMz.png",
          "harga": 85000,
          "deskripsi":
              "Jogger slim-fit berbahan nilon elastis. Serut dan penutup elastis di pinggang, mock fly, dan penutup elastis di keliman. Saku samping dengan ritsleting, saku belakang dengan penutup dan pengencang jepret, dan saku kaki dengan penutup, pengikat jepret, dan kompartemen luar dengan ritsleting.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Mid Waist\nPanjang \t: 90 cm \nLebar Pinggang \t: 88 cm \nBahan\t\t: Shell: Polyamide 96%, Spandex 4% Pocket lining: Polyester 100%\nGaya\t\t: Joger\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:40",
          "updated_at": "2022-12-26 12:12:40",
          "deleted_at": null
        },
        {
          "id": 113,
          "name": "THERMOLITE® Relaxed Fit Sweatpants Green",
          "category_id": 18,
          "image":
              "https://aki.nurulfikri.com/storage/product//BFQP6eDCwh6IXw7nshvoGJpojA50nhcBN0Pj5YaO.png",
          "image_path":
              "public/product//BFQP6eDCwh6IXw7nshvoGJpojA50nhcBN0Pj5YaO.png",
          "harga": 85000,
          "deskripsi":
              "Celana olahraga dalam bahan kaus yang terbuat dari campuran katun dengan bagian dalam yang disikat lembut. Gaya santai dengan karet penutup dan tali serut di pinggang, saku samping beritsleting diagonal, dan keliman berusuk. Dibuat menggunakan teknologi THERMOLITE®, produk ini telah dikembangkan untuk membuat Anda tetap hangat dengan jumlah dan berat minimum.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Mid Waist\nPanjang \t: 90 cm \nLebar Pinggang \t: 88 cm \nBahan\t\t: Shell: Polyamide 96%, Spandex 4% Pocket lining: Polyester 100%\nGaya\t\t: Joger\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:20",
          "updated_at": "2022-12-26 12:12:20",
          "deleted_at": null
        },
        {
          "id": 114,
          "name": "Hybrid Regular Tapered Joggers",
          "category_id": 18,
          "image":
              "https://aki.nurulfikri.com/storage/product//kgVdyfdlVbobYANJlakzmdqosARir6IAjLdSgC5w.png",
          "image_path":
              "public/product//kgVdyfdlVbobYANJlakzmdqosARir6IAjLdSgC5w.png",
          "harga": 85000,
          "deskripsi":
              "Jogger 5 kantong berbahan denim stretch. Pinggang reguler, ikat pinggang dengan tali serut dan penutup elastis, dan ritsleting terbang dengan kancing. Kaki yang meruncing lembut dengan ruang gerak yang baik di atas paha dan lutut. Ditutupi elastis di keliman. Dibuat menggunakan Teknologi Lycra® Hybrid untuk kelembutan dan kenyamanan luar biasa tanpa mengorbankan tampilan denim asli.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Mid Waist\nPanjang \t: 90 cm \nLebar Pinggang \t: 88 cm \nBahan\t\t: Shell: Polyamide 96%, Spandex 4% Pocket lining: Polyester 100%\nGaya\t\t: Joger\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 9,
          "created_at": "2022-12-26 12:12:05",
          "updated_at": "2022-12-31 16:12:47",
          "deleted_at": null
        },
        {
          "id": 115,
          "name": "THERMOLITE® Relaxed Fit Sweatpants Brown",
          "category_id": 18,
          "image":
              "https://aki.nurulfikri.com/storage/product//LhRYu9yfrIeZxbST0tG5tXA8yua8rrig5dePGAbX.png",
          "image_path":
              "public/product//LhRYu9yfrIeZxbST0tG5tXA8yua8rrig5dePGAbX.png",
          "harga": 85000,
          "deskripsi":
              "Celana olahraga dalam bahan kaus yang terbuat dari campuran katun dengan bagian dalam yang disikat lembut. Gaya santai dengan karet penutup dan tali serut di pinggang, saku samping beritsleting diagonal, dan keliman berusuk. Dibuat menggunakan teknologi THERMOLITE®, produk ini telah dikembangkan untuk membuat Anda tetap hangat dengan jumlah dan berat minimum.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Mid Waist\nPanjang \t: 90 cm \nLebar Pinggang \t: 88 cm \nBahan\t\t: Shell: Polyamide 96%, Spandex 4% Pocket lining: Polyester 100%\nGaya\t\t: Joger\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 10,
          "created_at": "2022-12-26 12:12:49",
          "updated_at": "2022-12-26 12:12:49",
          "deleted_at": null
        },
        {
          "id": 116,
          "name": "THERMOLITE® Loose Fit Joggers",
          "category_id": 18,
          "image":
              "https://aki.nurulfikri.com/storage/product//XlgsAgDqJyCYwkGc8cqUB8N1dB3Wb8hSHekjh8Nu.png",
          "image_path":
              "public/product//XlgsAgDqJyCYwkGc8cqUB8N1dB3Wb8hSHekjh8Nu.png",
          "harga": 85000,
          "deskripsi":
              "Jogger longgar dengan bahan fleece lembut. Covered elastic di ikat pinggang dan sabuk grosgrain dengan pengikat plastik. Saku samping dengan ritsleting, saku belakang bilur, dan karet penutup di keliman. Ritsleting tersembunyi di bawah lutut untuk mengubah celana menjadi celana pendek. Dibuat menggunakan teknologi THERMOLITE®, dikembangkan untuk kehangatan dengan jumlah dan berat minimum.\n\nKondisi\t\t: Bekas\nUkuran\t\t: Mid Waist\nPanjang \t: 90 cm \nLebar Pinggang \t: 88 cm \nBahan\t\t: Polyester \nGaya\t\t: Joger\nKonsep\t\t: Everyday Fashion\n\nNote : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\nHappy Trifting!",
          "stock": 8,
          "created_at": "2022-12-26 12:12:28",
          "updated_at": "2023-01-19 11:01:13",
          "deleted_at": null
        }
      ]
    },
  ),
];
