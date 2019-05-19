//
//  ViewController.swift
//  SDKUnitTest
//
//  Created by 近藤 寛志 on 2019/05/19.
//  Copyright © 2019 iret, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var urlField: UITextField!
    @IBOutlet weak var failedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onTapOpen(_ sender: Any) {
        resetLabel()
        open(urlString: urlField.text)
    }
    
    // presenterにあるべき処理だが今回はあえてFatViewControllerにする
    internal func open(urlString: String?) {
        guard let urlString = urlString,
            let url = URL(string: urlString) else {
                setFailed()
                return
        }

        if UIApplication.shared.canOpenURL(url) {
            // 開けるなら開く
            UIApplication.shared.open(url, options: [:],
                                      completionHandler: nil)
        } else {
            // 開けなかったのでLabelに書いておく
            setFailed()
        }
    }
    
    internal func resetLabel() {
        failedLabel.text = ""
    }
    
    internal func setFailed() {
        failedLabel.text = "開けないよっ"
    }
    
}

