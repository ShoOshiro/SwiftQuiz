//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by 大城章太 on 2018/10/29.
//  Copyright © 2018年 com.shota. All rights reserved.
//

import UIKit
import RealmSwift

class QuizViewController: UIViewController {
    
    @IBOutlet var questionTextView : UITextView!
    @IBOutlet var option1Button : UIButton!
    @IBOutlet var option2Button : UIButton!
    @IBOutlet var option3Button : UIButton!
    @IBOutlet var resultImageView : UIImageView!
    
    var quizArray : Results<RealmQuiz>!
    
    var quizNumber = 0
    var correctNumber = 0
    var dataLists = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        option1Button.layer.cornerRadius = option1Button.bounds.height/2
        option1Button.layer.masksToBounds = true
        
        option2Button.layer.cornerRadius = option2Button.bounds.height/2
        option2Button.layer.masksToBounds = true
        
        option3Button.layer.cornerRadius = option3Button.bounds.height/2
        option3Button.layer.masksToBounds = true
        
        showQuiz()
    }
    
    func createQuiz() {
        do {
            //CSVファイルのパスを取得する。
            let csvPath = Bundle.main.path(forResource: "quizdata", ofType: "csv")
            
            //CSVファイルのデータを取得する。
            let csvData = try String(contentsOfFile:csvPath!, encoding:String.Encoding.utf8)
            
            //改行区切りでデータを分割して配列に格納する。
            dataLists = csvData.components(separatedBy: "\n")
            
            //カンマでデータを分割して配列に格納する。
            for i in 0 ..< dataLists.count {
                let dataDetail = dataLists[i].components(separatedBy: ",")
            }
            
            
        } catch {
            print(error)
        }
    }
    
    func showQuiz() {
        
        createQuiz()
        
    
        questionTextView.text = quizArray[quizNumber].text
        option1Button.setTitle(quizArray[quizNumber].option1, for: .normal)
        option2Button.setTitle(quizArray[quizNumber].option2, for: .normal)
        option3Button.setTitle(quizArray[quizNumber].option3, for: .normal)
    }
    
    func showCorrect(){
        resultImageView.alpha = 1
        resultImageView.image = UIImage(named: "correct.gif")
        UIView.animate(withDuration: 0.5){    //withDurationの横は現れる秒数
            self.resultImageView.alpha = 0   //上とこの行で１秒かけて画像の透明度が１になる。
        }
    }
    
    func showIncorrect(){
        resultImageView.alpha = 1 //見えている
        resultImageView.image = UIImage(named: "incorrect.gif")
        UIView.animate(withDuration: 0.5){    //withDurationの横は現れる秒数
            self.resultImageView.alpha = 0   //上とこの行で１秒かけて画像の透明度が１になる。
        }
    }
    
    @IBAction func select1 () {
        //ここはquestionTextView.textであるべきか？ quiz[0].textであるべきか？
//        もしタップしたボタンが１つ目のボタンだったらそのタイトルラベルを取得して答えと合わせるって言う作業ができるけど、どうしよう？ ->  ボタンごとに関連付けをすることで解決できる。
        
        if option1Button.titleLabel?.text == quizArray[quizNumber].answer {
            //            正解数を１増やす。
            correctNumber = correctNumber + 1
            quizArray[quizNumber].result = true
//            １秒間丸を表示する。
            showCorrect()
        } else {
            quizArray[quizNumber].result = false
//            1秒間バツを表示する。
            showIncorrect()
            
        }
        if quizNumber == quizArray.count - 1 {
            self.performSegue(withIdentifier: "toResult", sender: nil)
        } else {
        quizNumber = quizNumber + 1
        showQuiz()
        }
    }
    
    @IBAction func select2 () {
        //ここはquestionTextView.textであるべきか？ quiz[0].textであるべきか？
        //        もしタップしたボタンが１つ目のボタンだったらそのタイトルラベルを取得して答えと合わせるって言う作業ができるけど、どうしよう？ ->  ボタンごとに関連付けをすることで解決できる。
        
        if option2Button.titleLabel?.text == quizArray[quizNumber].answer {
            //            正解数を１増やす。
            correctNumber = correctNumber + 1
            //            １秒間丸を表示する。
            quizArray[quizNumber].result = true
            showCorrect()
        } else {
            //            1秒間バツを表示する。
            quizArray[quizNumber].result = false
            showIncorrect()
            
        }
        if quizNumber == quizArray.count - 1 {
            self.performSegue(withIdentifier: "toResult", sender: nil)
        } else{
        quizNumber = quizNumber + 1
        showQuiz()
        }
    }
    
    @IBAction func select3 () {
        //ここはquestionTextView.textであるべきか？ quiz[0].textであるべきか？
        //        もしタップしたボタンが１つ目のボタンだったらそのタイトルラベルを取得して答えと合わせるって言う作業ができるけど、どうしよう？ ->  ボタンごとに関連付けをすることで解決できる。
        
        if option3Button.titleLabel?.text == quizArray[quizNumber].answer {
            //            正解数を１増やす。
            correctNumber = correctNumber + 1
            quizArray[quizNumber].result = true
            //            １秒間丸を表示する。
            showCorrect()
        } else {
            //            1秒間バツを表示する。
            quizArray[quizNumber].result = false
            showIncorrect()
            
        }
        if quizNumber == quizArray.count - 1 {
            self.performSegue(withIdentifier: "toResult", sender: nil)
        } else {
        quizNumber = quizNumber + 1
        showQuiz()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as! ResultViewController
        resultViewController.passedCorrectNumber = correctNumber
        resultViewController.passedQuizArray = quizArray
    }

}
