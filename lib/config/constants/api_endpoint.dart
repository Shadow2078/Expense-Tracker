class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  // For Windows
  static const String baseUrl = "http://10.12.2.208:5000/api/";
  // For MAC
  // static const String baseUrl = "http://localhost:3000/api/v1/";
  //static const String baseUrl = "http://192.168.4.4:3000/api/v1/";

  // ====================== Auth Routes ======================
  static const String login = "user/login";
  static const String register = "http://10.12.2.208:5000/api/user/create";
  // static const String getAllStudent = "auth/getAllStudents";
  // static const String getStudentsByBatch = "auth/getStudentsByBatch/";
  // static const String getStudentsByCourse = "auth/getStudentsByCourse/";
  // static const String updateStudent = "auth/updateStudent/";
  // static const String deleteStudent = "auth/deleteStudent/";
  // static const String imageUrl = "http://10.0.2.2:3000/uploads/";
  // static const String uploadImage = "auth/uploadImage";

  // ====================== Batch Routes ======================
  // static const String createBatch = "batch/createBatch";
  // static const String getAllBatch = "batch/getAllBatches";

  // // ====================== Course Routes ======================
  // static const String createCourse = "course/createCourse";
  // static const String deleteCourse = "course/";
  // static const String getAllCourse = "course/getAllCourse";

  static const String getallEvents = "/event/get_all_events";

  static const limitPage = 2;
}
