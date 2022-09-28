//
//  CollectionLayoutManager.swift
//  ToDoList
//
//  Created by Alexander Zub on 24.09.2022.
//

import Foundation
import UIKit

class CompositionalLayoutManager {
    static func createLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout.init { sectionIndex, _ in
            
            //item
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(0.9))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            //group
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.45))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
            group.interItemSpacing = .fixed(24)
            
            //section
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 0
            
            section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
            return section
        }
        return layout
    }
}
