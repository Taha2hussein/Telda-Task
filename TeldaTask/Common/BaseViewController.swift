//
//  BaseViewController.swift
//  TeldaTask
//
//  Created by Taha Hussein on 29/11/2024.
//

import UIKit
class BaseViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func trimText(_ text: String) -> String {
        return text.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func navigateToCoach() {
//        let vc = UIStoryboard(name: "Coach_Auth", bundle: nil).instantiateViewController(withIdentifier: "CoachTabVC") as! CoachTabVC
//        userDefaults.set(true, forKey: Constants.KEYS.IS_COACH)
//        self.navigationController?.pushViewController(vc, animated: true)
    }
   
    func showError(msg:String) {
        self.getShowAlert(str: "\(msg)")
    }
}

extension UIViewController {
    
    //alert
    func getShowAlert(str:String){
        let alertController = DOAlertController(title: nil, message: str, preferredStyle: .alert)
        let cancelAction = DOAlertAction(title: "OK", style: .cancel) { action in}
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}
