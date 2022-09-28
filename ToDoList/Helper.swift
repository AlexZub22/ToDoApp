//
//  Helper.swift
//  SushiWrote
//
//  Created by Alexander Zub on 02.08.2022.
//

import UIKit

class Helper {
    //translates autoresizing mask into constraints. Принимает много вьюх, проходит по ним и отключает всем маски автоизменения размера
    static func tamicOff(views: [UIView]) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    //Принимает много вьюх и все их добовляет в супервью в качестве сабвью, для построения иерархии
    static func addSub(views: [UIView], to superview: UIView) {
        for view in views {
            superview.addSubview(view)
        }
    }
}
