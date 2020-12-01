//
//  Util.swift
//  Astraeus
//
//  Created by Aaron Lieberman on 11/8/20.
//

import Foundation

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self,
        resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map {
          URLQueryItem(name: $0.0, value: $0.1)
        }
        return components?.url
    }
}

enum APIError: Error {
    case cannotCreateUrl
    case httpErr
    case noData
    case json
    case couldNotGetData
}


class Util {
    
    static func call_api(url url_name: String, callback: @escaping () -> Void) throws {
        
        guard let url = URL(string: url_name) else {
            print("Error: cannot base create url")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: {
            body, res, err in
            
            guard err == nil else {
                print(err!)
                throw APIError.httpErr
            }
            
            guard let resData = body else {
                throw APIError.noData
            }
            
            do {
                guard let str = try JSONSerialization.jsonObject(with: resData, options: []) as? [String: Any] else {
                    print("Error: could not convert json")
                    return
                }
            
                print(str)
            } catch {
                print("Error: could not get data")
            }
            
        })
        
        task.resume()
    }
}
