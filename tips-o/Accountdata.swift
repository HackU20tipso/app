import Foundation
import Firebase
import FirebaseCore
import FirebaseFirestore
import GoogleSignIn
import FirebaseAnalytics

import Firebase


class AppUser {
    
    var userPoint: Int?
    var nameText1 : String!
    let ageAuther : String!
    let genderAuther : String!
    let belongAuther : String!
    let fromAuther : String!
    let db = Firestore.firestore()
    let saveDocument = Firestore.firestore().collection("AccountData").document()
    var userRef: DocumentReference!
    var isSuccess = true
    
    /*
    init(data: [String: Any]){
        
        nameText1 = data["name"] as? String
        ageAuther = data["age"] as? String
        genderAuther = data["gender"] as? String
        belongAuther = data["belong"] as? String
        fromAuther = data["from"] as? String
        userPoint = data["userPoint"] as? Int
 
    }
 */
 
    
    init(){
           nameText1 = ""
           ageAuther = ""
           genderAuther = ""
           belongAuther = ""
           fromAuther = ""
           userPoint = 0
       }
 
    
    
    func Add_point(){
        if let x = userPoint{
            userPoint! = 1 + x
            print("ば７\(userPoint!)\(x)")
        }
        else{
            print("ポイントを更新できませんでした")
        }
    }
    
    public func setAccount(/*authorRef: String,*/
                           name: String,
                           age: String,
                           gender: String,
                           belong: String,
                           from: String,
                           point: Int,
                           completion: @escaping (Bool)->(Void)) {
        self.getUserReference() { userRef in
            self.userRef = userRef
        }
        saveDocument.setData([
            //"authorRef": self.userRef as Any,
            "name" : name/*self.nameText as Any*/,
            "age" : age ,
            "gender" : gender,
            "belong" : belong,
            "from" : from,
            "point" : userPoint!
            
        ]) { error in
            if error != nil {
                fatalError("\(String(describing: error))")
                self.isSuccess = false
                completion(self.isSuccess)
            }
            completion(self.isSuccess)
        }
    }
    
    //private
    public func getUserReference(completion: @escaping (DocumentReference)->()) {
        let userRefString = db.collection("AccountData").document()
        let userRef = db.document(userRefString.path)
        completion(userRef)
    }
}
