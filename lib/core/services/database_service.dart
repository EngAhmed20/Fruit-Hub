abstract class DatabaseService{
  Future<void>addData({required String path,required Map<String,dynamic>data,String?docId});
  Future<dynamic>getData({required String path,String? docId,Map<String,dynamic>? query,bool?searchByLetter=false});
  Future<bool>checkIfDataExists({required String path,required String docId});
  Future<String?> updateData({required String path,  String? docId, required Map<String, dynamic> data,String? fieldName, // اسم الحقل الذي سيتم البحث به
    dynamic fieldValue,});

}