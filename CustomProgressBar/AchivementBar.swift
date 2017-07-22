//
//  AchivementBar.swift
//  CustomProgressBar
//
//  Created by 最上聖也 on 2017/07/22.
//  Copyright © 2017年 SeiyaMogami. All rights reserved.
//

import UIKit

class AchivementBar: UIView {

    @IBOutlet weak var backgroundBar: UIView!
    @IBOutlet weak private var achivementBar: UIView!
    @IBOutlet weak private var achivementWidth: NSLayoutConstraint!
    @IBOutlet weak var achivementLabel: UILabel!

    private let minWidth = CGFloat(30.0)

    var achivementRate: Double = 0.0 {
        didSet {
            achivementLabel.alpha = 0.0
            let rate = CGFloat(achivementRate < 0 ? 0 : ( achivementRate > 100 ? 100 : achivementRate ))
            let width = rate / 100 * (backgroundBar.bounds.size.width - minWidth) + minWidth
            achivementWidth.constant = width

            achivementLabel.text = Int(rate).description + "%"

            DispatchQueue.main.async { [weak self] in
                UIView.animate(withDuration: 2.0, animations: {
                    self?.layoutIfNeeded()
                }) { _ in
                    UIView.animate(withDuration: 0.2, animations: { [weak self] in
                        self?.achivementLabel.alpha = 1.0
                    })
                }
            }
        }
    }

    private func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        let view = Bundle.main.loadNibNamed("AchivementBar", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)


        achivementWidth.constant = CGFloat(minWidth)
        self.layoutIfNeeded()

        // 左右の端を丸にする
        backgroundBar.layer.masksToBounds = true
        achivementBar.layer.masksToBounds = true
        let barHeight = backgroundBar.frame.size.height
        backgroundBar.layer.cornerRadius = barHeight / 2
        achivementBar.layer.cornerRadius = barHeight / 2
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
}
