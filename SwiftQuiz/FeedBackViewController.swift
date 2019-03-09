//
//  FeedBackViewController.swift
//  SwiftQuiz
//
//  Created by 大城章太 on 2018/11/03.
//  Copyright © 2018年 com.shota. All rights reserved.
//

import UIKit

class FeedBackViewController: UIViewController {
    
    var passedQuiz : Quiz?
    @IBOutlet var questionTextView : UITextView!
    @IBOutlet var feedBackTextView : UITextView!
    @IBOutlet var backButton : UIButton!
    @IBOutlet var retryButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        questionTextView.text = passedQuiz?.text
        feedBackTextView.text = passedQuiz?.feedBack
        retryButton.layer.cornerRadius = retryButton.bounds.height/2
        retryButton.layer.masksToBounds = true
        
        backButton.layer.cornerRadius = backButton.bounds.height / 2
        backButton.layer.masksToBounds = true
    }
    
    @IBAction func back(){
        self.dismiss(animated: true, completion: nil)
    }

}
