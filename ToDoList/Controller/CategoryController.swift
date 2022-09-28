//
//  CategoryController.swift
//  ToDoList
//
//  Created by Alexander Zub on 28.09.2022.
//

import UIKit

class CategoryController: UIViewController {

    var tasks: [ToDo] = []
    let categoryView = CategoryView()
    var category: Category
    
    init(category: Category) {
        self.category = category
        super.init(nibName: nil, bundle: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = categoryView
        getTasks()
        categoryView.tasksTable.delegate = self
        categoryView.tasksTable.dataSource = self
        categoryView.titleLabel.text = category.rawValue
        addTargets()
    }
    
    func addTargets() {
        categoryView.backButton.addTarget(self, action: #selector(backTap), for: .touchUpInside)
    }
    
    @objc func backTap() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func getTasks() {
        self.tasks = RealmManager.shared.getNewTodos(category: self.category)
        categoryView.tasksTable.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension CategoryController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.reuseId, for: indexPath) as! TaskCell
        cell.titleLabel.text = tasks[indexPath.row].title
        
        return cell
    }
    
    
}
