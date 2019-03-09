//
//  Quiz.swift
//  SwiftQuiz
//
//  Created by 大城章太 on 2018/10/29.
//  Copyright © 2018年 com.shota. All rights reserved.
//

import Foundation

class Quiz : NSObject {
    
    var text : String?
    var option1 : String?
    var option2 : String?
    var option3 : String?
    var answer : String?
    var result : Bool?
    var feedBack : String?
    
    //イニシャライザーの書き方で詰まった。下のだと初期化しても代入されない事が発覚。
//    init (text : String , option1 : String , option2 : String , option3 : String , answer : String) {
//    }
    
    init (text : String , option1 : String , option2 : String , option3 : String , answer : String , feedBack : String) {
        self.text = text
        self.option1 = option1
        self.option2 = option2
        self.option3 = option3
        self.answer = answer
        self.feedBack = feedBack
    }
    
}

//これではいけない
//        text = text
//        option1 = option1
//        option2 = option2
//        option3 = option3
//        answer = answer
