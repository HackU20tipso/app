//
//  WebListTableTableViewController.swift
//  tips-o
//
//  Created by 藤元彩花 on 2020/08/26.
//  Copyright © 2020 百塚真弥. All rights reserved.
//

import UIKit

let qsectionTitle = ["情報系","心理系","食物系"]

struct qSetdata{
    var name: String
    var url: String
}



// セルに表示するデータ
var qsection0:[(String,String)] = []

/*
var 1section0 = [
    (name:"猫", url:"https://docs.google.com/forms/d/e/1FAIpQLSf7MIwI54xkdPIg9cDZ1lnYH-6mPRwstjgvqZWkvUjf-vy22g/viewform?usp=pp_url&entry.204507780=%E5%A5%BD%E3%81%8D%E3%81%A7%E3%81%99"),
    (name:"国立天文台", url:"https://www.nao.ac.jp"),
    (name:"東京都美術館", url:"http://www.tobikan.jp"),
    (name:"amazon", url:"https://www.amazon.co.jp")
]
var 1section1 = [
    (name:"本", url:"https://docs.google.com/forms/d/1z9r11-QxxvSV96fvThVZQjGmpFaEvqim7Lt2pGcPUZA/edit#responses")]

var 1section2 = [
    (name:"o-tips", url:"https://docs.google.com/forms/d/1qfWWtPXuKnJHg1XWiu3qX9pHXx1BsE-LL--MR57p0Jk/edit")]

var 1tableData = [section0,section1,section2]


*/

class qListTableTableViewController: UITableViewController {
    
    var path : String = ""
    var Point : Int = 0

    
    //var me : AppUser(data : ["UserPoint" : 0])
    //var me = AppUser (data : ["UserPoint" : 1])
    
    let me = AppUser()
    
    // MARK: - Table view data source
    
    // セクションの個数
    override func numberOfSections(in tableView: UITableView) -> Int {
        return qsectionTitle.count
    }
    
    // セクション内の行数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let qsectionData = tableData[section]
        return qsectionData.count
        // 配列webListの値の個数
        return TodoKobetsunonakami.count
        //return webList.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return qsectionTitle[section]
    }
    
    // セルを作る
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // テーブルのセルを参照する
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let sectionData = tableData[(indexPath as NSIndexPath).section]
        // テーブルにWebListのデータを表示する
        print("Table")
        let webData = sectionData[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = webData.name
        cell.detailTextLabel?.text = webData.url

        return cell
    }
    
    // MARK: - Navigation
    
    // セグエで移動する前にデータを受け渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // セグエがshowWebPageのときの処理
        if segue.identifier == "showWebPage" {
            //
            print("ああああああああああああああああああああああああ\(path)")
            
            me.heru_Point(curPoint : Point, diffPoint : 1, path : path)
            
           // me.Add_point()
            // タップした行番号を取り出す
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let sectionData = tableData[indexPath.section]
                // 行のデータを取り出す
                let webData = sectionData[(indexPath as NSIndexPath).row]
                // 移動先のビューコントローラのdataプロパティに値を設定する
                (segue.destination as! answerViewController).data = webData as! (name: String, url: String)
            }
        }
    }

    
    
    let fromAppDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.me.getPath(name: self.fromAppDelegate.ThisUsername!, password: self.fromAppDelegate.Thispassword!, complete:{result in
            print("きたこれ\(result)しぱい")
            
            self.path = result
        })
        
        let _ = self.me.getPoint(name: self.fromAppDelegate.ThisUsername, password: self.fromAppDelegate.Thispassword, complete:{result in
            print("みずきち\(result)")
            self.Point = result
            
        })
        
        print("ここです！！！！！")
        print(fromAppDelegate.ThisUsername)
        print(fromAppDelegate.Thispassword)
        
        let Questionnare = QuestionnareData()
        
        //仮置きのプロフィール
        var arg_gender = "男性"
        var arg_age = "10代"
        
        self.me.get_age_gender(name: self.fromAppDelegate.ThisUsername, password: self.fromAppDelegate.Thispassword, complete:{(age, gender) in
            arg_gender = gender
            arg_age = age
            print("年齢, 性別")
            print(arg_age)
            print(arg_gender)
            print("覚醒！！！！")
            
        })
        
        Questionnare.getAllReports(gender: arg_gender, age: arg_age, completion: {
            questions in
            if(Questionnare.questions[safe: 3] != nil){
                print("1OutofRange大丈夫！")
            }else{
                print("1OutofRange大丈夫じゃない")
            }
            
            for Qs in Questionnare.questions {
                if(Qs.category == "情報系"){
                    section0.append((name: Qs.theme, url: Qs.url))
                }
                else if(Qs.category == "心理系"){
                    print("いい感じ！！！")
                    print("\(Qs.category), \(Qs.theme), \(Qs.url)")
                    section1.append((name: Qs.theme, url: Qs.url))
                    print(section1)
                }
                else if(Qs.category == "食物系"){
                    section2.append((name: Qs.theme, url: Qs.url))
                }
                else {
                    print("elseだよ〜")
                }
            }
            
            tableData = [section0,section1,section2]
            
            self.tableView.reloadData()
            
            print(self.tableView as Any)
            
    }
}

//OutofRangeをチェックできるやつ
/*
extension Array {
    subscript (safe index: Index) -> Element? {
        //indexが配列内なら要素を返し、配列外ならnilを返す（三項演算子）
        return indices.contains(index) ? self[index] : nil
    }
}
*/


