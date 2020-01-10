//
//  FollowerDetailsViewController.swift
//  githubSeanAllen
//
//  Created by jaafar barek on 1/7/20.
//  Copyright © 2020 jaafar barek. All rights reserved.
//

import UIKit
import SDWebImage

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
                        self.createdAtLabel.text = self.user.createdAt
                        
                    } catch {}
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    
    @IBAction func githubProfileButton(_ sender: Any) {
    }
    
    @IBAction func getFollowersButton(_ sender: Any) {
    }
    
    @objc func addTapped(sender: UIBarButtonItem) {
    }
}
