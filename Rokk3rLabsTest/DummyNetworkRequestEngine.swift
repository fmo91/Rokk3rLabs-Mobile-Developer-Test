//
//  DummyNetworkRequestEngine.swift
//  Rokk3rLabsTest
//
//  Created by Fernando on 24/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import Foundation
import RxSwift

struct DummyNetworkRequestEngine: NetworkRequestEngine {
    func dispatch(url: String) -> Observable<Any> {
        return .create { observer in
            guard let file = Bundle.main.url(forResource: url, withExtension: "json") else {
                observer.onError(DataError.invalidResource)
                return Disposables.create {}
            }
            
            do {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                
                if let object = json as? [String: Any] {
                    // json is a dictionary
                    observer.onNext(object)
                    observer.onCompleted()
                } else if let object = json as? [Any] {
                    // json is an array
                    observer.onNext(object)
                    observer.onCompleted()
                } else {
                    observer.onError(DataError.invalidResource)
                }
            } catch _ {
                observer.onError(DataError.invalidResource)
            }
            
            return Disposables.create {}
        }
    }
}
