//
//  AppCoordinator.swift
//  Project13-InstaFilter
//
//  Created by Karla E. Martins Fernandes on 23/06/26.
//

import UIKit

final class AppCoordinator {

    private let window: UIWindow
    private let navigationController = UINavigationController()

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let viewController = PhotoFilterViewController()

        navigationController.viewControllers = [viewController]

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
