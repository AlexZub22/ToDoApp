//
//  ButtonExt.swift
//  SushiWrote
//
//  Created by Alexander Zub on 02.08.2022.
//

import UIKit

extension UIButton {
    
    convenience init(title: String, bgColor: UIColor, textColor: UIColor, font: UIFont?) {
        self.init(type: .system) //В системной кнопке уже есть анимации
        setTitle(title, for: .normal)
        backgroundColor = bgColor
        tintColor = textColor //Оттенок всей кнопки, в случае изображения на кнопке
        titleLabel?.font = font!
        layer.cornerRadius = 9
    }
    
    
}
