import Foundation
import Firebase
import FirebaseCore
import FirebaseFirestore
import GoogleSignIn
import FirebaseAnalytics

struct Q_struct {
    var theme: String
    var gender: String
    var category: String
    var age: String
    var url: String
    var username : String
    var userid : String
}

class QuestionnareData {
    //var questions = [Q_struct](repeating: (gender: "男性", category: "情報系", age: "19", url: "google.com"), count: 50)
    //var questions = [Q_struct](repeating: (gender: "男性", category: "情報系", age: "19", url: "google.com"), count: 50)
    var questions = [Q_struct]()
    let db = Firestore.firestore()
    //questions.append(Q_struct(gender: "男性", category: "情報系", age: "19", url: "google.com"))
    
    func makeQ(a: String, b: String, c: String, d: String, e: String, f: String){
        self.questions.append(Q_struct(theme: a, gender: a, category: b, age: c, url: d, username: e, userid: f))
    }
    
    //genderとageをとってくる
    
    //urlとthemeゲットする
    public func getAllReports(gender: String, age: String, completion: @escaping ([Q_struct])->()) -> (Void) {
        var result = [Q_struct]()
        let reportDocRef = db.collection("QuestionnareData").whereField("target_gender", isEqualTo: gender).whereField("target_age", isEqualTo: age)
        reportDocRef.getDocuments() { (querySnapshot, err) in
            if err == nil, let querySnapshot = querySnapshot {
                //var questions: [Q_struct]()
                for document in querySnapshot.documents {
                    let data = document.data()
                    let question = Q_struct(theme:data["theme"] as? String ?? "", gender: data["target_gender"] as? String ?? "", category: data["target_category"] as? String ?? "", age: data["target_age"] as? String ?? "", url: data["url"] as? String ?? "", username:data["userrname"] as? String ?? "",userid:data["userid"] as? String ?? "")
                    self.questions.append(question)
                    //要素数
                    print("\(self.questions.count) ")
                }
                result = self.questions
                print("result : \(result)")
                completion(self.questions)
            } else if err != nil {
                print("\(String(describing: err))")
                completion(self.questions)
            }
            
        }
    }
    
    //名前とパスワードから,url,themeの取得
    func get_url_theme(name: String, password: String, complete: @escaping(String, String) -> ()){
        
        let _: Void = db.collection("QuestionnareData").whereField("username", isEqualTo: name).whereField("userid", isEqualTo: password)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    
                    var url : String = ""
                    var theme : String = ""
                    
                    for document in querySnapshot!.documents {
                        
                        url = document.get("url") as! String
                        theme = document.get("theme") as! String
                        print("\(document.documentID) => \(document.data())")
                        
                    }
                    complete(url, theme)
                }
        }
    }
}


