//
//  APIClient.swift
//  githubSeanAllen
//
//  Created by jaafar barek on 1/7/20.
//  Copyright © 2020 jaafar barek. All rights reserved.
//

import Foundation
import Alamofire

class APIClient : NSObject {
    static let shared = APIClient()
    //let provider = MoyaProvider<AppNetworkService>()
    let url = "https://api.github.com"
    func getUser(userName: String, completionHandler : @escaping (Result<User,Error>) -> ()) {
        
        AF.request("\(url)/users/\(userName)",
            method: .get,
            parameters: nil,
            headers: nil,
            interceptor: nil)
            .validate()
            .responseJSON{(response) in
                switch response.result {
                case .success :
                    if let jsonData = response.data {
                        let user = try! JSONDecoder().decode(User.self, from: jsonData)
                        completionHandler(.success(user))
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    
                }
        }
    }
    //    provider.request(.getUserInfo) { result in
    //              switch result {
    //              case let .success(moyaResponse):
    //
    //                  let user = try! JSONDecoder().decode(User.self, from: moyaResponse.data)
    //
    //                  completionHandler(.success(user))
    //
    //              case .failure(let error):
    //                print("\(String(describing: error.errorDescription))")
    //
    //              }
    //
    //          }
    


    func getFollowers(userName:String, completionHandler : @escaping (Result<[Followers],Error>) -> ()) {
    
    AF.request("\(url)/users/\(userName)/followers",
             method: .get,
             parameters: nil,
             headers: nil,
             interceptor: nil)
             .validate()
             .responseJSON{(response) in
                 switch response.result {
                 case .success :
                     if let jsonData = response.data {
                         let followers = try! JSONDecoder().decode([Followers].self, from: jsonData)
                         completionHandler(.success(followers))
                     }
                 case .failure(let error):
                     print(error.localizedDescription)
                     
                 }
         }
    //        provider.request(.getFollowers) { result in
    //            switch result {
    //            case let .success(moyaResponse):
    //                let followers = try! JSONDecoder().decode([Followers].self, from: moyaResponse.data)
    //                completionHandler(.success(followers))
    //            case .failure(let error):
    //                print(error.errorDescription!)
    //            }
    //        }
}

}

