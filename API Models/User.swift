//
//  User.swift
//  githubSeanAllen
//
//  Created by jaafar barek on 1/8/20.
//  Copyright © 2020 jaafar barek. All rights reserved.
//
 

import Foundation
struct User : Codable {
    let login : String?
    let id : Int?
    let nodeId : String?
    let avatarUrl : String?
    let gravatarId : String?
    let url : String?
    let htmlUrl : String?
    let followersUrl : String?
    let followingUrl : String?
    let gistsUrl : String?
    let starredUrl : String?
    let subscriptionsUrl : String?
    let organizationsUrl : String?
    let reposUrl : String?
    let eventsUrl : String?
    let receivedEventsUrl : String?
    let type : String?
    let siteAdmin : Bool?
    let name : String?
    let company : String?
    let blog : String?
    let location : String?
    let email : String?
    let hireable : String?
    let bio : String?
    let publicRepos : Int?
    let publicGists : Int?
    let followers : Int?
    let following : Int?
    let createdAt : String?
    let updatedAt : String?

    enum CodingKeys: String, CodingKey {

        case login = "login"
        case id = "id"
        case nodeId = "node_id"
        case avatarUrl = "avatar_url"
        case gravatarId = "gravatar_id"
        case url = "url"
        case htmlUrl = "html_url"
        case followersUrl = "followers_url"
        case followingUrl = "following_url"
        case gistsUrl = "gists_url"
        case starredUrl = "starred_url"
        case subscriptionsUrl = "subscriptions_url"
        case organizationsUrl = "organizations_url"
        case reposUrl = "repos_url"
        case eventsUrl = "events_url"
        case receivedEventsUrl = "received_events_url"
        case type = "type"
        case siteAdmin = "site_admin"
        case name = "name"
        case company = "company"
        case blog = "blog"
        case location = "location"
        case email = "email"
        case hireable = "hireable"
        case bio = "bio"
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case followers = "followers"
        case following = "following"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }

    
}
