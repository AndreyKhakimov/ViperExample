//
//  CourseCell.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 04/08/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

protocol CellModelRepresentable {
    var viewModel: CourseCellViewModelProtocol? { get }
}

class CourseTableViewCell: UITableViewCell, CellModelRepresentable {
    var viewModel: CourseCellViewModelProtocol? {
        didSet {
            updateView()
        }
    }
    
    private func updateView() {
        guard let viewModel = viewModel as? CourseCellViewModel else { return }
        var content = defaultContentConfiguration()
        content.text = viewModel.courseName
        if let imageData = viewModel.imageData {
            content.image = UIImage(data: imageData)
        }
        contentConfiguration = content
    }
    
}
