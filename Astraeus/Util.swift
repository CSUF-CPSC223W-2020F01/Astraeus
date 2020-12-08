//
//  Util.swift
//  Astraeus
//
//  Created by Aaron Lieberman on 11/8/20.
//

import Foundation

class Util {
    static func call_api(_ url_name: String, callback: @escaping ([String: Any]?) -> Void) {
        guard let url = URL(string: url_name) else {
            print("\nError: cannot create url\n")
            callback(nil);
            return;
        }
        
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: {
            body, res, err in
            
            guard err == nil else {
                print("\nHTTP ERROR\n")
                print(err!)
                callback(nil)
                return
            }
            
            guard let resData = body else {
                print("\nError: no data\n")
                callback(nil)
                return
            }
            
            do {
                guard let result = try JSONSerialization.jsonObject(with: resData, options: []) as? [String: Any] else {
                    print("\nError: could not convert json\n")
                    callback(nil)
                    return
                }
            
                callback(result)
            } catch {
                print("\nError: could not get data\n")
                callback(nil)
            }
            
        })
        
        task.resume()
    }
    
    // param. MUST follow the format yyyy-MM-dd
    static func stringToDate(_ isoDate: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter.date(from:isoDate)
    }
}
