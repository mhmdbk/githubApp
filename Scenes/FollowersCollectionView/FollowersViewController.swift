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
    @IBOutlet weak var userNameLabel: UILabel!
    
    var searchActive : Bool = false
    var userName: String = ""
    var followers = [Followers]()
    var filtered = [Followers]()
    var currentItem : Followers!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetups()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.showSpinner(onView: self.view)
        getFollowers()
    }
    func initialSetups(){
        usernameSearchBar.delegate = self
        followersCollectionView.delegate = self
        followersCollectionView.dataSource = self
        followersCollectionView.register(UINib(nibName: "FollowersCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FollowersCollectionViewCell")
        userNameLabel.text = userName
    }
    
    func getFollowers() {
        APIClient.shared.getFollowers(userName:userName) { (result) in
            switch result {
            case .success:
                do {
                    self.followers = try result.get()
                    DispatchQueue.main.async {
                        self.followersCollectionView.reloadData()
                    }
                    self.removeSpinner()
                } catch {}
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension FollowersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchActive {
            return filtered.count
        } else {
            return followers.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FollowersCollectionViewCell", for: indexPath) as! FollowersCollectionViewCell
        currentItem = searchActive ? filtered[indexPath.item] : followers[indexPath.item]
        cell.configure(withFollowers: currentItem)
        return cell
    }
}

extension FollowersViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = collectionView.bounds.width/3.0
        let yourHeight = yourWidth - 6
        return CGSize(width: yourHeight, height: yourHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "FollowerDetails", bundle: nil)
        let VC = storyBoard.instantiateViewController(identifier: "FollowerDetailsViewController" ) as! FollowerDetailsViewController
        if searchActive {
            VC.userName = filtered[indexPath.item].login ?? ""
        }
        else {
            VC.userName = followers[indexPath.item].login ?? ""
            
        }
        navigationController?.pushViewController(VC, animated: true)
        
    }
}

extension FollowersViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filtered = followers.filter { $0.login!.range(of: searchText, options: .caseInsensitive) != nil }
        if searchBar.text!.isEmpty {
            searchActive = false;
        } else {
            searchActive = true;
        }
        DispatchQueue.main.async {
            
            self.followersCollectionView.reloadData()
        }
        
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
}
