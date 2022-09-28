//
//  TasksTableView.swift
//  ToDoList
//
//  Created by Alexander Zub on 28.09.2022.
//

import Foundation
import UIKit

class TasksTableView: UITableView {
    
    
    
    init() {
        super.init(frame: CGRect(), style: .plain)
        self.register(TaskCell.self, forCellReuseIdentifier: TaskCell.reuseId)
        self.separatorStyle = .none // выделение
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
