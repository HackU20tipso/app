
import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore
import GoogleSignIn
import FirebaseAnalytics



class accountViewController: UIViewController,UIPickerViewDataSource , UIPickerViewDelegate  {
    
    var pickerView: UIPickerView = UIPickerView()
    let list = ["", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    
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
        docRef = Firestore.firestore().collection("AccountData").document()
        docRef2 = Firestore.firestore().collection("QuestionnareData").document("question")
           // Do any additional setup after loading the view.
        
    }
    
    
    
    @IBAction func nameOut(_ sender: Any) {
    }
    
    @IBAction func ageEnd(_ sender: Any) {
    }
    
    @IBAction func belongEnd(_ sender: Any) {
    }
    
    @IBAction func fromEnd(_ sender: Any) {
    }
    
    @IBAction func qEnd(_ sender: Any) {
    }
    
    @IBAction func themeEnd(_ sender: Any) {
    }
    
    @IBAction func targetEnd(_ sender: Any) {
    }
    
    @IBAction func End(_ sender: Any) {
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
