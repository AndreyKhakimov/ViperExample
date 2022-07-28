//
//  CourseCellViewModel.swift
//  SwiftbookApp
//
//  Created by Andrey Khakimov on 26.07.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import Foundation

protocol CourseCellViewModelProtocol {
    var cellIdentifier: String { get }
    var cellHeight: Double { get }
    var courseName: String { get }
    var imageData: Data? { get }
    
    init(course: Course)
}

protocol CourseSectionViewModelProtocol {
    var rows: [CourseCellViewModelProtocol] { get }
}

class CourseCellViewModel: CourseCellViewModelProtocol {
    
    var cellIdentifier: String {
        "CourseCell"
    }
    
    var cellHeight: Double {
        100
    }
    
    var courseName: String {
        course.name
    }
    
    var imageData: Data? {
        ImageManager.shared.fetchImageData(from: course.imageUrl)
    }
    
    private let course: Course
    
    required init(course: Course) {
        self.course = course
    }
    
}

class CourseSectionViewModel: CourseSectionViewModelProtocol {
    
    var rows: [CourseCellViewModelProtocol] = []
    
}
