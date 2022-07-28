//
//  CourseDetailsConfigurator.swift
//  SwiftbookApp
//
//  Created by Andrey Khakimov on 25.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import Foundation

protocol CourseDetailsConfiguratorInputProtocol {
    func configure(with viewController: CourseDetailsViewController, and course: Course)
}

class CourseDetailsConfigurator: CourseDetailsConfiguratorInputProtocol {
    
    func configure(with viewController: CourseDetailsViewController, and course: Course) {
        let presenter = CourseDetailsPresenter(view: viewController)
        let interactor = CourseDetailsInteractor(presenter: presenter, course: course)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
    }
    
}
