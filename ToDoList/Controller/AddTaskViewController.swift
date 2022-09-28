//
//  AddTaskViewController.swift
//  ToDoList
//
//  Created by Alexander Zub on 26.09.2022.
//

import UIKit

protocol AddTaskDelegate {
    func getToDos()
    
}

class AddTaskViewController: UIViewController {

    let addView = AddTaskView()
    
    var delegate: AddTaskDelegate? //связываем два контроллера
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = addView
        addTatgets()
    }
    
    func addTatgets() {
        addView.saveButton.addTarget(self, action: #selector(writeTask), for: .touchUpInside)
    }
    
    @objc func writeTask() {
        guard let title = addView.titleTF.text else { return }
        guard let desc = addView.descriptionTF.text else { return }
        
        let isUrgent = addView.isUrgentSwitch.isOn
        let isImportant = addView.isImportantSwitch.isOn
        
        var category: Category
        
        if isUrgent && isImportant {
            category = .impUrg
        } else if isUrgent && !isImportant {
            category = .notImpUrg
        } else if !isUrgent && isImportant {
            category = .impNotUrg
        } else {
            category = .notImpNotUrg
        }
        
        let task = ToDo(title: title, descript: desc, category: category)
        RealmManager.shared.writeToDo(todo: task)
        delegate?.getToDos()
            self.dismiss(animated: true)
    }

}
