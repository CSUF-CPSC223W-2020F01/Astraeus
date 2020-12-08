//
//  Util.swift
//  Astraeus
//
//  Created by Aaron Lieberman on 11/8/20.
//

import Foundation

extension StringProtocol {
    // easy String-indexing
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

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
    
    // param. MUST follow the format yyyy-MM-dd
    static func stringToDate(_ isoDate: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from:isoDate)
    }
    
    // https://stackoverflow.com/questions/16612086/compare-very-large-numbers-stored-in-string
    // RETURN VALUES:
    // 1: x > y
    // 0: x = y
    //-1: x < y
    static func compareInts(_ l: String, _ r: String) -> Int
    {
        var x = l
        var y = r
        while let range = x.range(of: ",") {
            x.removeSubrange(range.lowerBound...range.lowerBound)
        }
        while let range = y.range(of: ",") {
            y.removeSubrange(range.lowerBound...range.lowerBound)
        }
        
        if x.count > y.count {
            y = y.padding(toLength: x.count, withPad: "0", startingAt: 0)
        }
        else if y.count > x.count {
            x = x.padding(toLength: y.count, withPad: "0", startingAt: 0)
        }

        for i in 0..<x.count
        {
            if x[i] < y[i] {
                return -1;
            }
            if x[i] > y[i] {
                return 1;
            }
        }
        return 0
    }
    
    static func intsLessOrEqualTo(_ l: String, _ r: String) -> Bool {
        return (l.count == r.count) ? l <= r : l.count <= r.count
    }
}
