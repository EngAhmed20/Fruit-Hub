import 'package:cloud_firestore/cloud_firestore.dart';
import 'database_service.dart';

class FirestoreService implements DatabaseService{
  FirebaseFirestore firestore=FirebaseFirestore.instance;
  @override
  Future<void> addData({required String path, required Map<String, dynamic> data,String?docId}) async{
    if(docId!= null){
      await firestore.collection(path).doc(docId).set(data);
    }else{
      await firestore.collection(path).add(data);

    }
  }

  @override
  Future<dynamic> getData({required String path, String? docId,Map<String,dynamic>?query}) async{
    if(docId!=null){
      var data=await firestore.collection(path).doc(docId).get();
      return data.data() as Map<String,dynamic>;
    }
    Query<Map<String,dynamic>> data= firestore.collection(path);
    if(query!=null){
      if (query['filterBy'] != null && query['filterValue'] != null) {
        data = data.where(query['filterBy'], isEqualTo: query['filterValue']);
      }
      if(query['orderBy']!=null){
        var orderByFiled=query['orderBy'];
        var descending=query['descending'];
        data=data.orderBy(orderByFiled, descending: descending);

      }
      if(query['limit']!=null){
        var limit=query['limit'];
        data=data.limit(limit);
      }
      var result=await data.get();
      return result.docs.map((doc)=> doc.data()).toList();
    }
    var result=await data.get();

    return result.docs.map((e)=> e.data()).toList();



  }

  @override
  Future<bool> checkIfDataExists({required String path, required String docId}) async{
   var data=await firestore.collection(path).doc(docId).get();
   return data.exists;
  }

  @override
  Future<void> updateData({required String path, required String docId, required Map<String, dynamic> data}) async {
    await firestore.collection(path).doc(docId).update(data);

  }


}
