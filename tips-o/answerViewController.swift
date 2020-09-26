

import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore
import WebKit



class answerViewController: UIViewController {
    
    
    @IBOutlet var webView: WKWebView!
    
    // シーン移動の際に設定されるWebデータ
    var data:(name:String, url:String)?
    
    let fromAppDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ここです！！！！！")
        print(fromAppDelegate.ThisUsername)
        //fromAppDelegate.Thispassword = "うふ"
        print(fromAppDelegate.Thispassword)
         
        
        // dataが設定されていればwebDataに代入する
        guard let webData = data else {
            return
        }
       
        
        // Do any additional setup after loading the view.
        // 表示するWebページのURLRequestを作る
        let myURL = URL(string: webData.url)
        let myRequest = URLRequest(url: myURL!)
        print(myRequest)
        // Webを読み込む
        webView.load(myRequest)
        
    }
    
   
    @IBSegueAction func get_Point(_ coder: NSCoder) -> WebListTableTableViewController {
        
        // アラートを作る
        
               let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
               alert.title = "1ポイント獲得！！！！"
               //alert.message = "3ポイント消費しました"
               
               // ボタン1
               alert.addAction(
                   UIAlertAction(
                       title: "OK",
                       style: .default,
                       handler: {(action) -> Void in
                           self.hello(action.title!)
                   })
               )
        // アラートを表示する
               self.present(
                   alert,
                   animated: true,
                   completion: {
                       // 表示完了後に実行
                       print("アラートが表示された")
               }
               )
 
 
 
        return WebListTableTableViewController
        
    }
    
    /*
    @IBAction func getPoint(_ sender: Any) {
        // アラートを作る
        
               let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
               alert.title = "1ポイント獲得！！！！"
               //alert.message = "3ポイント消費しました"
               
               // ボタン1
               alert.addAction(
                   UIAlertAction(
                       title: "OK",
                       style: .default,
                       handler: {(action) -> Void in
                           self.hello(action.title!)
                   })
               )
        // アラートを表示する
               self.present(
                   alert,
                   animated: true,
                   completion: {
                       // 表示完了後に実行
                       print("アラートが表示された")
               }
               )
 
 
 
    }
 */
    
    // 選択で実行するメソッド
    func hello(_ msg:String) {
        print(msg)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
}
