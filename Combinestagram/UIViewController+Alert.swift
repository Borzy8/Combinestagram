//
//  UIViewController+Alert.swift
//  Combinestagram
//
//  Created by Roman Borzduha on 5/14/19.
//  Copyright © 2019 Underplot ltd. All rights reserved.
//

import UIKit
import RxSwift

extension UIViewController {
    func showAlert(title: String?, description: String? = nil ) -> Observable<Void> {
        return Observable.create({ [weak self] observer in
                let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Close", style: .default, handler: { [weak self] _ in
                    observer.onCompleted()}))
            self?.present(alert, animated: true, completion: nil)
            
            return Disposables.create()
        })
    }
}
