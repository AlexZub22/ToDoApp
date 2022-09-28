//
//  TaskView.swift
//  ToDoList
//
//  Created by Alexander Zub on 28.09.2022.
//

import UIKit

class TaskView: UIView {

    let titleLabel = UILabel(text: "Название задачи", font: FontsLibrary.smallTitle)
    let descriptionTextView = UITextView()
    let categoryLabel = UILabel(text: "Неважное Несрочное", font: FontsLibrary.fieldButton)
    let completeButton = UIButton(title: "Выполнить", bgColor: ColorsLibrary.darkGreen, textColor: .white, font: FontsLibrary.fieldButton)
    
    init() {
        super.init(frame: CGRect())
        setViews()
        setConstraints()
    }
    
    func setViews() {
        backgroundColor = .white
        titleLabel.numberOfLines = 3 // количество строк
        descriptionTextView.isEditable = false // запрещает редактировать контент
        descriptionTextView.font = FontsLibrary.positionTextBold
    }
    
    func setConstraints() {
        Helper.addSub(views: [titleLabel, descriptionTextView, categoryLabel, completeButton], to: self)
        Helper.tamicOff(views: [titleLabel, descriptionTextView, categoryLabel, completeButton])
        
        NSLayoutConstraint.activate([titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
                                     titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 49),
                                     titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0)
                                    ])
        NSLayoutConstraint.activate([categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
                                     categoryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
                                    ])
        NSLayoutConstraint.activate([descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
                                     descriptionTextView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 8),
                                     descriptionTextView.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     descriptionTextView.bottomAnchor.constraint(equalTo: completeButton.topAnchor, constant: -24)
                                                                      ])
        NSLayoutConstraint.activate([completeButton.widthAnchor.constraint(equalToConstant: 140),
                                     completeButton.heightAnchor.constraint(equalToConstant: 40),
                                     completeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
                                     completeButton.centerXAnchor.constraint(equalTo: centerXAnchor)
                                    ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
