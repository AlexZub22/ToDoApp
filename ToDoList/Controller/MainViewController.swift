//
//  ViewController.swift
//  ToDoList
//
//  Created by Alexander Zub on 24.09.2022.
//

import UIKit



class MainViewController: UIViewController, AddTaskDelegate {

    
    
    let mainView = MainView()
    
    var todos = [ToDo]()
    var completedToDos = [ToDo]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        addTargets()
        getToDos()
        
    }
    
    
    func getToDos() {
        self.todos = RealmManager.shared.getNewTodos()
        self.completedToDos = RealmManager.shared.getCompletedTodos()
        
        mainView.tableView.reloadData()
    }

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int { //cекции в таблице
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 42
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc: TaskController
        switch indexPath.section {
        case 0:
            vc = TaskController(task: todos[indexPath.row])
        case 1:
            vc = TaskController(task: completedToDos[indexPath.row])
        default: return
        }
        
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return todos.count
        case 1: return completedToDos.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.reuseId, for: indexPath) as! TaskCell
        switch indexPath.section {
        case 0:
            cell.titleLabel.text = todos[indexPath.row].title
            switch todos[indexPath.row].category {
            case Category.impUrg.rawValue:
                cell.categoryIndicator.backgroundColor = .orange
            case Category.impNotUrg.rawValue:
                cell.categoryIndicator.backgroundColor = .green
            case Category.notImpUrg.rawValue:
                cell.categoryIndicator.backgroundColor = .blue
            case Category.notImpNotUrg.rawValue:
                cell.categoryIndicator.backgroundColor = .brown
            default: break
            }
        case 1:
            cell.titleLabel.text = completedToDos[indexPath.row].title
            cell.categoryIndicator.backgroundColor = .gray
        default: break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return todos.count > 0 ? "Новые задачи:" : nil
        case 1: return completedToDos.count > 0 ? "Выполненные задачи:" : nil
        default: return nil
        }
    }
    
    
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    //создание ячейки
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseId, for: indexPath) as! CategoryCell
        cell.layer.cornerRadius = 16
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowRadius = 5
        cell.layer.shadowOpacity = 0.3
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.imageView.contentMode = .scaleAspectFit // метод заливки
        
        switch indexPath.item {
        case 0:
            cell.imageView.image = UIImage(systemName: "tornado")
            cell.imageView.tintColor = UIColor.orange
            cell.categoryTitleLabel.text = "Важное Срочное"
        case 1:
            cell.imageView.image = UIImage(systemName: "tortoise")
            cell.imageView.tintColor = UIColor.systemGreen
            cell.categoryTitleLabel.text = "Важное Несрочное"
        case 2:
            cell.imageView.image = UIImage(systemName: "hare")
            cell.imageView.tintColor = UIColor.blue
            cell.categoryTitleLabel.text = "Неважное Срочное"
        case 3:
            cell.imageView.image = UIImage(systemName: "shippingbox")
            cell.imageView.tintColor = UIColor.brown
            cell.categoryTitleLabel.text = "Неважное Несрочное"
        default: break
        }
        
        
        return cell
    }
    
    //свайп справа
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить", handler: { (_, _, _) in
           
            RealmManager.shared.removeFromDB(todo: self.todos[indexPath.row])
            self.todos.remove(at: indexPath.row)
            tableView.reloadData()
        })
        let trailingConfig = UISwipeActionsConfiguration(actions: [deleteAction])
        return trailingConfig
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category: Category
        switch indexPath.item {
        case 0: category = .impUrg
        case 1: category = .impNotUrg
        case 2: category = .notImpUrg
        default: category = .notImpNotUrg
        }
        let vc = CategoryController(category: category)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    func addTargets() {
        mainView.addButton.addTarget(self, action: #selector(presentAddVC), for: .touchUpInside)
    }
    
    @objc func presentAddVC() {
        let vc = AddTaskViewController()
        vc.delegate = self
        
        self.present(vc, animated: true, completion: nil)
    }
    
    
}
