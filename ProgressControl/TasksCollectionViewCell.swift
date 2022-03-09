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
        
        addSubview(deleteButton)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            deleteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            deleteButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            deleteButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            deleteButton.widthAnchor.constraint(equalToConstant: 90)
        ])
        
        addSubview(taskName)
        taskName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            taskName.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            taskName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            taskName.rightAnchor.constraint(equalTo: deleteButton.leftAnchor, constant: 10)
        ])
    }
    
    var taskName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var deleteButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        //button.setTitle("Добавить", for: .normal)
        button.layer.cornerRadius = 10
        //button.addTarget(self, action: #selector(add), for: .touchUpInside)
        return button
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
