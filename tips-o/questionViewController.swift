
import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore
import GoogleSignIn
import FirebaseAnalytics


class questionViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource  {
    
    let me = AppUser()
    //ユーザーのdocumentID
    var docID : String = ""
    //ユーザーの名前/パスワード
    //fromAppDelegate.ThisUsername
    //fromAppDelegate.Thispassword
    let fromAppDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
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
        
    }
    
    var docRef2: DocumentReference!
    var docRef_category: DocumentReference!

    
    @IBAction func saveTapped2(_ sender: Any) {
        
        guard let urlAuther = urlTextField.text, !urlAuther.isEmpty else {return}
        guard let targetcategory = category, !targetcategory.isEmpty else {return}
        guard let targetgender = gender, !targetgender.isEmpty else {return}
        guard let targetage = age, !targetage.isEmpty else {return}
        guard let themetag = theme.text, !themetag.isEmpty else {return}
        
        let DataToSave2 : [String: Any] = ["url" : urlAuther ,"target_age" : targetage, "target_category" : targetcategory, "target_gender" : targetgender ,"theme" : themetag]
        
        //ポイント3より大きかったらボタン押せる
       
        if(self.currentPoint >= 3){
            print("どうなってます...?")
            docRef2.setData(DataToSave2){ (error) in
                if let error = error{
                    print("get on an error : \(error.localizedDescription)")
                }
                else{
                    print("888888888data has been saved!")
                }
            }
            
            self.me.heru_Point(curPoint : currentPoint, diffPoint : -3, path : docID)
            
            var x : Int = 0
            let _ = self.me.getPoint(name: self.fromAppDelegate.ThisUsername, password: self.fromAppDelegate.Thispassword, complete:{result in
                print("みずきち\(result)")
                self.currentPoint = result
                self.label.text = "現在のポイントは\(self.currentPoint)です"
                x = self.currentPoint
            })
            
        }
        else{
            self.label.text = "3ポイント以上必要です"
        }
    }
    
    
    
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
        
        
        print("パスの取得")
        me.getPath(name: self.fromAppDelegate.ThisUsername!, password: self.fromAppDelegate.Thispassword!, complete:{result in
            print("きたこれ\(result)")
            self.docID = result
        })
        
    }
    
    //キーボードしまう
    @IBAction func firstEnd(_ sender: Any) {
    }
    
    @IBAction func labelEnd(_ sender: Any) {
    }
    
}
