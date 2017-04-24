//
//  DataManager.swift
//  Rokk3rLabsTest
//
//  Created by Fernando on 24/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import Foundation
import RxSwift
import ObjectMapper

struct DataManager {
    
    fileprivate let engine: NetworkRequestEngine
    
    init(engine: NetworkRequestEngine) {
        self.engine = engine
    }
    
    static func dummyManager() -> DataManager {
        let dummyEngine = DummyNetworkRequestEngine()
        return DataManager(engine: dummyEngine)
    }
    
}

// MARK: - Products -
extension DataManager {
    func getProducts() -> Observable<[Product]> {
        return engine
            .dispatch(url: "products")
            .map(transformToJSONArray)
            .map(buildProductFromJSON)
    }
    
    private func transformToJSONArray(_ json: Any) throws -> [[String: Any]] {
        guard let jsonArray = json as? [[String: Any]] else {
            throw DataError.invalidResource
        }
        
        return jsonArray
    }
    
    private func buildProductFromJSON(_ json: [[String: Any]]) throws -> [Product] {
        let mapper = Mapper<Product>()
        if let products = mapper.mapArray(JSONArray: json) {
            return products
        } else {
            throw DataError.invalidResource
        }
    }
}
