//
//  ViewController.swift
//  PlanetGuide
//
//  Created by Günce Özer on 17.08.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var planetNames = [String]()
    var planetImages = [String]()
    var planetExplanations = [String]()
    var chosenName = ""
    var chosenImage = ""
    var chosenText = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
       
        planetNames.append("Mercury")
        planetNames.append("Venus")
        planetNames.append("Earth")
        planetNames.append("Mars")
        planetNames.append("Jupiter")
        planetNames.append("Saturn")
        planetNames.append("Uranus")
        planetNames.append("Neptune")
        
        
        planetImages.append("mercury")
        planetImages.append("venus")
        planetImages.append("earth")
        planetImages.append("mars")
        planetImages.append("jupiter")
        planetImages.append("saturn")
        planetImages.append("uranus")
        planetImages.append("neptune")
        
        planetExplanations.append("Mercury—the smallest planet in our solar system and closest to the Sun—is only slightly larger than Earth's Moon. Mercury is the fastest planet, zipping around the Sun every 88 Earth days.")
        planetExplanations.append("Venus spins slowly in the opposite direction from most planets. A thick atmosphere traps heat in a runaway greenhouse effect, making it the hottest planet in our solar system.")
        planetExplanations.append("Earth—our home planet—is the only place we know of so far that’s inhabited by living things. It's also the only planet in our solar system with liquid water on the surface.")
        planetExplanations.append("Mars is a dusty, cold, desert world with a very thin atmosphere. There is strong evidence Mars was—billions of years ago—wetter and warmer, with a thicker atmosphere.")
        planetExplanations.append("Jupiter is more than twice as massive than the other planets of our solar system combined. The giant planet's Great Red spot is a centuries-old storm bigger than Earth.")
        planetExplanations.append("Adorned with a dazzling, complex system of icy rings, Saturn is unique in our solar system. The other giant planets have rings, but none are as spectacular as Saturn's.")
        planetExplanations.append("Uranus—seventh planet from the Sun—rotates at a nearly 90-degree angle from the plane of its orbit. This unique tilt makes Uranus appear to spin on its side.")
        planetExplanations.append("Neptune—the eighth and most distant major planet orbiting our Sun—is dark, cold and whipped by supersonic winds. It was the first planet located through mathematical calculations, rather than by telescope.")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planetNames.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = planetNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            planetNames.remove(at: indexPath.row)
            planetImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenName = planetNames[indexPath.row]
        chosenImage = planetImages[indexPath.row]
        chosenText = planetExplanations[indexPath.row]
        
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.chosenPlanetName = chosenName
            destinationVC.chosenPlanetImage = chosenImage
            destinationVC.chosenPlanetText = chosenText
        }
    }

}

