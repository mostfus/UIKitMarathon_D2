//
//  CustomButton.swift
//  UIKitMarathon_D2
//
//  Created by Maksim Vaselkov on 05.02.2024.
//

import Foundation
import UIKit

final class CustomButton: UIButton {

    typealias Action = (() -> Void)?

    private let action: Action
    private let text: String
    private var animation: UIViewPropertyAnimator?

    init(
        text: String,
        action: Action
    ) {
        self.text = text
        self.action = action

        super.init(frame: .zero)

        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func tintColorDidChange() {
        if tintAdjustmentMode == .dimmed {
            backgroundColor = .systemGray2
            tintColor = .systemGray3
        } else {
            backgroundColor = .systemBlue
            tintColor = .white
        }
    }

    func setup() {
        setTitle(text, for: .normal)

        let image = UIImage(systemName: "arrow.right.circle.fill")
        setImage(image, for: .normal)
        setImage(image, for: .highlighted)
        semanticContentAttribute = .forceRightToLeft

        backgroundColor = .systemBlue
        tintColor = .white

        layer.cornerRadius = 8

        imageEdgeInsets = .init(top: 0, left: 8, bottom: 0, right: 0)
        contentEdgeInsets = .init(top: 10, left: 14, bottom: 10, right: 14)


        addTarget(self, action: #selector(onTouchDown), for: .touchDown)
        addTarget(self, action: #selector(onTouchUpInside), for: .touchUpInside)
    }

    @objc
    private func onTouchDown() {
        animation?.stopAnimation(true)
        animation = UIViewPropertyAnimator(duration: 0.3, curve: .easeIn, animations: {
            self.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        })
        animation?.startAnimation()
    }

    @objc
    private func onTouchUpInside() {
        animation?.stopAnimation(true)
        animation = UIViewPropertyAnimator(duration: 0.3, curve: .easeIn, animations: {
            self.transform = .identity
        })
        animation?.startAnimation()
        action?()
    }
}
