//
//  RealmManager.swift
//  ToDoList
//
//  Created by Alexander Zub on 26.09.2022.
//

import RealmSwift

class RealmManager {
    
    private let realm = try! Realm()
    static let shared = RealmManager()
    private init() { }
    
    func writeToDo(todo: ToDo) {
        try! realm.write({
            realm.add(todo)
        })
    }
    
    func getCompletedTodos(category: Category? = nil) -> [ToDo] {
        var todos = [ToDo]()
        let tasksInDB = realm.objects(ToDo.self)
        if let category = category {
            for todo in tasksInDB where todo.category == category.rawValue && todo.isComplete {
                todos.append(todo)
            }
        } else {
            for todo in tasksInDB where todo.isComplete {
                todos.append(todo)
            }
        }
        return todos
    }
    
    func getNewTodos(category: Category? = nil) -> [ToDo] { // = nil по умолчанию
        var todos = [ToDo]()
        let tasksInDB = realm.objects(ToDo.self)
        
        if let category = category {
            for todo in tasksInDB where todo.category == category.rawValue && !todo.isComplete {
                todos.append(todo)
            }
        } else {
            for todo in tasksInDB where !todo.isComplete {
                todos.append(todo)
            }
        }
        return todos
    }
    
    func printConfig() {
        print(realm.configuration.fileURL!.absoluteString)
    }
    
    func removeFromDB(todo: ToDo) {
        try! realm.write({
            realm.delete(todo)
        })
    }
    
    func makeDown(task: ToDo) {
        try! realm.write({
            task.isComplete = true
        })
    }
    
}
