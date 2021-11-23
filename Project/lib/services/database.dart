import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class getDoc extends StatelessWidget {
  final String documentId;

  getDoc(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference home = FirebaseFirestore.instance.collection('home');

    return FutureBuilder<DocumentSnapshot>(
      future: home.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          print(data);
        }

        return Text("loading");
      },
    );
  }
}


/*class getDoc {
  final String documentId;

  getDoc(this.documentId);
  CollectionReference home = FirebaseFirestore.instance.collection('home');

  //stream
  Stream<QuerySnapshot> get doc {
    return home.snapshots();
  }
}*/
