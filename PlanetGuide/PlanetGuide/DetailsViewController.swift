//
//  DetailsViewController.swift
//  PlanetGuide
//
//  Created by Günce Özer on 17.08.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var chosenPlanetName = ""
    var chosenPlanetImage = ""
    var chosenPlanetText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: chosenPlanetImage)
        label.text = chosenPlanetName
        textView.text = chosenPlanetText
    
    }
    

   

}
