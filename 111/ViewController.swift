//
//  ViewController.swift
//  111
//
//  Created by cf on 2021/1/11.
//
//参考https://www.jianshu.com/p/58e0945619ed


import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let m = model()
        //委托vc异步获取一个字符串
        m.qulitySelectedBlock { () -> String in
            let queue = DispatchQueue(label: "com.sfit.demo")
            let sema = DispatchSemaphore(value:0)
            var a = "123"
            print("===a====\(a)")
            queue.async {
                Thread.sleep(forTimeInterval: 1)
                print("task1 done")
                a = "asdfasdf"
                let sign = sema.signal()
                print("sign: \(sign)")
            }
            _ = sema.wait(timeout: .distantFuture)
            return a
        }
        m.aaa()
//        aa()
    }
    func aa(){
        let queue = DispatchQueue(label: "com.sfit.demo")
                let sema = DispatchSemaphore(value: 0)
                
                queue.async {
                    Thread.sleep(forTimeInterval: 0.4)
                    print("task1 done")
                    let sign = sema.signal()
                    print("sign: \(sign)")
                }
                var result = sema.wait(timeout: .distantFuture)
                print(result)
                
                queue.async {
                    
                    Thread.sleep(forTimeInterval: 0.2)
                    print("task2 done")
                    let sign = sema.signal()
                    print("sign: \(sign)")
                }
                result = sema.wait(timeout: .distantFuture)
                print(result)
    }
    
}

