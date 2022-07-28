//
//  CourseListInteractor.swift
//  SwiftbookApp
//
//  Created by Andrey Khakimov on 25.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import Foundation

protocol CourseListInteractorInputProtocol {
    init(presenter: CourseListInteractorOutputProtocol)
    func provideDataForViewDidLoadState()
    func provideDataForSelectedRow()
}

protocol CourseListInteractorOutputProtocol: AnyObject {
    func receiveDataForViewDidLoadState(with courses: [Course])
    func receiveDataForSelectedRow(with course: Course)
}

class CourseListInteractor: CourseListInteractorInputProtocol {
    
    unowned let presenter: CourseListInteractorOutputProtocol
    
    required init(presenter: CourseListInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func provideDataForViewDidLoadState() {
        NetworkManager.shared.fetchData { [weak self] courses in
            self?.presenter.receiveDataForViewDidLoadState(with: courses)
        }
    }
    
    func provideDataForSelectedRow() {
        
    }
    
    
}
