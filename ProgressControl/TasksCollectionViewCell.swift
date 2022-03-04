//
//  TasksCollectionViewCell.swift
//  ProgressControl
//
//  Created by Глеб Писарев on 03.03.2022.
//

import UIKit

class TasksCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        addSubview(taskName)
        //taskName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        taskName.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20).isActive = true
    }
    
    var taskName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
