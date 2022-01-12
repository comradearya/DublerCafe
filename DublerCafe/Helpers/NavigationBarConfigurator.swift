//
//  NavigationBarConfigurator.swift
//  DublerCafe
//
//  Created by arina.panchenko on 12.01.2022.
//

import SwiftUI

struct NavigationBarConfigurator:UIViewControllerRepresentable {
    var configure:(UINavigationController) -> Void = { _ in}
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationBarConfigurator>) -> UIViewController{
        UIViewController()
    }
    func updateUIViewController(_ uiViewController:UIViewController, context: UIViewControllerRepresentableContext<NavigationBarConfigurator>){
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }
}
