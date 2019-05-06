//
//  APIService.swift
//  podCast
//
//  Created by prabhat pankaj on 17/03/19.
//  Copyright © 2019 learnix. All rights reserved.
//

import Foundation
import Alamofire

class APIService{
    
    static let shared = APIService()
    
    struct trackData: Decodable {
        let resultCount : Int
        let results: [Podcast]
    }
    
    func fetchRequest(searchText: String, completionHandler: @escaping ([Podcast]) -> ()){
        
        let url = "https://itunes.apple.com/search"
        
        let parameters : Parameters = [
            "term" : searchText,
            "media" : "music"
        ]
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).response { (response) in
            
           
            if let err = response.error{
                print("request failed! \(err)")
            }
            
            guard let res = response.data else {return}
            do{
                
                let finalData = try JSONDecoder().decode(trackData.self, from: res)
//                print(finalData)
                completionHandler(finalData.results)
                
            }catch let err{
                print("Error decoding.", err)
            }
            
        }
        
    }
}
