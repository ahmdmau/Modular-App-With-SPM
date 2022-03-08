//
//  Coordinator.swift
//  Coordinator
//
//  Created by MEKARI on 08/03/22.
//

import Foundation
import UIKit

public protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
