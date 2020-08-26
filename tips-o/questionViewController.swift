
import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore
import GoogleSignIn
import FirebaseAnalytics

class questionViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource  {
    
    
    @IBOutlet weak var quesLabel: UILabel!
    @IBOutlet weak var urlTextField: UITextField!
    
    @IBOutlet weak var typepick: UIPickerView!
    @IBOutlet weak var targetpick: UIPickerView!
    @IBOutlet weak var themepick: UIPickerView!
    
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
    
    var category : String!
    var gender : String!
    var age : String!
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedPerson[pickerView.tag] = twoDimArray[pickerView.tag][row]
        var labelText = ""
        category = selectedPerson[0]
        gender = selectedPerson[1]
        age = selectedPerson[2]
        for i in selectedPerson{
            labelText += "\(i)  "
        }
        print(labelText)
        
        /* let item = compos[component][row]
         
         print("\(item)が選ばれた")
         
         let row1 = pickerView.selectedRow(inComponent: 0)
         let row2 = pickerView.selectedRow(inComponent: 1)
         
         let st = (row1,row2)
         
         print("現在選択されている行番号\(st)")
         
         let item1 = self.pickerView(pickerView, titleForRow: row1, forComponent: 0)
         let item2 = self.pickerView(pickerView, titleForRow: row2, forComponent: 1)
         
         let st2 = (item1!,item2!)
         
         print("現在選択されている項目名\(st2)")*/
    }
    /* let compos = [["10代","20代","30代","40代","それ以上"],["女性","男性","どちらでもない"]]
     
     let compos2 = [["心理系","情報系","食物系","生物系"]]
     
     func numberOfComponents(in pickerView: UIPickerView) -> Int {
     return compos.count
     }
     
     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
     let compo = compos[component]
     return compo.count
     }
     
     func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
     if component==0{
     return 100
     }else{
     return 130
     }
     
     
     }
     
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
     let item = compos [component][row]
     return item
     }
     
     
     
     func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
     let item = compos[component][row]
     
     print("\(item)が選ばれた")
     
     let row1 = pickerView.selectedRow(inComponent: 0)
     let row2 = pickerView.selectedRow(inComponent: 1)
     
     let st = (row1,row2)
     
     print("現在選択されている行番号\(st)")
     
     let item1 = self.pickerView(pickerView, titleForRow: row1, forComponent: 0)
     let item2 = self.pickerView(pickerView, titleForRow: row2, forComponent: 1)
     
     let st2 = (item1!,item2!)
     
     print("現在選択されている項目名\(st2)")
     
     }*/
    
    var docRef2: DocumentReference!
    var docRef_age: DocumentReference!
    var docRef_gender: DocumentReference!
    var docRef_category: DocumentReference!
    
    
    
    @IBAction func saveTapped2(_ sender: Any) {
        
        guard let quesText = quesLabel.text, !quesText.isEmpty else {return}
        guard let urlAuther = urlTextField.text, !urlAuther.isEmpty else {return}
        guard let targetcategory = category, !targetcategory.isEmpty else {return}
        guard let targetgender = gender, !targetgender.isEmpty else {return}
        guard let targetage = age, !targetage.isEmpty else {return}
        
        
        let DataToSave2 : [String: Any] = ["url" : urlAuther ,"target_age" : targetage, "target_category" : targetcategory, "target_gender" : targetgender ]
        
        let DataToSave_category : [String: Any] = ["url" : urlAuther ,"target_age" : targetage]
        
        docRef2.setData(DataToSave2){ (error) in
            if let error = error{
                print("get on an error : \(error.localizedDescription)")
            }
            else{
                print("data has been saved!")
            }
        }
        
        docRef_category.setData(DataToSave_category){ (error) in
            if let error = error{
                print("get on an error : \(error.localizedDescription)")
            }
            else{
                print("data has been saved!")
            }
        }
    }
    
    //var user = firebase.auth().currentUser;
    
    //let usrid : Void = Analytics.setUserID("あああ")
    
    //let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //pickerの設定
        for _ in 0 ... 2{
            twoDimArray.append([])
        }
        
        themepick.tag = 0
        typepick.tag = 1
        targetpick.tag = 2
        
        twoDimArray[0] = ["心理系","情報系","食物系","その他"]
        twoDimArray[1] = ["女性","男性","どちらでもない"]
        twoDimArray[2] = ["10代","20代","30代","40代","それ以上","全年齢"]
        
        selectedPerson = ["心理系","女性","10代"]
        
        targetpick.delegate = self
        targetpick.dataSource = self
        themepick.delegate = self
        themepick.dataSource = self
        typepick.delegate = self
        typepick.dataSource = self
        
        // Do any additional setup after loading the view.
        
        //firestoreの設定
        docRef2 = Firestore.firestore().collection("QuestionnareData").document()
        
        var gender_string: String! = "どちらでもない"
        
        for i in 0 ... 2 {
            if(twoDimArray[1][i] == gender){
                gender_string = twoDimArray[1][i]
            }
        }
        
        var category_string: String! = "その他"
        
        for i in 0 ... 3 {
            if(twoDimArray[0][i] == gender){
                category_string = twoDimArray[0][i]
                //category_string = "そんなバナナ"
            }
        }
        
        docRef_category = Firestore.firestore().collection(category_string).document(gender_string)
        
    }
    
    //キーボードしまう
    @IBAction func firstEnd(_ sender: Any) {
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

