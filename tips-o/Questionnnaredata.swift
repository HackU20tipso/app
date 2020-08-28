import Foundation
import Firebase
import FirebaseCore
import FirebaseFirestore
import GoogleSignIn
import FirebaseAnalytics

struct Q_struct {
    //var question_name: String
    var gender: String
    var category: String
    var age: String
    var url: String
}

class QuestionnareData {
    
    //var questions = [Q_struct](repeating: (gender: "男性", category: "情報系", age: "19", url: "google.com"), count: 50)
    //var questions = [Q_struct](repeating: (gender: "男性", category: "情報系", age: "19", url: "google.com"), count: 50)
    var questions = [Q_struct]()
    let db = Firestore.firestore()
    //questions.append(Q_struct(gender: "男性", category: "情報系", age: "19", url: "google.com"))
    
    func makeQ(a: String, b: String, c: String, d: String){
        self.questions.append(Q_struct(gender: a, category: b, age: c, url: d))
    }

    //データ全部持ってくる
    public func getAllReports(completion: @escaping ([Q_struct])->()) {
        let reportDocRef = db.collection("QuestionnareData")
        reportDocRef.getDocuments() { (querySnapshot, err) in
            if err == nil, let querySnapshot = querySnapshot {
                for document in querySnapshot.documents {
                    let data = document.data()
                    let question = Q_struct(gender: data["target_gender"] as? String ?? "", category: data["target_category"] as? String ?? "", age: data["target_age"] as? String ?? "", url: data["url"] as? String ?? "")
                    self.questions.append(question)
                    //要素数
                    print("\(self.questions.count) ")
                }
                completion(self.questions)
                //print("\(self.questions)")
            } else if err != nil {
                completion(self.questions)
                print("\(String(describing: err))")
            }
        }
    }
}

