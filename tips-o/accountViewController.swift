
import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore
import GoogleSignIn
import FirebaseAnalytics



class accountViewController: UIViewController{
    
    @IBOutlet weak var quateLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var belong: UITextField!
    @IBOutlet weak var from: UITextField!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //var docRef: CollectionReference = db.collection("accountData")
    
    var docRef: DocumentReference!
    var docRef3: DocumentReference!
    
    @IBAction func saveTapped(_ sender: Any) {
        guard let nameText = nameTextField.text, !nameText.isEmpty else {return}
        guard let ageAuther = ageTextField.text, !ageAuther.isEmpty else {return}
        guard let belongAuther = belong.text, !belongAuther.isEmpty else {return}
        guard let fromAuther = from.text, !fromAuther.isEmpty else {return}
        let DataToSave: [String: Any] = ["name" : nameText, "age" : ageAuther, "belong" : belongAuther, "from" : fromAuther]
        
        //docRef.document("profile").setData(DataToSave)
    
        
        docRef.setData(DataToSave){ (error) in
            if let error = error{
                print("get on an error : \(error.localizedDescription)")
            }
            else{
                print("data has been saved!")
            }
        }
        docRef3.setData(DataToSave){ (error) in
            if let error = error{
                print("get on an error : \(error.localizedDescription)")
            }
            else{
                print("data has been saved!")
            }
        }
    }

    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        docRef = Firestore.firestore().collection("AccountData").document()
        print("バナナ")
        docRef3 = Firestore.firestore().collection("バナナ").document("バナナ")

        
        
        Firestore.firestore().collection("AccountData").document("EcAJ8QLDwFvCg5tPPK4w").getDocument { (snap, error) in
            if let error = error {
                fatalError("\(error)")
            }
            guard let data = snap?.data() else { return }
            print(data)
            self.label.text = "\(data)"
            
        }
        
    }
    
    
    
    
    
    @IBAction func nameOut(_ sender: Any) {
    }
    
    @IBAction func ageEnd(_ sender: Any) {
    }
    
    @IBAction func belongEnd(_ sender: Any) {
    }
    
    @IBAction func fromEnd(_ sender: Any) {
    }
    
   

}
