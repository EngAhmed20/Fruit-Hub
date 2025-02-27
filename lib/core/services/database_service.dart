abstract class DatabaseService{
  Future<void>addData({required String path,required Map<String,dynamic>data,String?docId});
  Future<dynamic>getData({required String path,String? docId,Map<String,dynamic>? query});
  Future<bool>checkIfDataExists({required String path,required String docId});
  Future<void> updateData({required String path, required String docId, required Map<String, dynamic> data});

}