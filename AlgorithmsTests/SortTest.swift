//
//  QSortTest.swift
//  Algorithms
//
//  Created by Ruslan Samsonov on 21/01/2017.
//  Copyright © 2017 Ruslan Samsonov. All rights reserved.
//

import Algorithms
import XCTest

class SortTest: XCTestCase {
    
    func testQSort() {
        var arr = generateArr(size: Int(arc4random_uniform(1000)) + 100)
        QSort.sort(arr: &arr)
        testSortedArr(arr: arr)
    }
    
    func testBinaryHeapTree() {
        let arr = generateArr(size: Int(arc4random_uniform(1000)) + 100)
        let heapTree = BinaryHeapTree(arr: arr)
        var sortedArr = Array(repeating: 0, count: arr.count)
        var i = 0
        while !heapTree.isEmpty() {
            sortedArr[i] = heapTree.popMax()
            i += 1
        }
        testSortedArr(arr: sortedArr.reversed())
    }
    
    func generateArr(size: Int) -> [Int] {
        var randomArr = [Int]()
        for _ in 0..<size {
            randomArr.append(Int(arc4random_uniform(UInt32(size))))
        }
        return randomArr
    }
    
    func testSortedArr<T:Comparable>(arr: [T]) {
        print("Sorted array: \(arr)")
        for i in 0..<(arr.count - 1) {
            assert(arr[i] <= arr[i + 1])
        }
    }
}
