//
//  LabelExt.swift
//  SushiWrote
//
//  Created by Alexander Zub on 02.08.2022.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, font: UIFont?) {
        self.init(frame: CGRect())
        self.text = text
        self.font = font
    }
}
