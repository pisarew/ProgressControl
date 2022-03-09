//
//  TasksViewController.swift
//  ProgressControl
//
//  Created by Глеб Писарев on 03.03.2022.
//

import UIKit
import CoreData

private let reuseIdentifier = "Cell"

class TasksViewController: UICollectionViewController {
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var tasks: [Task] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(TasksCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        setupNavigationBar()
        
        self.collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    
    
    private func setupNavigationBar() {
        title = "Задачи"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        
        
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addNewTask)
        )
        
        navigationController?.navigationBar.tintColor = .cyan
    }
    @objc private func addNewTask() {
        let newTaskViewController = NewTaskViewController()
        newTaskViewController.modalPresentationStyle = .fullScreen
        present(newTaskViewController, animated: true)
        
        
    }
    
    private func loadData(){
        let fetch: NSFetchRequest<Task> = Task.fetchRequest()
        
        do {
            tasks = try context.fetch(fetch)
            collectionView.reloadData()
        } catch {
            print(error)
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return tasks.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TasksCollectionViewCell
        cell.taskName.text = tasks[indexPath.row].name
        cell.backgroundColor = .cyan
        cell.layer.cornerRadius = 15
        
        return cell
    }

}

extension TasksViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 20, height: 150)
    }
    
}
