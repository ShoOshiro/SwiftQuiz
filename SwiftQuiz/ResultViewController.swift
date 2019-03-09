//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Created by 大城章太 on 2018/10/30.
//  Copyright © 2018年 com.shota. All rights reserved.
//

import UIKit

//３時間でここまで完成した！ここから下はこれから！

class ResultViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet var retryButton : UIButton!
    
    var passedCorrectNumber = 0
    var passedQuizArray = [Quiz]()
    @IBOutlet var totalQuizNumberLabel : UILabel!
    @IBOutlet var correctNumberLabel : UILabel!
    @IBOutlet var resultTableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        resultTableView.dataSource = self
        resultTableView.delegate = self
        
        retryButton.layer.cornerRadius = retryButton.bounds.height/2
        retryButton.layer.masksToBounds = true
        
        let nib = UINib(nibName: "ResultTableViewCell", bundle: Bundle.main)
        resultTableView.register(nib, forCellReuseIdentifier: "Cell")
        resultTableView.tableFooterView = UIView()
        totalQuizNumberLabel.text = String(passedQuizArray.count)
        correctNumberLabel.text = String(self.passedCorrectNumber)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passedQuizArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ResultTableViewCell
        cell.questionLabel.text = passedQuizArray[indexPath.row].text
        cell.answerLabel.text = passedQuizArray[indexPath.row].answer
        if passedQuizArray[indexPath.row].result == true{
            cell.resultImageView.image = UIImage(named: "correct.gif")
        } else{
            cell.resultImageView.image = UIImage (named: "incorrect.gif")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toFeedBack", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let feedBackViewController = segue.destination as! FeedBackViewController
        let selectedIndex = resultTableView.indexPathForSelectedRow
        feedBackViewController.passedQuiz = passedQuizArray[(selectedIndex?.row)!]
    }
    
}
