//  ViewController.swift
import UIKit

//var TodoKobetsunonakami = [String]()

//classの継承を追加
class addlistViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    //UITableView、numberOfRowsInSectionの追加(表示するcell数を決める)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //戻り値の設定(表示するcell数)
        print("モテモテ\(TodoKobetsunonakami.count)")
        return TodoKobetsunonakami.count
    }

    //UITableView、cellForRowAtの追加(表示するcellの中身を決める)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("のだめ")
        //変数を作る
        let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        //変数の中身を作る
        TodoCell.textLabel!.text = TodoKobetsunonakami[indexPath.row]
        //戻り値の設定（表示する中身)
        print("ううううううあああああああ")
        print("\(TodoCell.textLabel!.text)")
        return TodoCell
    }


    //最初からあるコード
    override func viewWillAppear(_ animated: Bool) {
        print("フィルタリング")
        //super.viewDidLoad()
        //追加画面で入力した内容を取得する
        if UserDefaults.standard.object(forKey: "TodoList") != nil {
            print("どうですかねえ")
            TodoKobetsunonakami = UserDefaults.standard.object(forKey: "TodoList") as! [String]
            print("どうですかねえ....")
        }
        else{
            print("だめでした...")
        }
    }

    //最初からあるコード
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
