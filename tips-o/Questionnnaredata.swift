import Foundation
import Firebase
import FirebaseCore
import FirebaseFirestore
import GoogleSignIn
import FirebaseAnalytics

struct Q_struct {
    var target: String
    var category: String
    var age: String
    var url: String
}

class QuestionnareData {
    
    var questions = [Q_struct]()
    let db = Firestore.firestore()
    //questions.append(Q_struct(target: "男性", category: "情報系", age: "19", url: "google.com"))
    
    func makeQ(a: String, b: String, c: String, d: String){
        questions.append(Q_struct(target: a, category: b, age: c, url: d))
    }

    public func getAllReports(completion: @escaping ([Q_struct])->()) {
        let reportDocRef = db.collection("QuestionnareData")
        reportDocRef.getDocuments() { (querySnapshot, err) in
            if err == nil, let querySnapshot = querySnapshot {
                for document in querySnapshot.documents {
                    let data = document.data()
                    let question = Q_struct(target: data["target"] as? String ?? "", category: data["category"] as? String ?? "", age: data["age"] as? String ?? "", url: data["url"] as? String ?? "")
                    self.questions.append(question)
                }
                completion(self.questions)
                print("\(self.questions)")
            } else if err != nil {
                completion(self.questions)
                print("\(String(describing: err))")
            }
        }
    }
}


