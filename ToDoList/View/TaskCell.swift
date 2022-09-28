//
//  TaskCell.swift
//  ToDoList
//
//  Created by Alexander Zub on 26.09.2022.
//

import UIKit

class TaskCell: UITableViewCell {
    
    static let reuseId = "TaskCell"
    let titleLabel = UILabel(text: "Название задачи", font: FontsLibrary.cellText)
    let categoryIndicator = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let stack = UIStackView(views: [categoryIndicator, titleLabel], axis: .horizontal, spacing: 12)
        Helper.tamicOff(views: [stack])
        Helper.addSub(views: [stack], to: self)
        
        categoryIndicator.layer.cornerRadius = 18
        categoryIndicator.backgroundColor = .green
        
        NSLayoutConstraint.activate([stack.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     stack.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     stack.heightAnchor.constraint(equalToConstant: 36),
                                     stack.centerYAnchor.constraint(equalTo: centerYAnchor)
                                    ])
        NSLayoutConstraint.activate([categoryIndicator.heightAnchor.constraint(equalToConstant: 36),
                                     categoryIndicator.widthAnchor.constraint(equalTo: categoryIndicator.heightAnchor)
                                    ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
