//
//  NewTaskViewController.swift
//  ProgressControl
//
//  Created by Глеб Писарев on 08.03.2022.
//

import UIKit
import CoreData

class NewTaskViewController: UIViewController {
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    lazy private var nameFild: UITextField = {
        let textFild = UITextField()
        textFild.placeholder = "Название задачи"
        textFild.layer.cornerRadius = 10
        return textFild
    }()
    lazy private var addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Добавить", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(add), for: .touchUpInside)
        return button
    }()
    
    lazy private var doneButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("Отмена", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(done), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(nameFild)
        view.addSubview(addButton)
        view.addSubview(doneButton)
        setConstraint()
        
    }
    
    private func setConstraint(){
        
        nameFild.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameFild.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            nameFild.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            nameFild.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
        
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            doneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            doneButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            doneButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40)
        ])
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addButton.bottomAnchor.constraint(equalTo: doneButton.topAnchor, constant: -20),
            addButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            addButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40)
        ])
    }
    
    @objc private func add(){
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "Task", in: context) else { return }
        guard let task = NSManagedObject(entity: entityDescription, insertInto: context) as? Task else { return }
        
        task.name = nameFild.text
        
        if context.hasChanges{
            do {
                try context.save()
            } catch let error {
                print(error)
            }
        }
        dismiss(animated: true)
    }
    
    @objc private func done(){
        dismiss(animated: true)
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
