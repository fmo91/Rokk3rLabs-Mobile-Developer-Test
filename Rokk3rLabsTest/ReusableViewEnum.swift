//
//  ReusableViewEnum.swift
//  Rokk3rLabsTest
//
//  Created by Fernando on 24/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import Foundation

protocol ReusableViewEnum {}

extension ReusableViewEnum where Self: RawRepresentable, Self.RawValue == Int {
    static var all: [Self] {
        var index = 0
        var allItems = [Self]()
        while let item = Self(rawValue: index) {
            allItems.append(item)
            index += 1
        }
        return allItems
    }
    
    static func build(with value: Int) -> Self {
        guard let row = Self(rawValue: value) else {
            fatalError("Unimplemented value: \(value)")
        }
        return row
    }
}
