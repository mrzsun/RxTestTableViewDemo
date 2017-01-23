//
//  TableViewCell.swift
//  RxTableViewDemo
//
//  Created by Marco Sun on 16/4/28.
//  Copyright © 2016年 com.MarcoSun. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    var user: User? {
        willSet {
            let string = "\(newValue!.screenName)在简书上关注了\(newValue!.followingCount)个用户，并且被\(newValue!.followersCount)个用户关注了。"
            backgroundColor = tag % 2 == 0 ? UIColor.lightGray : UIColor.white
            textLabel?.text = string
            textLabel?.numberOfLines = 0
        }
    }
    

}
