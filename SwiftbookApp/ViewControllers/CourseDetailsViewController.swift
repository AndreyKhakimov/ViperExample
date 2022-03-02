//
//  CourseDetailsViewController.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 04/08/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

class CourseDetailsViewController: UIViewController {
    
    @IBOutlet private var courseNameLabel: UILabel!
    @IBOutlet private var numberOfLessonsLabel: UILabel!
    @IBOutlet private var numberOfTestsLabel: UILabel!
    @IBOutlet private var courseImage: UIImageView!
    @IBOutlet private var favoriteButton: UIButton!
    
    var course: Course!
    
    private var isFavorite = false

    override func viewDidLoad() {
        super.viewDidLoad()
        loadFavoriteStatus()
        setupUI()
    }
    
    @IBAction func toggleFavorite(_ sender: UIButton) {
        isFavorite.toggle()
        setStatusForFavoriteButton()
        DataManager.shared.setFavoriteStatus(for: course.name, with: isFavorite)
    }
    
    private func setupUI() {
        courseNameLabel.text = course.name
        numberOfLessonsLabel.text = "Number of lessons: \(course.numberOfLessons)"
        numberOfTestsLabel.text = "Number of tests: \(course.numberOfTests)"
        
        if let imageData = ImageManager.shared.fetchImageData(from: course.imageUrl) {
            courseImage.image = UIImage(data: imageData)
        }
              
        setStatusForFavoriteButton()
    }
    
    private func setStatusForFavoriteButton() {
        favoriteButton.tintColor = isFavorite ? .red : .gray
    }
    
    private func loadFavoriteStatus() {
        isFavorite = DataManager.shared.getFavoriteStatus(for: course.name)
    }
}
