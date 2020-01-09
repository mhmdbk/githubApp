//
//  FollowersViewController.swift
//  githubSeanAllen
//
//  Created by jaafar barek on 1/7/20.
//  Copyright © 2020 jaafar barek. All rights reserved.
//

import UIKit
import SDWebImage

class FollowersViewController: UIViewController {
    
    @IBOutlet weak var followersCollectionView: UICollectionView!
    
    @IBOutlet weak var usernameSearchBar: UISearchBar!
    var searchActive : Bool = false
    var followers = [Followers]()
    var filtered = [Followers]()
    var currentItem : Followers!
    override func viewDidLoad() {
        super.viewDidLoad()
            
        usernameSearchBar.delegate = self
        followersCollectionView.delegate = self
        followersCollectionView.dataSource = self
        self.followersCollectionView.register(UINib(nibName: "FollowersCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FollowersCollectionViewCell")
        getFollowers()
        
    }
    
    func getFollowers() {
        APIClient.shared.getFollowers { (result) in
            switch result {
            case .success:
                do {
                    self.followers = try result.get()
                    DispatchQueue.main.async {
                        self.followersCollectionView.reloadData()
                    }
                } catch {}
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
    
}

extension FollowersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(searchActive){
            return filtered.count
        } else {
             return followers.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FollowersCollectionViewCell", for: indexPath) as! FollowersCollectionViewCell
    
        if(searchActive){
                   currentItem = filtered[indexPath.row]
              } else {
                   currentItem = followers[indexPath.row]
              }
        cell.followersImageView.sd_setImage(with: URL(string: "\(currentItem.avatarUrl!)"), placeholderImage: UIImage(named: "githubMainImage.png"))
        cell.followerName.text = currentItem.login
        return cell
    }
    
    
}

extension FollowersViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let scaleFactor = (screenWidth / 3) - 6
        
        return CGSize(width: scaleFactor, height: scaleFactor)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "FollowerDetails", bundle: nil)
        let VC = storyBoard.instantiateViewController(identifier: "FollowerDetailsViewController" ) as! FollowerDetailsViewController
        VC.user = followers[indexPath.row]
        navigationController?.pushViewController(VC, animated: true)
        
    }
    
    
}

extension FollowersViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filtered = followers.filter { $0.login!.range(of: searchText, options: .caseInsensitive) != nil }
       if(filtered.count == 0){
                searchActive = false;
            } else {
                searchActive = true;
            }
        DispatchQueue.main.async {
            
            self.followersCollectionView.reloadData()
        }
        
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
          searchActive = true;
      }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
          searchActive = false;
      }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
          searchActive = false;
      }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
          searchActive = false;
      }
    
}
