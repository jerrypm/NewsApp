//
//  CustomAlert.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 07/02/24.
//

import UIKit

class AlertManager {
    static let shared = AlertManager()

    private init() {}

    func showAlertMessage(title: String, message: String, viewController: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
}
