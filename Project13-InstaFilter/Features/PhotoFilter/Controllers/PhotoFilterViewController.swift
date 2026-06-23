//
//  PhotoFilterViewController.swift
//  Project13-InstaFilter
//
//  Created by Karla E. Martins Fernandes on 23/06/26.
//

import UIKit

final class PhotoFilterViewController: UIViewController {

    private let contentView = PhotoFilterView()

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Instafilter"
    }
}
