//
//  CategoryView.swift
//  ToDoList
//
//  Created by Alexander Zub on 28.09.2022.
//

import UIKit

class CategoryView: UIView {

    let backButton = UIButton(title: "< Назад", bgColor: .clear, textColor: .blue, font: FontsLibrary.fieldButton)
    let titleLabel = UILabel(text: "Неважное Несрочное", font: FontsLibrary.smallTitle)
    let tasksTable = TasksTableView()
    
    init() {
        super.init(frame: CGRect())
        setViews()
        setConstraints()
    }
    
    func setViews() {
        self.backgroundColor = .white
        self.tasksTable.backgroundColor = .clear
    }
    
    func setConstraints() {
        Helper.addSub(views: [backButton, titleLabel, tasksTable], to: self)
        Helper.tamicOff(views: [backButton, titleLabel, tasksTable])
        
        NSLayoutConstraint.activate([backButton.widthAnchor.constraint(equalToConstant: 80),
                                     backButton.heightAnchor.constraint(equalToConstant: 32),
                                     backButton.topAnchor.constraint(equalTo: topAnchor, constant: 42),
                                     backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8)
                                    ])
        NSLayoutConstraint.activate([titleLabel.topAnchor.constraint(equalTo: backButton.topAnchor, constant: 50),
                                     titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
                                    ])
        NSLayoutConstraint.activate([tasksTable.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
                                     tasksTable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
                                     tasksTable.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
                                     tasksTable.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 12)
                                    ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
