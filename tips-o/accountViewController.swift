
import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore

class accountViewController: UIViewController {
    
    @IBOutlet weak var quateLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var belong: UITextField!
    @IBOutlet weak var from: UITextField!
    
    //var docRef: CollectionReference = db.collection("accountData")
    
    var docRef: DocumentReference!
    
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
    }
    
    @IBOutlet weak var quesLabel: UILabel!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var themeTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var targetTextField: UITextField!
    
    @IBAction func saveTapped2(_ sender: Any) {
        
        guard let quesText = quesLabel.text, !quesText.isEmpty else {return}
        guard let urlAuther = urlTextField.text, !urlAuther.isEmpty else {return}
        guard let themeAuther = themeTextField.text, !themeAuther.isEmpty else {return}
        guard let targetAuther = targetTextField.text, !targetAuther.isEmpty else {return}
        
        // Add a second document with a generated ID.
       
        
        //docRef.document("profile").setData(DataToSave)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        docRef = Firestore.firestore().collection("accountData").document("profile")
           // Do any additional setup after loading the view.
    }
    
    
   
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
