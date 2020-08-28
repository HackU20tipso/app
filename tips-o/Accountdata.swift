import Foundation
import Firebase
import FirebaseCore
import FirebaseFirestore
import GoogleSignIn
import FirebaseAnalytics

import Firebase

struct A_struct {
    var name: String
    var age: String
    var gender: String
    var from: String
    var belong: String
    var point: Int
    var password: String
    
}



class AppUser : NSObject {
    
    /*
    static let instance = AppUser()
    
    var ThisUserName: String
    static var ThisUserPassword: String!
    
    */
    
    /*
    public func get_Username(x : String){
        AppUser.ThisUserName = x
    }
    public func Username() -> String{
        return (AppUser.ThisUserName ?? "")
    }
  */
   
    
    var isEmpty2 : String = ""
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
    
    var accounts = [A_struct]()
    
    func makeA(a: String, b: String, c: String, d: String, e: String, f: Int, g :String){
        accounts.append(A_struct(name: a, age: b, gender: c, from: d, belong: e, point: f, password: g))
    }
    
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
    
    /*
    init(data: [String: Any]) {
        ThisUserName: data["name"] as! String
        ThisUserPassword: data["Password"] as! String
    }
 */
    
    override init(){
        /*
        ThisUserName = data["name"] as? String
        ThisUserPassword = data["password"] as? String
         */
        nameText1 = ""
        ageAuther = ""
        genderAuther = ""
        belongAuther = ""
        fromAuther = ""
        userPoint = 0
    }
    
    //名前とパスワードが一致する人がいるかどうか -> true
    func isMatch(name: String, password: String, complete: @escaping (Bool) -> Void) -> Bool{
        
        let _: Void = db.collection("AccountData").whereField("name", isEqualTo: name).whereField("password", isEqualTo: password)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    
                    var isEmpty : String = ""
                    for document in querySnapshot!.documents {
                        
                        print("代入するよ")
                        isEmpty = document.get("name") as! String
                        
                        print("\(document.documentID) => \(document.data())")
                         
                    }
                    
                    complete(isEmpty == name)
                }
        }
        
        if self.isEmpty2 == name {
            print("\(self.isEmpty2)")
            self.isEmpty2 = ""
            return true
        }
        else{
            print("\(self.isEmpty2)")
            print("こっち...?")
            self.isEmpty2 = ""
            return false
        }
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
        password :String,
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
            "point" : userPoint,
            "password" : password
            
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
    public func getUserReference(completion: @escaping (DocumentReference)->()) -> String{
        let userRefString = db.collection("AccountData").document()
        let userRef = db.document(userRefString.path)
        
        completion(userRef)
        //print("\(userRefString.path)")
        return userRefString.path
    }
}
