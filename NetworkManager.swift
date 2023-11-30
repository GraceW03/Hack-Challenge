//
//  NetworkManager.swift
//  A4
//
//  Created by Dwain Anderson on 11/16/23.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    func placeholder(completion: @escaping ([placeholder]) -> Void) {
        
        let endpoint = ""
        
        
        let decoder = JSONDecoder()
    
        AF.request(endpoint, method: .get)
            .validate()
            .responseDecodable(of: [placeholder].self, decoder: decoder) { response in
                switch response.result {
                case .success(let placeholder):
                    print("Successfully fetched \(placeholder.count) recipes")
                    completion(placeholder)
                case .failure(let error):
                    print("Error in NetworkManager.placeholder: \(error.localizedDescription)")
                }
            }
    }
