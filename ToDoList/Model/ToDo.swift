//
//  ToDo.swift
//  ToDoList
//
//  Created by Alexander Zub on 24.09.2022.
//

import Foundation
import RealmSwift

enum Category: String {
    case impUrg = "Важное срочное"
    case impNotUrg = "Важное несрочное"
    case notImpUrg = "Неважное срочное"
    case notImpNotUrg = "Неважное несрочное"
}

//все модели в реалме наследуются от Object. Реалм сам понимает какого типа данные в объекте
class ToDo: Object {
    
    //Модификатор для занесения свойств в БД реалма
    @Persisted var title: String = ""
    @Persisted var id: String = UUID().uuidString
    @Persisted var descript: String
    @Persisted var category: String
    @Persisted var isComplete: Bool = false
    //@Persisted var createdTime: Date = Date()
    //@Persisted var completeDate: Date? = nil
    //@Persisted var planDate: Date = Date()
    
    //Возвращаем имя первичного ключа через переопределнную функцию
    override class func primaryKey() -> String? { return "id" }
    
    //удобный инициализатор вместо обычного, потому-что обычный приведет к ошибкам.
    convenience init(title: String, descript: String, category: Category/*, planDate: Date*/) {
        self.init()
        self.title = title
        self.descript = descript
        self.category = category.rawValue
        //self.planDate = planDate
    }
    
}

