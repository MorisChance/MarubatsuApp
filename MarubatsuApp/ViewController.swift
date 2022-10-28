//
//  ViewController.swift
//  MarubatsuApp
//
//  Created by 森本　浩輔 on 2022/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    var currentQuestionNum : Int = 0
    // 問題の配列を用意
    var questions: [[String: Any]] = []
    //問題を表示する関数
    func showQuestion(){
        let question = questions[currentQuestionNum]
        if let que = question["question"] as? String{
            questionLabel.text = que
            print(que)
        }
    }
    // 回答をチェックする関数
    // 正解なら次の問題を表示します
    func checkAnswer(yourAnswer: Bool) {
        let question = questions[currentQuestionNum]
        if questions.isEmpty != true{
            if let ans = question["answer"] as? Bool {
                if yourAnswer == ans {
                    // 正解
                    // currentQuestionNumを1足して次の問題に進む
                    currentQuestionNum += 1
                    showAlert(message: "正解！")
                } else {
                    // 不正解
                    showAlert(message: "不正解だよーん")
                }
            } else {
                print("答えが入ってません")
                return
            }
            if currentQuestionNum >= questions.count{
                currentQuestionNum = 0
            }
            // 問題を表示します。
            // 正解であれば次の問題が、不正解であれば同じ問題が再表示されます。
            showQuestion()
        }
        
        func showAlert(message: String){
            let alert = UIAlertController(title:nil, message:message, preferredStyle: .alert)
            let close = UIAlertAction(title:"閉じる", style: .cancel, handler:nil)
            alert.addAction(close)
            present(alert, animated: true, completion:nil)
        }
        func viewDidLoad() {
            super.viewDidLoad()
        }
    }
    @IBAction func tappedNoButton(_ sender: Any) {
        checkAnswer(yourAnswer: false)
    }
    
    @IBAction func tappedYesButton(_ sender: Any) {
        checkAnswer(yourAnswer: true)
    }
    override func viewWillAppear(_ animated: Bool) {

        if UserDefaults.standard.array(forKey: "add")?.first != nil {
            questions = UserDefaults.standard.array(forKey: "add") as! [[String:Any]]
            showQuestion()
        } else {
            questionLabel.text = "問題を入力してください"
        }
        
    }
}


