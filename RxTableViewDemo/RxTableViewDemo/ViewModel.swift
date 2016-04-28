//
//  ViewModel.swift
//  RxTableViewDemo
//
//  Created by Marco Sun on 16/4/28.
//  Copyright © 2016年 com.MarcoSun. All rights reserved.
//

import Foundation
import RxSwift
import RxDataSources

class ViewModel: NSObject {
    
    func getUsers() -> Observable<[SectionModel<String, User>]> {
        return Observable.create { (observer) -> Disposable in
            let users = [User(followersCount: 19_901_990, followingCount: 1990, screenName: "Marco Sun"),
                User(followersCount: 19_890_000, followingCount: 1989, screenName: "Taylor Swift"),
                User(followersCount: 250_000, followingCount: 25, screenName: "Rihanna"),
                User(followersCount: 13_000_000_000, followingCount: 13, screenName: "Jolin Tsai"),
                User(followersCount: 25_000_000, followingCount: 25, screenName: "Adele")]
            let section = [SectionModel(model: "", items: users)]
            observer.onNext(section)
            observer.onCompleted()
            return AnonymousDisposable{}
        }
    }
    
}