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
    func receiveDataForViewDidLoadState(with dataStore: CourseListDataStore)
}

class CourseListInteractor: CourseListInteractorInputProtocol {
    
    unowned let presenter: CourseListInteractorOutputProtocol
    
    required init(presenter: CourseListInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func provideDataForViewDidLoadState() {
        NetworkManager.shared.fetchData { [weak self] courses in
            let dataStore = CourseListDataStore(courses: courses)
            self?.presenter.receiveDataForViewDidLoadState(with: dataStore)
        }
    }
    
    func provideDataForSelectedRow() {
        
    }
    
    
}
