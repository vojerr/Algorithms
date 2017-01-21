//
//  BinaryHeapTree.swift
//  Algorithms
//
//  Created by Ruslan Samsonov on 21/01/2017.
//  Copyright © 2017 Ruslan Samsonov. All rights reserved.
//

import UIKit

public class BinaryHeapTree <T:Comparable> {
    private var data: [T]
    
    public init(arr: [T]) {
        data = arr
        makeHeap()
    }
    
    public func popMax() -> T {
        let max = data[0]
        let last = data.removeLast()
        if !isEmpty() {
            data[0] = last
            balanceNode(index: 0)
        }
        return max
    }
    
    public func isEmpty() -> Bool {
        return data.isEmpty
    }
    
    private func makeHeap() {
        for i in (0..<(data.count / 2)).reversed() {
            balanceNode(index: i)
        }
    }
    
    private func balanceNode(index: Int) {
        var maxIndex = index
        let leftIndex = index * 2
        let rightIndex = index * 2 + 1
        if leftIndex < data.count && data[leftIndex] > data[maxIndex] {
            maxIndex = leftIndex
        }
        if rightIndex < data.count && data[rightIndex] > data[maxIndex] {
            maxIndex = rightIndex
        }
        if (maxIndex != index) {
            swap(&data[index], &data[maxIndex])
            balanceNode(index: maxIndex)
        }
    }
}
