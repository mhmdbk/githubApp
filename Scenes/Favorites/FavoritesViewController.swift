//
//  FavoritesViewController.swift
//  githubSeanAllen
//
//  Created by jaafar barek on 1/7/20.
//  Copyright © 2020 jaafar barek. All rights reserved.
//

import UIKit
import  CoreData
class FavoritesViewController: UIViewController {
    
    @IBOutlet weak var favoritesTableView: UITableView!
    
    var favoriteUsers = [User]()
    var user: User! = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
        let  FavoriteTableViewCellNib = UINib(nibName: "FavoritesTableViewCell", bundle: .main)
        favoritesTableView.register(FavoriteTableViewCellNib, forCellReuseIdentifier: "FavoritesTableViewCell")
        favoritesTableView.rowHeight = UITableView.automaticDimension
        favoritesTableView.estimatedRowHeight = 80
        favoritesTableView.tableFooterView = UIView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        retreiveData()
    }
    func retreiveData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SingleUser")
        do {
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                if let login = data.value(forKey: "login") as? String {
                    user.login = login
                    user.avatarUrl = data.value(forKey: "avatar_url") as? String
                }
                favoriteUsers.append(user)
                DispatchQueue.main.async {
                    self.favoritesTableView.reloadData()
                }
            }
        }catch {
            print("Failed")
        }
    }
    
    
}

extension FavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            favoriteUsers.remove(at: indexPath.row)
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            let managedContext = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SingleUser")
            do {
                let test = try managedContext.fetch(fetchRequest)
                let objectToDelete = test[indexPath.row] as! NSManagedObject
                managedContext.delete(objectToDelete)
                try managedContext.save()
            } catch {
                print(error)
            }
            favoritesTableView.reloadData()
        }
        
    }
    
}
extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell", for: indexPath) as! FavoritesTableViewCell
        let currentItem = favoriteUsers[indexPath.row]
        cell.favoriteNameLabel.text = currentItem.login
        cell.favoriteImageView.sd_setImage(with: URL(string: currentItem.avatarUrl!))
        
        return cell
    }
    
    
    
    
    
}
