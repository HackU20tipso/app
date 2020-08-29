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
    
    override init(){
        /*
         ThisUserName = data["name"] as? String
         ThisUserPassword = data["password"] as? String
         */
        x = ""
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
    
    var x : String
    
    //ドキュメントのIDを取得
    func getPath(name: String, password: String, complete: @escaping(String) -> ()){
        
        let _: Void = db.collection("AccountData").whereField("name", isEqualTo: name).whereField("password", isEqualTo: password)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    
                    var path_s : String = ""
                    for document in querySnapshot!.documents {
                        
                       
                        path_s = "\(document.documentID)"
                        print("\(document.documentID) => \(document.data())")
                        
                    }
                    complete(path_s)
                }
        }
    }
    
    
    //名前とパスワードから,年齢と性別を取得
    func get_age_gender(name: String, password: String, complete: @escaping(String, String) -> ()){
        
        let _: Void = db.collection("AccountData").whereField("name", isEqualTo: name).whereField("password", isEqualTo: password)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    
                    var age : String = ""
                    var gender : String = ""
                    
                    for document in querySnapshot!.documents {
                        
                        age = document.get("age") as! String
                        gender = document.get("gender") as! String
                        print("\(document.documentID) => \(document.data())")
                        
                    }
                    complete(age, gender)
                }
        }
    }
    
    //名前とパスワードから,年齢と性別と出身と所属の取得
    func get_all(name: String, password: String, complete: @escaping(String, String, String, String) -> ()){
        
        let _: Void = db.collection("AccountData").whereField("name", isEqualTo: name).whereField("password", isEqualTo: password)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    
                    var age : String = ""
                    var gender : String = ""
                    var belong : String = ""
                    var from : String = ""
                    
                    for document in querySnapshot!.documents {
                        
                        age = document.get("age") as! String
                        gender = document.get("gender") as! String
                        print("\(document.documentID) => \(document.data())")
                        
                    }
                    complete(age, gender, belong, from)
                }
        }
    }
    
    
    /*
     func getMedicinesName() -> [String] {
     var medicines = [String]()
     
     db.collection("medicines").getDocuments() { (querySnapshot, err) in
     if let err = err {
     print("Error getting documents: \(err)")
     } else {
     for document in querySnapshot!.documents {
     let medicineToBeAdded = document.get("name") as! String
     medicines.append(medicineToBeAdded)
     }
     }
     }
     return medicines
     }
     */
    
    
    
    //ポイントゲットする
    func getPoint(name: String, password: String, complete: @escaping (Int) -> ()) -> Bool{
        
        //ar result = [Int](repeating:200, count:10)
        
        let _: Void = db.collection("AccountData").whereField("name", isEqualTo: name).whereField("password", isEqualTo: password)
            .getDocuments() { (querySnapshot, err) in
                
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    
                    var myp = 200
                    for document in querySnapshot!.documents {
                        
                        
                        myp = document.get("point") as! Int
                       print("ここだああああああああああああ")
                        print("\(document.documentID) => \(document.data())")
        
                        
                    }
                    //result2 = result[0]
                    complete(myp)
                }
        }
        return true
    }
    
    //3ポイント減る
    func heru_Point(curPoint : Int, diffPoint : Int, path : String){
        var update_Point = curPoint + diffPoint
        let myRef = db.collection("AccountData").document(path)
        
        // Set the "capital" field of the city 'DC'
        myRef.updateData([
            "point": update_Point
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
    
    //ポイント更新
    /*
    func Add_point(){
        if let x = userPoint{
            userPoint! = 1 + x
            print("ば７\(userPoint!)\(x)")
        }
        else{
            print("ポイントを更新できませんでした")
        }
    }
 */
    
    
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
