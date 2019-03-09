//
//  RealmQuiz.swift
//  SwiftQuiz
//
//  Created by 大城章太 on 2018/11/13.
//  Copyright © 2018年 com.shota. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class RealmQuiz : Object {
    @objc dynamic var text : String?
    @objc dynamic var option1 : String?
    @objc dynamic var option2 : String?
    @objc dynamic var option3 : String?
    @objc dynamic var answer : String?
    @objc dynamic var result = 0
//    @objc dynamic var Result : Int?
    @objc dynamic var feedBack : String?
}
