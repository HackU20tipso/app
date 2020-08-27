
import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore
import GoogleSignIn
import FirebaseAnalytics



class accountViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    
    @IBOutlet weak var quateLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var belongTextField: UITextField!
    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var agePickerView: UIPickerView!
    @IBOutlet weak var genderPickerView: UIPickerView!
    @IBOutlet weak var belongPickerView: UIPickerView!
    @IBOutlet weak var fromPickerView: UIPickerView!
    
    var twoDimArray = [[String]]()
       var selectedPerson = [String]()
       
       func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }
       
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
           return twoDimArray[pickerView.tag].count
       }
       
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
           return twoDimArray[pickerView.tag][row]
       }
    
    var age: String!
    var gender : String!
    var belong : String!
    var from : String!
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
    selectedPerson[pickerView.tag] = twoDimArray[pickerView.tag][row]
    var labelText = ""
    age = selectedPerson[0]
    gender = selectedPerson[1]
    belong = selectedPerson[2]
    from = selectedPerson[3]
    for i in selectedPerson{
        labelText += "\(i)  "
    }
    print(labelText)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //var docRef: CollectionReference = db.collection("accountData")
    
    var docRef: DocumentReference!
    var docRef3: DocumentReference!
    var docRef_age: DocumentReference!
    var docRef_gender: DocumentReference!
    var docRef_belong: DocumentReference!
    var docRef_from: DocumentReference!
    
    @IBAction func saveTapped(_ sender: Any) {
        guard let nameText = nameTextField.text, !nameText.isEmpty else {return}
        guard let ageAuther = age, !ageAuther.isEmpty else {return}
        guard let genderAuther = gender, !ageAuther.isEmpty else {return}
        guard let belongAuther = belong, !belongAuther.isEmpty else {return}
        guard let fromAuther = from, !fromAuther.isEmpty else {return}
        let DataToSave: [String: Any] = ["name" : nameText, "age" : ageAuther, "gender" : genderAuther, "belong" : belongAuther, "from" : fromAuther]
        
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
            //self.label.text = "\(data)"
            
        }
        
        //pickerの設定
        for _ in 0 ... 3{
            twoDimArray.append([])
        }
        
        agePickerView.tag = 0
        genderPickerView.tag = 1
        belongPickerView.tag = 2
        fromPickerView.tag = 3
        
        twoDimArray[0] = ["10代","20代","30代","40代","それ以上"]
        twoDimArray[1] = ["女性","男性","どちらでもない"]
        twoDimArray[2] = ["中高生","大学生","大学院生","社会人"]
        twoDimArray[3] = ["北海道","青森県","岩手県","宮城県","秋田県","山形県","福島県","茨城県","栃木県","群馬県","埼玉県","千葉県","東京都","神奈川県","新潟県","富山県","石川県","福井県","山梨県","長野県","岐阜県","静岡県","愛知県","三重県","滋賀県","京都府","大阪府","兵庫県","奈良県","和歌山県","鳥取県","島根県","岡山県","広島県","山口県","徳島県","香川県","愛媛県","高知県","福岡県","佐賀県","長崎県","熊本県","大分県","宮崎県","鹿児島県","沖縄県"]
        
        selectedPerson = ["","","",""]
        
        agePickerView.delegate = self
        agePickerView.dataSource = self
        genderPickerView.delegate = self
        genderPickerView.dataSource = self
        belongPickerView.delegate = self
        belongPickerView.dataSource = self
        fromPickerView.delegate = self
        fromPickerView.dataSource = self
        
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
