//
//  Observable.swift
//  DaedalusSentence
//
//  Created by Bart Waeterschoot on 15/01/16.
//  Copyright © 2016 Cripplefish Games. All rights reserved.
//

import Foundation

class Observable<T> {
    
    let didChange = Event<(T, T)>()
    private var value: T
    
    init(_ initialValue: T) {
        value = initialValue
    }
    
    func set(newValue: T) {
        let oldValue = value
        value = newValue
        didChange.raise(oldValue, newValue)
    }
    
    func get() -> T {
        return value
    }
}
