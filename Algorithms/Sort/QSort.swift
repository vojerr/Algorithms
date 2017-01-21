//
//  QSort.swift
//  Algorithms
//
//  Created by Ruslan Samsonov on 21/01/2017.
//  Copyright © 2017 Ruslan Samsonov. All rights reserved.
//

import UIKit

public class QSort {

    public static func sort<T:Comparable>( arr: inout [T]) {
        sort(arr: &arr, startIndex: 0, endIndex: arr.count - 1)
    }
    
    static func sort<T:Comparable>(arr: inout [T], startIndex: Int, endIndex: Int) {
        var medianIndex = Int(arc4random_uniform(UInt32(endIndex - startIndex))) + startIndex
        let median = arr[medianIndex]
        var i = startIndex, j = endIndex
        while i != j {
            while arr[i] <= median && i < medianIndex {
                i += 1
            }
            while arr[j] >= median && j > medianIndex {
                j -= 1
            }
            if i != j {
                if i == medianIndex {
                    medianIndex = j
                } else if j == medianIndex {
                    medianIndex = i
                }
                swap(&arr[i], &arr[j])
            }
        }
        if medianIndex > startIndex + 1 {
            sort(arr: &arr, startIndex: startIndex, endIndex: medianIndex - 1)
        }
        if medianIndex < endIndex - 1 {
            sort(arr: &arr, startIndex: medianIndex + 1, endIndex: endIndex)
        }
    }
}
