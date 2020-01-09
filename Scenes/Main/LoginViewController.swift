//
//  LoginViewController.swift
//  githubSeanAllen
//
//  Created by jaafar barek on 1/7/20.
//  Copyright © 2020 jaafar barek. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var getFollowersButton: UIButton!
    var user : User!
        override func viewDidLoad() {
        super.viewDidLoad()
      }
    
    @IBAction func getFollowers(_ sender: Any) {
        APIClient.shared.getUser { (result) in
            switch result {
            case .success:
                do {
                    let storyBoard = UIStoryboard(name: "Followers", bundle: nil)
                    let vc = storyBoard.instantiateViewController(identifier: "FollowersViewController") as! FollowersViewController
                    self.navigationController?.pushViewController(vc, animated: true)
                     
                } catch {}
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
    

}
