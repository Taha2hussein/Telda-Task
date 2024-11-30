//
//  AppConstants.swift
//  TeldaTask
//
//  Created by Taha Hussein on 29/11/2024.
//

import Foundation
enum AppConstants: String {
    case movieList = "MovieListViewController"
   case  movieCell = "MovieListTableViewCell"
    var value : String {
        get {
            return Bundle.main.infoDictionary![self.rawValue] as! String
        }
    }
}
