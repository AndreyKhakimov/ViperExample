//
//  CourseDetailsPresenter.swift
//  SwiftbookApp
//
//  Created by Andrey Khakimov on 25.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import Foundation

struct CourseDetailsData {
    let courseName: String
    let numberOfLessons: Int
    let numberOfTests: Int
    let imageData: Data?
    let isFavourite: Bool
}

class CourseDetailsPresenter: CourseDetailsViewOutputProtocol {
    private unowned let view: CourseDetailsViewInputProtocol
    var interactor: CourseDetailsInteractorInputProtocol!
    
    required init(view: CourseDetailsViewInputProtocol) {
        self.view = view
    }
    
    func showDetails() {
        interactor.provideCourseDetails()
    }
    
    func favouriteButtonPressed() {
        interactor.toggleFavouriteStatus()
    }
    
}

// MARK: - CourseDetailsInteractorOutputProtocol
extension CourseDetailsPresenter: CourseDetailsInteractorOutputProtocol {
    
    func receiveCourseDetails(with courseData: CourseDetailsData) {
        let numberOfLessons = "Number of lessons: \(courseData.numberOfLessons)"
        let numberOfTests = "Number of tests: \(courseData.numberOfTests)"
        view.displayCourseName(with: courseData.courseName)
        view.displayNumberOfLessons(with: numberOfLessons)
        view.displayNumberOfTests(with: numberOfTests)
        view.displayImageForFavouriteButton(with: courseData.isFavourite)
        guard let imageData = courseData.imageData else { return }
        view.displayImage(with: imageData)
    }
    
    func receiveFavouriteStatus(with status: Bool) {
        view.displayImageForFavouriteButton(with: status)
    }
    
}
