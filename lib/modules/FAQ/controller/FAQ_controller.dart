import 'package:bottom_nav/data/faq_data.dart';
import 'package:get/get.dart';
import 'package:bottom_nav/models/QuestionModel.dart';

class FAQController extends GetxController {
  //buat list observable variabel untuk gambar gambar
  var images = <String>[
    'images/image1.jpg',
    'images/image2.jpg',
    'images/image3.jpg',
  ].obs; // kasih titik obs dibelakang untuk menandakan kalau dia itu observable variabel

  //list observable untuk pertanyaan FAQ
  var QuestionsData = <QuestionModel>[].obs;

  //Menandai data fetching atau tidak
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();//untuk override
    loadFAQData(); // Panggil saat controller diinisialisasi
  }

  //fungsi loadFAQData
  loadFAQData() async {
    try {
      isLoading.value = true; // Set isLoading ke true saat mulai memuat data
      //kode yang digunakan untuk mengonversi data List map <String.string> bernama question
      //menjadi objek QuestionModel Menggunakan metode fromJson
      //questions merupakan data list Map<string,string>
      //questions mau diproses menjadi objek QuestionModel
      //QuestionModel class yang berisi blueprint data question
      //map adalah metode untuk menerapkan fungsi ke setiap elemen dalam list question
      //fungsi yang mau diterapkan ke setiap elemen (datax> dari) dari list questions
      // adalah fungsi untuk mengonversi listQuestions yang tipenya map Json, menjadi sesuai
      //objek dart QuestionModel
      //setiap elemen question
      //ini level tinggi syntaxnya pusing
      // var loadedQuestions =
      //     questions.map(
      //             (datax) => QuestionModel.fromJson(datax)
      //     ).toList();


      //cara lain
      var loadedQuestions = List<QuestionModel>.empty(growable: true);
      for (var datax in questions){

        var question = QuestionModel.fromJson(datax);
        loadedQuestions.add(question);
      }
      //masukkin datanya ke observabel list QuestionsData yang udah dibuat di atas
      QuestionsData.assignAll(loadedQuestions);
    } catch (e) {
      print("Error loading FAQ data: $e");
    } finally {
      isLoading.value = false; // Selesai loading
    }
  }
}
