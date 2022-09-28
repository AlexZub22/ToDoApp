//
//  MainView.swift
//  ToDoList
//
//  Created by Alexander Zub on 24.09.2022.
//

import UIKit

class MainView: UIView {

    let tableView = TasksTableView()
    let collectionView: UICollectionView!
    let addButton = UIButton(title: "+", bgColor: .clear, textColor: .blue, font: FontsLibrary.largeTitle)
    
    init() {
        self.collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: CompositionalLayoutManager.createLayout())
        super.init(frame: CGRect())
        self.backgroundColor = .white
        setViews()
        setConstraints()
    }

    func setViews() {
        self.collectionView.backgroundColor = .clear
        self.collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseId)
        collectionView.isScrollEnabled = false
    }
    
    func setConstraints() {
        Helper.addSub(views: [collectionView, addButton, tableView], to: self)
        Helper.tamicOff(views: [collectionView, addButton, tableView])
        NSLayoutConstraint.activate([collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                     collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 112),
                                     collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor)
                                    ])
        NSLayoutConstraint.activate([addButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
                                     addButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 48),
                                     addButton.heightAnchor.constraint(equalTo: addButton.widthAnchor),
                                     addButton.widthAnchor.constraint(equalToConstant: 64)
                                    ])
        NSLayoutConstraint.activate([tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
                                     tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
                                     tableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 0),
                                     tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
                                    ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
