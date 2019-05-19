//
//  UIApplicationMock.swift
//  SDKUnitTestTests
//
//  Created by 近藤 寛志 on 2019/05/19.
//  Copyright © 2019 iret, Inc. All rights reserved.
//

import UIKit
@testable import SDKUnitTest

class UIApplicationMock: UIApplicationProtocol {
    var invokedCanOpenURL = false
    var invokedCanOpenURLCount = 0
    var invokedCanOpenURLParameters: (url: URL, Void)?
    var invokedCanOpenURLParametersList = [(url: URL, Void)]()
    var stubbedCanOpenURLResult: Bool! = false
    func canOpenURL(_ url: URL) -> Bool {
        invokedCanOpenURL = true
        invokedCanOpenURLCount += 1
        invokedCanOpenURLParameters = (url, ())
        invokedCanOpenURLParametersList.append((url, ()))
        return stubbedCanOpenURLResult
    }
    var invokedOpen = false
    var invokedOpenCount = 0
    var invokedOpenParameters: (options: [UIApplication.OpenExternalURLOptionsKey : Any], Void)?
    var invokedOpenParametersList = [(options: [UIApplication.OpenExternalURLOptionsKey : Any], Void)]()
    var stubbedOpenCompletionHandlerResult: ((Bool), Void)?
    func open(_ url: URL, options: [UIApplication.OpenExternalURLOptionsKey : Any], completionHandler completion: ((Bool) -> Void)?) {
        invokedOpen = true
        invokedOpenCount += 1
        invokedOpenParameters = (options, ())
        invokedOpenParametersList.append((options, ()))
        if let result = stubbedOpenCompletionHandlerResult {
            completion?(result.0)
        }
    }
}
