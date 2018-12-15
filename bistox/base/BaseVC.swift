//
//  BaseVC.swift
//  bistox
//
//  Created by Bakhrom Achilov on 11/11/18.
//  Copyright © 2018 Bakhrom Achilov. All rights reserved.
//

import Foundation
import UIKit

class BaseVC<VM>: UIViewController where VM: ViewModel{
    
    var gl:CAGradientLayer!
    var rgl: CAGradientLayer!
    var viewModel: VM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initViewModel()
        do {
            try checkViewModelCreation()
        } catch let error as NSError {
            debugPrint(error.domain)
        }
    }
    
    private func checkViewModelCreation() throws {
        guard let _ = viewModel else {
            throw NSError.simpleError(domain: "View Model is not set")
        }
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    internal func initViewModel() {}
}

extension BaseVC {
    
    internal func makeBistoxBackground() {
        if gl == nil {
            self.gl = CAGradientLayer()
            self.gl.frame = self.view.bounds
            self.gl.colors = [UIColor.black.cgColor, violetteDark.cgColor]
            self.gl.locations = [0.0, 1.0]
            self.view.layer.insertSublayer(self.gl, at: 0)
        }
//        if rgl == nil {
//            self.rgl = CAGradientLayer()
//            self.rgl.startPoint = CGPoint(x: 1.0, y: 0.0)
//            self.rgl.endPoint = CGPoint(x: 0.0, y: 0.75)
//            self.rgl.colors = [gradientFromCyan.cgColor, UIColor.clear.cgColor]
//            self.rgl.frame = self.view.frame
//            self.view.layer.insertSublayer(self.rgl, above: self.gl)
//        }
    }
    
}
