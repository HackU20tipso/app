
import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore
import GoogleSignIn
import FirebaseAnalytics


class questionViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource  {
    
    
    
    //ユーザーの名前/パスワード
    //fromAppDelegate.ThisUsername
    //fromAppDelegate.Thispassword
    let fromAppDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    //処理 completionの返り値と同じ型
    
    
    
    
    @IBOutlet weak var label: UILabel!
    var currentPoint : Int = 100
    var userpath : String = ""
    
    
    @IBOutlet weak var theme: UITextField!
    
    @IBOutlet weak var quesLabel: UILabel!
    @IBOutlet weak var urlTextField: UITextField!
    
    @IBOutlet weak var typepick: UIPickerView!
    @IBOutlet weak var targetpick: UIPickerView!
    @IBOutlet weak var themepick: UIPickerView!
    
    var twoDimArray = [[String]]()
    var selectedPerson = [String]()
    var mydata : Int = 0
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
        
    }
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
        
        
        if(category == "情報系"){
            if(gender == "女性"){
                docRef_category = Firestore.firestore().collection("情報系").document("女性")
            }
            else if(gender == "男性"){
                docRef_category = Firestore.firestore().collection("情報系").document("男性")
            }
            else{
                docRef_category = Firestore.firestore().collection("情報系").document("どちらでもない")
            }
        }
        else if(category == "心理系"){
            if(gender == "女性"){
                docRef_category = Firestore.firestore().collection("情報系").document("女性")
            }
            else if(gender == "男性"){
                docRef_category = Firestore.firestore().collection("情報系").document("男性")
            }
            else{
                docRef_category = Firestore.firestore().collection("情報系").document("どちらでもない")
            }
        }
        else if(category == "生活系"){
            if(gender == "女性"){
                docRef_category = Firestore.firestore().collection("生活系").document("女性")
            }
            else if(gender == "男性"){
                docRef_category = Firestore.firestore().collection("生活系").document("男性")
            }
            else{
                docRef_category = Firestore.firestore().collection("生活系").document("どちらでもない")
            }
        }
        else{
            if(gender == "女性"){
                docRef_category = Firestore.firestore().collection("その他").document("女性")
            }
            else if(gender == "男性"){
                docRef_category = Firestore.firestore().collection("その他").document("男性")
            }
            else{
                docRef_category = Firestore.firestore().collection("その他").document("どちらでもない")
            }
        }
        
        
        if(currentPoint >= 3){
            docRef2.setData(DataToSave2){ (error) in
                if let error = error{
                    print("get on an error : \(error.localizedDescription)")
                }
                else{
                    print("888888888data has been saved!")
                }
            }
            print("バナナ")
            docRef_category.setData(DataToSave_category){ (error) in
                if let error = error{
                    print("get on an error : \(error.localizedDescription)")
                }
                else{
                    print("data has been saved!")
                }
            }
        }
        else{
            
        }
    }
    
    let me = AppUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var points = [Int](repeating: 200,count: 10)
        var path : String = ""
        let isOK = me.getPoint(name: self.fromAppDelegate.ThisUsername, password: self.fromAppDelegate.Thispassword, complete:{result in
            print("みずきち\(result)")
            var myPath : String = ""
            self.currentPoint = result
            self.label.text = "現在のポイントは\(self.currentPoint)です"
        })
             print("パスの取得")
             print("\(self.me.x)")
             
            print(self.userpath)
             
            self.label.text = "現在のポイントは\(self.currentPoint)です"
             
             print("あああああああああああああああああああ")
             print(points[0])
             
             
             print("ここです！！！！！")
             print(self.fromAppDelegate.ThisUsername)
             //fromAppDelegate.Thispassword = "うふ"
             print(self.fromAppDelegate.Thispassword)
             
             //pickerの設定
             for _ in 0 ... 2{
                 self.twoDimArray.append([])
             }
             
             self.themepick.tag = 0
             self.typepick.tag = 1
             self.targetpick.tag = 2
             
            self.twoDimArray[0] = ["心理系","情報系","食物系","その他"]
            self.twoDimArray[1] = ["女性","男性","どちらでもない"]
            self.twoDimArray[2] = ["10代","20代","30代","40代","それ以上","全年齢"]
             
            self.selectedPerson = ["心理系","女性","10代"]
             
            self.targetpick.delegate = self
            self.targetpick.dataSource = self
            self.themepick.delegate = self
            self.themepick.dataSource = self
            self.typepick.delegate = self
            self.typepick.dataSource = self
             
            self.docRef2 = Firestore.firestore().collection("QuestionnareData").document()
        
        var docID : String = ""
        print("パスの取得")
        me.getPath(name: self.fromAppDelegate.ThisUsername!, password: self.fromAppDelegate.Thispassword!, complete:{result in
            print("きたこれ\(result)")
            docID = result
        })
        
        /*
        var myPath : String = ""
       
        
        
        
        
        print("\(me.x)")
        
        print(userpath)
        
        label.text = "現在のポイントは\(currentPoint)です"
        
        print("あああああああああああああああああああ")
        print(points[0])
        
        
        print("ここです！！！！！")
        print(self.fromAppDelegate.ThisUsername)
        //fromAppDelegate.Thispassword = "うふ"
        print(self.fromAppDelegate.Thispassword)
        
        //pickerの設定
        for _ in 0 ... 2{
            self.twoDimArray.append([])
        }
        
        self.themepick.tag = 0
        self.typepick.tag = 1
        self.targetpick.tag = 2
        
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
        
        docRef2 = Firestore.firestore().collection("QuestionnareData").document()
        */
        
    }
    
    //キーボードしまう
    @IBAction func firstEnd(_ sender: Any) {
    }
    
    
}
