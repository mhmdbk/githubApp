//
//  User.swift
//  githubSeanAllen
//
//  Created by jaafar barek on 1/8/20.
//  Copyright © 2020 jaafar barek. All rights reserved.
//
 

import Foundation

struct User : Codable {
    var login : String?
    var id : Int?
    var nodeId : String?
    var avatarUrl : String?
    var gravatarId : String?
    var url : String?
    var htmlUrl : String?
    var followersUrl : String?
    var followingUrl : String?
    var gistsUrl : String?
    var starredUrl : String?
    var subscriptionsUrl : String?
    var organizationsUrl : String?
    var reposUrl : String?
    var eventsUrl : String?
    var receivedEventsUrl : String?
    var type : String?
    var siteAdmin : Bool?
    var name : String?
    var company : String?
    var blog : String?
    var location : String?
    var email : String?
    var hireable : String?
    var bio : String?
    var publicRepos : Int?
    var publicGists : Int?
    var followers : Int?
    var following : Int?
    var createdAt : String?
    var updatedAt : String?

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

    init() {
        
    }
    
}
