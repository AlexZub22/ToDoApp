//
//  CategoryCell.swift
//  ToDoList
//
//  Created by Alexander Zub on 24.09.2022.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    static let reuseId = "CategoryCell"
    
    let imageView = UIImageView(image: UIImage(systemName: "hare.fill"))
    let categoryTitleLabel = UILabel(text: "Имя категории", font: FontsLibrary.smallButton)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        backgroundColor = .white
        categoryTitleLabel.textAlignment = .center
    }
    
    func setupConstraints() {
        let stack = UIStackView(views: [imageView, categoryTitleLabel], axis: .vertical, spacing: 2)
        Helper.tamicOff(views: [stack])
        Helper.addSub(views: [stack], to: self)
        
        NSLayoutConstraint.activate([stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
                                     stack.topAnchor.constraint(equalTo: topAnchor, constant: 2),
                                     stack.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     stack.centerYAnchor.constraint(equalTo: centerYAnchor)
                                    ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
