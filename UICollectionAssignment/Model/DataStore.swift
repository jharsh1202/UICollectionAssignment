//
//  DataStore.swift
//  UICollectionAssignment
//
//  Created by Harshit Jain on 21/06/21.
//
import UIKit

final class DataStore {
    
    static let sharedInstance = DataStore()
    fileprivate init() {}
    
    var dataSource = ["something" , "camel" , "pictures", "ios" , "xcode" , "champion" , "experience" , "customer" , "knowledge" , "management", "training" ,  "benchmark"]
   
}
