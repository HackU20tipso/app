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
let section0 = [
    (name:"アップル", url:"https://www.apple.com/jp/"),
    (name:"国立天文台", url:"https://www.nao.ac.jp"),
    (name:"東京都美術館", url:"http://www.tobikan.jp"),
    (name:"amazon", url:"https://www.amazon.co.jp")
]
let section1 = [(name:"本", url:"https://docs.google.com/forms/d/1z9r11-QxxvSV96fvThVZQjGmpFaEvqim7Lt2pGcPUZA/edit#responses")]

let section2 = [(name:"o-tips", url:"https://docs.google.com/forms/d/1qfWWtPXuKnJHg1XWiu3qX9pHXx1BsE-LL--MR57p0Jk/edit")]

let tableData = [section0,section1,section2]

class WebListTableTableViewController: UITableViewController {
    
    //var me : AppUser(data : ["UserPoint" : 0])
    var me = AppUser (data : ["UserPoint" : 1])
    
  
    
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
            me.Add_point()
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

    override func viewDidLoad() {
        super.viewDidLoad()
        let test1 = QuestionnareData()
        test1.makeQ(a: "男性",b: "情報系",c: "19",d: "google.com")
        //var test2 = Q_struct(target: "男性", category: "情報系", age: "19", url: "google.com")
        test1.getAllReports(completion: { questions in print("test1 is \(questions)")})

    }

    
}
