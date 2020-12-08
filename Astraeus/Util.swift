//
//  Util.swift
//  Astraeus
//
//  Created by Aaron Lieberman on 11/8/20.
//

import Foundation

class Util {
    static func call_api(_ url_name: String) {
        guard let url = URL(string: url_name) else {
            print("Error: cannot create url")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: {
            body, res, err in
            
            guard err == nil else {
                print(err!)
                return
            }
            
            guard let resData = body else {
                print("Error: no data")
                return
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
