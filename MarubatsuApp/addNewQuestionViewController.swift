        //
//  addNewQuestionViewController.swift
//  MarubatsuApp
//
//  Created by 森本　浩輔 on 2022/10/23.
//
import UIKit
class addNewQuestionViewController: UIViewController {
    //配列を用意
    var questions: [[String : Any]] = []
    //問題文と紐付け
    @IBOutlet weak var newQuestionText: UITextField!
    //セグメントと紐付け
    @IBOutlet weak var segmetedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //トップ画面に戻る
    @IBAction func returnButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    //保存ボタンと紐付け
    @IBAction func saveButton(_ sender: Any) {
        //もし問題文が空であれば
            if newQuestionText.text?.isEmpty ?? true {
                print("問題文は空白です。")
            } else {
                var answer : Bool
                if segmetedControl.selectedSegmentIndex == 0{
                    answer = false
                } else {
                    answer = true
                }

            //userDefaultsのインスタンス生成
                let morisDefaults = UserDefaults.standard
                if morisDefaults.object(forKey: "add") != nil{
                    questions = morisDefaults.object(forKey: "add") as! [[String: Any]]
                }
            //questionsに問題文と○☓を追加
                questions.append(["question":newQuestionText!, "answer": answer])
            //questionsに入った配列を保存
                morisDefaults.set( questions, forKey : "add")
                print("questions")
            }
        }
    //入力を終える
    @IBAction func end(_ sender: Any) {
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
