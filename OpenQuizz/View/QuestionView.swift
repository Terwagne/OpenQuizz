//
//  QuestionView.swift
//  OpenQuizz
//
//  Created by ISABELLE Terwagne on 18/01/2019.
//  Copyright © 2019 ISABELLE Terwagne. All rights reserved.
//

import UIKit

class QuestionView: UIView {
    
    enum Style {
        case correct, incorrect, standard
    }
    var style:Style = .standard {
        didSet {
            setStyle(style)
        }
    }
    private func setStyle(_ style: Style){
        switch style {
        case .correct:
            icon.image = UIImage(named:"Icon Correct")
            icon.isHidden = false
            backgroundColor = UIColor(red: 200/255.0, green: 236/255.0, blue: 160/255.0, alpha: 1)
        case .incorrect:
            icon.image = UIImage(named: "Icon Error")
            icon.isHidden = false
            backgroundColor = UIColor(red: 243/255.0, green: 135/255.0, blue: 148/255.0, alpha: 1)
        case .standard:
            icon.isHidden = true
            backgroundColor = UIColor(red: 191/255.0, green: 196/255.0, blue: 201/255.0, alpha: 1)
        }
    }
    @IBOutlet private var label: UILabel!
    @IBOutlet private var icon: UIImageView!
    
    var title = "" {
        didSet {
            label.text = title
        }
    }
    
    
}
