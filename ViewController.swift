//
//  ViewController.swift
//  UIKitMarathon_D2
//
//  Created by Maksim Vaselkov on 05.02.2024.
//

import UIKit

class ViewController: UIViewController {

    private lazy var firstButton = CustomButton(text: "First Button", action: nil)
    private lazy var secondButton = CustomButton(text: "Second Medium Button", action: nil)
    private lazy var thirdButton = CustomButton(text: "Third", action: thirdButtonTapped)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        setupViews()
        setupConstraints()
    }


    private func setupViews() {
        firstButton.translatesAutoresizingMaskIntoConstraints = false

        secondButton.translatesAutoresizingMaskIntoConstraints = false

        thirdButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            firstButton.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, multiplier: 1),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 15),
            secondButton.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, multiplier: 1),
            secondButton.centerXAnchor.constraint(equalTo: firstButton.centerXAnchor),

            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 15),
            thirdButton.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, multiplier: 1),
            thirdButton.centerXAnchor.constraint(equalTo: secondButton.centerXAnchor)
        ])
    }

    private func thirdButtonTapped() {
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        present(vc, animated: true)
    }
}
