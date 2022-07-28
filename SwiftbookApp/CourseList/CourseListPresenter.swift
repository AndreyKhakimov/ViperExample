//
//  CourseListPresenter.swift
//  SwiftbookApp
//
//  Created by Andrey Khakimov on 25.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import Foundation

struct CourseListDataStore {
    let courses: [Course]
}

class CourseListPresenter: CourseListViewOutputProtocol {
    
    unowned let view: CourseListViewInputProtocol
    var interactor: CourseListInteractorInputProtocol!
    
    private var dataStore: CourseListDataStore?
    
    required init(view: CourseListViewInputProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        interactor.provideDataForViewDidLoadState()
    }
    
    func didSelectCell(at indexPath: IndexPath) {
        
    }
    
}

extension CourseListPresenter: CourseListInteractorOutputProtocol {
    
    func receiveDataForViewDidLoadState(with courses: [Course]) {
        let section = CourseSectionViewModel()
        courses.forEach { section.rows.append(CourseCellViewModel(course: $0)) }
        view.reloadData(for: section)
    }
    
    func receiveDataForSelectedRow(with course: Course) {
    }
    
}
