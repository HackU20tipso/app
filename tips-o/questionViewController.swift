
import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore
import GoogleSignIn
import FirebaseAnalytics



class questionViewController: UIViewController  {

    
    @IBOutlet weak var quesLabel: UILabel!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var themeTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var targetTextField: UITextField!
    
    var docRef2: DocumentReference!
    
    @IBAction func saveTapped2(_ sender: Any) {
        
        guard let quesText = quesLabel.text, !quesText.isEmpty else {return}
        guard let urlAuther = urlTextField.text, !urlAuther.isEmpty else {return}
        guard let themeAuther = themeTextField.text, !themeAuther.isEmpty else {return}
        guard let targetAuther = targetTextField.text, !targetAuther.isEmpty else {return}
        
        
        let DataToSave2 : [String: Any] = ["url" : urlAuther , "theme" : themeAuther, "target" : targetAuther]
        
        docRef2.setData(DataToSave2){ (error) in
            if let error = error{
                print("get on an error : \(error.localizedDescription)")
            }
            else{
                print("data has been saved!")
            }
        }
               
        
        // Add a second document with a generated ID.
       
        
        //docRef.document("profile").setData(DataToSave)
    
    }
    
    //var user = firebase.auth().currentUser;
    
    //let usrid : Void = Analytics.setUserID("あああ")
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        docRef2 = Firestore.firestore().collection("QuestionnareData").document("question")
           // Do any additional setup after loading the view.
        
    }
    
    

    @IBAction func firstEnd(_ sender: Any) {
    }
    @IBAction func secEnd(_ sender: Any) {
    }
    @IBAction func thiEnd(_ sender: Any) {
    }
    @IBAction func forEnd(_ sender: Any) {
    }
    /*
     @IBAction func cEnd(_ sender: Any) {
     }
     // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

