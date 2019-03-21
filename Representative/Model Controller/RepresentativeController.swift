//
//  RepresentativeController.swift
//  Representative
//
//  Created by Hannah Hoff on 3/21/19.
//  Copyright © 2019 Hannah Hoff. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    static let baseUrl = URL(string: "http://whoismyrepresentative.com/getall_reps_bystate.php")
    
    static func searchRepresentatives(forState state: String, completion: @escaping ([Representative]) -> Void) {
        guard let url = baseUrl else { completion([]); return }
        
        let stateQuery = URLQueryItem(name: "state", value: state.lowercased())
        let jsonQuery = URLQueryItem(name: "output", value: "json")
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = [stateQuery, jsonQuery]
        guard let request = components?.url else { completion([]); return}
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print("💩 There was an error in \(#function) ; \(error) ; \(error.localizedDescription) 💩")
                completion([])
                return
            }
            guard let data = data,
                let responseDataString = String(data: data, encoding: .ascii),
                let fixedData = responseDataString.data(using: .utf8)
                else { completion([]); return }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let resultsDictionary = try jsonDecoder.decode([String: [Representative]].self, from: fixedData)
                let repArray = resultsDictionary["results"]
                completion(repArray ?? [])
            }catch{
                print("Error decoding json: \(error.localizedDescription)")
                completion([])
                return
            }
        }.resume()
    }
}
