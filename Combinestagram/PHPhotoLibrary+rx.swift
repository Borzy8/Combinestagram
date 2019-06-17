//
//  PHPhotoLibrary+rx.swift
//  Combinestagram
//
//  Created by Roman Borzduha on 5/19/19.
//  Copyright © 2019 Underplot ltd. All rights reserved.
//

import Foundation
import Photos
import RxSwift

extension PHPhotoLibrary {
    static var authorized: Observable<Bool> {
        return Observable.create { observer in
            DispatchQueue.main.async {
                print("AUTH STATUS\(authorizationStatus().rawValue)")
                if authorizationStatus() == .authorized {
                    observer.onNext(true)
                    observer.onCompleted()
                } else {
                    requestAuthorization({ newStatus in
                        observer.onNext(newStatus == .authorized)
                        observer.onCompleted()
                    })
                }
            }
            
            return Disposables.create()
        }
    }
}
