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
    super.onInit();
    loadFAQData(); // Panggil saat controller diinisialisasi
  }

  //fungsi loadFAQData
  loadFAQData() async {
    try {
      isLoading.value = true; // Set isLoading ke true saat mulai memuat data
      //parsing data dari questionModel ke dalam loadedQuestion
      var loadedQuestions =
          questions.map((data) => QuestionModel.fromJson(data)).toList();
      //masukkin datanya ke observabel list QuestionsData yang udah dibuat di atas
      QuestionsData.assignAll(loadedQuestions);
    } catch (e) {
      print("Error loading FAQ data: $e");
    } finally {
      isLoading.value = false; // Selesai loading
    }
  }
}
