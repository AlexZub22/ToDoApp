//
//  StackViewExt.swift
//  SushiWrote
//
//  Created by Alexander Zub on 02.08.2022.
//

import UIKit

extension UIStackView {
    //axis - вертикальный или горизонтальный стек
    convenience init(views: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: views)
        self.axis = axis
        self.spacing = spacing
    }
    
}
