//
//  WebListTableTableViewController.swift
//  tips-o
//
//  Created by 藤元彩花 on 2020/08/26.
//  Copyright © 2020 百塚真弥. All rights reserved.
//

import UIKit
let sectionTitle = ["情報系","心理系","食物系"]

// セルに表示するデータ
var section0:[(String,String)] = []
/*var section0 = [
    (name:"アップル", url:"https://www.apple.com/jp/"),
    (name:"国立天文台", url:"https://www.nao.ac.jp"),
    (name:"東京都美術館", url:"http://www.tobikan.jp"),
    (name:"amazon", url:"https://www.amazon.co.jp")
]*/
var section1 = [(name:"本", url:"https://docs.google.com/forms/d/1z9r11-QxxvSV96fvThVZQjGmpFaEvqim7Lt2pGcPUZA/edit#responses")]

var section2 = [(name:"o-tips", url:"https://docs.google.com/forms/d/1qfWWtPXuKnJHg1XWiu3qX9pHXx1BsE-LL--MR57p0Jk/edit")]

let tableData = [section0,section1,section2]

class WebListTableTableViewController: UITableViewController {
    
    //var me : AppUser(data : ["UserPoint" : 0])
    //var me = AppUser (data : ["UserPoint" : 1])
    
  
    let me = AppUser()
    
    // MARK: - Table view data source
    // セクションの個数
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    // セクション内の行数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionData = tableData[section]
        return sectionData.count
        // 配列webListの値の個数
        //return webList.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    
    // セルを作る
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // テーブルのセルを参照する
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let sectionData = tableData[(indexPath as NSIndexPath).section]
        // テーブルにWebListのデータを表示する
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
           // me.Add_point()
            // タップした行番号を取り出す
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let sectionData = tableData[indexPath.section]
                // 行のデータを取り出す
                let webData = sectionData[(indexPath as NSIndexPath).row]
                // 移動先のビューコントローラのdataプロパティに値を設定する
                (segue.destination as! answerViewController).data = webData
            }
        }
    }
    
    let fromAppDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print("ここです！！！！！")
        print(fromAppDelegate.ThisUsername)
        print(fromAppDelegate.Thispassword)
        
        let Questionnare = QuestionnareData()
        
        //test1.makeQ(a: "男性",b: "心理系",c: "19",d: "google.com")
        //test1.makeQ(a: "女性",b: "心理系",c: "19",d: "google.com")
        
        
        
        /*let gender_age = me.getPrivacy(
            name: self.fromAppDelegate.ThisUsername,
            password: self.fromAppDelegate.Thispassword, complete:{result in
            var arg_gender : String =
            var arg_age : String =
        })*/

        
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
        
        /*
        func get_age_gender(name: String, password: String, complete: @escaping(String, String) -> ()){
        */
        
        //append test
        section1.append((name: "test", url: "test.com"))
        
        let result = Questionnare.getAllReports(gender: arg_gender, age: arg_age, completion: {
            questions in
            if(Questionnare.questions[safe: 3] != nil){
                print("1OutofRange大丈夫！")
            }else{
                print("1OutofRange大丈夫じゃない")
            }
            if(Questionnare.questions[3].category == "情報系"){
                print("\(Questionnare.questions[3].category)")
                section0.append((name: Questionnare.questions[3].theme, url: Questionnare.questions[3].url))
            }
            else if(Questionnare.questions[3].category == "心理系"){
                section1.append((name: "test", url: "test.com"))
                print("[3]\(Questionnare.questions[3].category)")
                section1.append((name: "test", url: "test.com"))
                section1.append((name: Questionnare.questions[3].theme, url: Questionnare.questions[3].url))
            }
            else if(Questionnare.questions[3].category == "食物系"){
                print("\(Questionnare.questions[3].category)")
                section2.append((name: Questionnare.questions[3].theme, url: Questionnare.questions[3].url))
            }
            else{
                print("else! \(Questionnare.questions[3].category)")
            }
            for Qs in Questionnare.questions {
                if(Qs.category == "情報系"){        section0.append((name: Qs.gender, url: Qs.url))
                }
                if(Qs.category == "心理系"){
                    print("\(Qs.category), \(Qs.gender), \(Qs.url)")
                    section1.append((name: Qs.gender, url: Qs.url))
                }
                if(Qs.category == "食物系"){        section2.append((name: Qs.gender, url: Qs.url))
                }
            }
            //配列中身print
             print("２回目 \(Questionnare.questions)")})
        
        print("１回目 \(result)")
        
        if(result[safe: 3] != nil){
            print("2OutofRange大丈夫！")
        }else{
            print("2OutofRange大丈夫じゃない")
        }
    }
}

//OutofRangeをチェックできるやつ
extension Array {
    subscript (safe index: Index) -> Element? {
        //indexが配列内なら要素を返し、配列外ならnilを返す（三項演算子）
        return indices.contains(index) ? self[index] : nil
    }
}


