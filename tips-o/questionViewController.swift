
import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore
import GoogleSignIn
import FirebaseAnalytics



class questionViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource  {

    
    @IBOutlet weak var quesLabel: UILabel!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var themeTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    
    
    @IBOutlet weak var targetTextField: UITextField!
    
    @IBOutlet weak var targetpick: UIPickerView!
    let compos = [["女性","男性","どちらでもない"]]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return compos.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let compo = compos[component]
        return compo.count
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
    
            return 120
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let item = compos [component][row]
        return item
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let item = compos[component][row]
        
        print("\(item)が選ばれた")
        
        let row1 = pickerView.selectedRow(inComponent: 0)
        /*let row2 = pickerView.selectedRow(inComponent: 1)
        
        let st = (row1,row2)*/
        
        print("現在選択されている行番号\(row1)")
        
        let item1 = self.pickerView(pickerView, titleForRow: row1, forComponent: 0)
        /*let item2 = self.pickerView(pickerView, titleForRow: row2, forComponent: 1)
        
        let st2 = (item1!,item2!)*/
        
        print("現在選択されている項目名\(String(describing: item1))")
        
    }
    var docRef2: DocumentReference!
    
    @IBAction func saveTapped2(_ sender: Any) {
        
        guard let quesText = quesLabel.text, !quesText.isEmpty else {return}
        guard let urlAuther = urlTextField.text, !urlAuther.isEmpty else {return}
        guard let themeAuther = themeTextField.text, !themeAuther.isEmpty else {return}
        guard let targetAuther =
        /*targetpick.textInputContextIdentifier,
        !targetAuther.isEmpty else{return}*/
        targetTextField.text, !targetAuther.isEmpty else {return}
        
        
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
      
        targetpick.delegate = self
        targetpick.dataSource = self
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

