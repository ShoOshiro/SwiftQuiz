//
//  ViewController.swift
//  SwiftQuiz
//
//  Created by 大城章太 on 2018/10/29.
//  Copyright © 2018年 com.shota. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var startButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = startButton.bounds.height/2
        startButton.layer.masksToBounds = true
    }


}

