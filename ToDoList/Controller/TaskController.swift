//
//  TaskController.swift
//  ToDoList
//
//  Created by Alexander Zub on 28.09.2022.
//

import UIKit

class TaskController: UIViewController {

    let taskView = TaskView()
    var task: ToDo
    var delegate: AddTaskDelegate?
    
    init(task: ToDo) {
        self.task = task
        super.init(nibName: nil, bundle: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = taskView
        setupView()
        addTargets()
        checkDone()
    }
    
    func checkDone() {
        guard  task.isComplete else { return }
        taskView.completeButton.isEnabled = false
        taskView.completeButton.setTitle("Уже выполнено", for: .disabled)
    }
    
    func addTargets() {
        taskView.completeButton.addTarget(self, action: #selector(makeComplete), for: .touchUpInside)
    }
    
    @objc func makeComplete() {
        RealmManager.shared.makeDown(task: task)
        delegate?.getToDos()
        self.dismiss(animated: true, completion: nil) //сворачивание окна
    }
    
    func setupView() {
        taskView.titleLabel.text = task.title
        taskView.categoryLabel.text = task.category
        taskView.descriptionTextView.text = task.descript
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   

}
