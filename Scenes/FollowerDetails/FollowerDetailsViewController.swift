//
//  FollowerDetailsViewController.swift
//  githubSeanAllen
//
//  Created by jaafar barek on 1/7/20.
//  Copyright © 2020 jaafar barek. All rights reserved.
//

import UIKit
import SDWebImage
import CoreData

class FollowerDetailsViewController: UIViewController {
    var userName: String = "mojombo"
    var user : User!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var loginNameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var repositoriesLabel: UILabel!
    @IBOutlet weak var gistsLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .done, target: self, action: #selector(addTapped))
        getUser()
        self.showSpinner(onView: self.view)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
       func getUser() {
            APIClient.shared.getUser(userName:userName) { (result) in
                switch result {
                case .success:
                    do {
                        self.user = try result.get()
                        self.userImageView.sd_setImage(with: URL(string: self.user.avatarUrl!))
                        self.loginNameLabel.text = self.user.login
                        self.userNameLabel.text = self.user.name
                        self.locationLabel.text = self.user.location
                        self.repositoriesLabel.text = "\(String(describing: self.user.publicRepos!))"
                        self.gistsLabel.text = "\(String(describing: self.user.publicGists!))"
                        self.followersLabel.text = "\(String(describing: self.user.followers!))"
                        self.followingLabel.text = "\(String(describing: self.user.following!))"
                        self.createdAtLabel.text = "account created at: \(String(describing: self.user.createdAt!))"
                        self.removeSpinner()
                    } catch {}
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    
 
    @IBAction func githubProfileButton(_ sender: Any) {
        let alert = UIAlertController(title: "Profile", message: "\(String(describing: user.url!))", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func getFollowersButton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Followers", bundle: nil)
        let VC = storyBoard.instantiateViewController(identifier:"FollowersViewController" ) as! FollowersViewController
        VC.userName = user.login!
        navigationController?.pushViewController(VC, animated: true)
       
    }
    
    @objc func addTapped(sender: UIBarButtonItem) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "SingleUser", in:managedContext)!
        let user1 = NSManagedObject(entity: userEntity, insertInto: managedContext)
        user1.setValue("\(String(describing: user.login!))", forKey: "login")
        user1.setValue("\(String(describing: user.avatarUrl!))", forKey: "avatar_url")
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("could not save. \(error), \(error.userInfo)")
        }
        
    }
    

}
