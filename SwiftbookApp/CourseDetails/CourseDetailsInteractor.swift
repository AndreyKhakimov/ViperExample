//
//  CourseDetailsInteractor.swift
//  SwiftbookApp
//
//  Created by Andrey Khakimov on 25.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import Foundation

protocol CourseDetailsInteractorInputProtocol {
    var isFavourite: Bool { get }
    init(presenter: CourseDetailsInteractorOutputProtocol, course: Course)
    func provideCourseDetails()
    func toggleFavouriteStatus()
}

protocol CourseDetailsInteractorOutputProtocol: AnyObject {
    func receiveCourseDetails(with courseData: CourseDetailsData)
    func receiveFavouriteStatus(with status: Bool)
}

class CourseDetailsInteractor: CourseDetailsInteractorInputProtocol {
    
    private unowned let presenter: CourseDetailsInteractorOutputProtocol
    private let course: Course
    
    var isFavourite: Bool {
        get {
            DataManager.shared.getFavoriteStatus(for: course.name)
        }
        
        set {
            DataManager.shared.setFavoriteStatus(for: course.name, with: newValue)
        }
    }
    
    required init(presenter: CourseDetailsInteractorOutputProtocol, course: Course) {
        self.presenter = presenter
        self.course = course
    }
    
    func provideCourseDetails() {
        let imageData = ImageManager.shared.fetchImageData(from: course.imageUrl)
        let courseDetailsData = CourseDetailsData(
            courseName: course.name,
            numberOfLessons: course.numberOfLessons,
            numberOfTests: course.numberOfTests,
            imageData: imageData,
            isFavourite: isFavourite
        )
        presenter.receiveCourseDetails(with: courseDetailsData)
    }
    
    func toggleFavouriteStatus() {
        isFavourite.toggle()
        presenter.receiveFavouriteStatus(with: isFavourite)
    }
    
}
