//
//  Util.swift
//  Astraeus
//
//  Created by Alex on 12/3/20.
//

import Foundation

extension StringProtocol {
    // easy String-indexing
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

// https://stackoverflow.com/questions/16612086/compare-very-large-numbers-stored-in-string
// RETURN VALUES:
// 1: x > y
// 0: x = y
//-1: x < y
func compareInts(_ l: String, _ r: String) -> Int
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
