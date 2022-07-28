//
//  CourseDetailsViewController.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 04/08/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

protocol CourseDetailsViewInputProtocol: AnyObject {
    func displayCourseName(with title: String)
    func displayNumberOfLessons(with title: String)
    func displayNumberOfTests(with title: String)
    func displayImage(with imageData: Data)
    func displayImageForFavouriteButton(with status: Bool)
}

protocol CourseDetailsViewOutputProtocol {
    init(view: CourseDetailsViewInputProtocol)
    func showDetails()
    func favouriteButtonPressed()
}

class CourseDetailsViewController: UIViewController {
    
    @IBOutlet private var courseNameLabel: UILabel!
    @IBOutlet private var numberOfLessonsLabel: UILabel!
    @IBOutlet private var numberOfTestsLabel: UILabel!
    @IBOutlet private var courseImage: UIImageView!
    @IBOutlet private var favoriteButton: UIButton!
    
    var course: Course!
    var presenter: CourseDetailsViewOutputProtocol!
    
    private let configurator = CourseDetailsConfigurator()

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self, and: course)
        presenter.showDetails()
    }
    
    @IBAction func toggleFavorite(_ sender: UIButton) {
        presenter.favouriteButtonPressed()
    }

}

// MARK: - CourseDetailsViewInputProtocol
extension CourseDetailsViewController: CourseDetailsViewInputProtocol {
    
    func displayNumberOfLessons(with title: String) {
        numberOfLessonsLabel.text = title
    }
    
    func displayNumberOfTests(with title: String) {
        numberOfTestsLabel.text = title
    }
    
    
    func displayCourseName(with title: String) {
        courseNameLabel.text = title
    }
    
    func displayImage(with imageData: Data) {
        courseImage.image = UIImage(data: imageData)
    }
    
    func displayImageForFavouriteButton(with status: Bool) {
        favoriteButton.tintColor = status ? .red : .gray
    }
    
}
