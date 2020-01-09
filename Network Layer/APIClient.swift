//
//  APIClient.swift
//  githubSeanAllen
//
//  Created by jaafar barek on 1/7/20.
//  Copyright © 2020 jaafar barek. All rights reserved.
//

import Foundation
import Moya

class APIClient : NSObject {
static let shared = APIClient()
let provider = MoyaProvider<AppNetworkService>()
   
    func AlamoFireGetUser(userName: String, completionHandler : @escaping (Result<User?,Error>) -> ()) {
    
            AF.request("\(url)/profile/get",
                method: .get,
                parameters: nil,
                headers:nil,
                interceptor: nil)
                .validate()
                .responseJSON{(response) in
                    switch response.result {
                    case .success :
                        if let jsonData = response.data {
                            let user = try! JSONDecoder().decode(User.self, from: jsonData)
                            completionHandler(.success(user))
                        }
                    case .failure :
                        break
//                        if let jsonData = response.data {
//                            let error = try! JSONDecoder().decode(ApiErrorModel.self, from: jsonData)
//                            completionHandler(.failure(error))
//
//                        }
                    }
            }
    
        }
    
func getUser(completionHandler : @escaping (Result<User,Error>) -> ()) {
    provider.request(.getUserInfo) { result in
              switch result {
              case let .success(moyaResponse):
  
                  let user = try! JSONDecoder().decode(User.self, from: moyaResponse.data)
  
                  completionHandler(.success(user))
  
              case .failure(let error):
                print("\(String(describing: error.errorDescription))")
                
              }
  
          }
    }

    func getFollowers(completionHandler : @escaping (Result<[Followers],Error>) -> ()) {
        provider.request(.getFollowers) { result in
            switch result {
            case let .success(moyaResponse):
                let followers = try! JSONDecoder().decode([Followers].self, from: moyaResponse.data)
                completionHandler(.success(followers))
            case .failure(let error):
                print(error.errorDescription!)
            }
        }
    }
      }

