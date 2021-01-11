//
//  model.swift
//  111
//
//  Created by cf on 2021/1/11.
//

import UIKit
typealias AliPalyerViewQulitySelectedBlock = ()->String


class model: NSObject {
    private var qulitySelectedBlock:AliPalyerViewQulitySelectedBlock?

    func qulitySelectedBlock(_ closure: @escaping AliPalyerViewQulitySelectedBlock) {
        qulitySelectedBlock = closure
    }

    
    func aaa(){
        guard let closure = self.qulitySelectedBlock else { return }
        print("回调回来的 = \(closure())")
    }
    
}
