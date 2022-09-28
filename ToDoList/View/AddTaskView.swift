//
//  AddTaskView.swift
//  ToDoList
//
//  Created by Alexander Zub on 26.09.2022.
//

import UIKit

class AddTaskView: UIView {

    let titleTF = UITextField(placeholder: "Название задачи", isShadow: true)
    let descriptionTF = UITextField(placeholder: "Описание задачи", isShadow: true)
    
    let isUrgentLabel = UILabel(text: "Срочно?", font: FontsLibrary.cellText)
    let isImportantLabel = UILabel(text: "Важно?", font: FontsLibrary.cellText)
    
    let isUrgentSwitch = UISwitch()
    let isImportantSwitch = UISwitch()
    let saveButton = UIButton(title: "Сохранить", bgColor: ColorsLibrary.darkGreen, textColor: .white, font: FontsLibrary.fieldButton)
    
    init() {
        super.init(frame: CGRect())
        backgroundColor = .white
        setConstraints()
    }
    
    func setConstraints() {
        let uStack = UIStackView(views: [isUrgentLabel, isUrgentSwitch], axis: .vertical, spacing: 4)
        let iStack = UIStackView(views: [isImportantLabel, isImportantSwitch], axis: .vertical, spacing: 4)
        let iuStack = UIStackView(views: [iStack, uStack], axis: .horizontal, spacing: 24)
        
        let stack = UIStackView(views: [titleTF,descriptionTF, iuStack, saveButton], axis: .vertical, spacing: 18)
        Helper.tamicOff(views: [stack])
        Helper.addSub(views: [stack], to: self)
        
        
        NSLayoutConstraint.activate([stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
                                     stack.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     stack.centerYAnchor.constraint(equalTo: centerYAnchor)
                                    ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
