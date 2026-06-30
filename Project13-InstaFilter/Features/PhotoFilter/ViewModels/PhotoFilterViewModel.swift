//
//  PhotoFilterViewModel.swift
//  Project13-InstaFilter
//
//  Created by Karla E. Martins Fernandes on 26/06/26.
//

import UIKit

protocol PhotoFilterViewModelDelegate: AnyObject {
    func didUpdateImage(_ image: UIImage)
}

final class PhotoFilterViewModel {
    
    private let filterService: FilterServiceProtocol
    weak var delegate: PhotoFilterViewModelDelegate?
    
    private var originalImage: UIImage?
    private var processedImage: UIImage?

    private var selectedFilter: FilterOption = .sepia
    private var intensity: Float = 0.5
    
    var currentImage: UIImage? {
        processedImage
    }
    
    init(filterService: FilterServiceProtocol) {
        self.filterService = filterService
    }
    
    
    func setImage(_ image: UIImage) {
        originalImage = image
        processedImage = image

        delegate?.didUpdateImage(image)
    }
    
    func updateIntensity(_ value: Float) {
        intensity = value
        applyCurrentFilter()
    }
    
    func updateFilter(_ filter: FilterOption) {
        selectedFilter = filter
        applyCurrentFilter()
    }
    
    private func applyCurrentFilter() {
        guard let originalImage else { return }

        processedImage = filterService.applyFilter(to: originalImage, filter: selectedFilter, intensity: intensity)

        if let processedImage {
            delegate?.didUpdateImage(processedImage)
        }
    }
}
