//
//  UIApplicationProtocol.swift
//  SDKUnitTest
//
//  Created by 近藤 寛志 on 2019/05/19.
//  Copyright © 2019 iret, Inc. All rights reserved.
//

import UIKit

protocol UIApplicationProtocol {
    func canOpenURL(_ url: URL) -> Bool
    func open(_ url: URL, options: [UIApplication.OpenExternalURLOptionsKey : Any], completionHandler completion: ((Bool) -> Void)?)
}

extension UIApplication: UIApplicationProtocol {}
