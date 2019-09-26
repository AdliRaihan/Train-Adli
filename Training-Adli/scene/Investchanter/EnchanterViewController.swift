//
//  EnchanterViewController.swift
//  Training-Adli
//
//  Created by Stella Patricia on 18/09/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit
import Kingfisher

struct RNGPossible {
    var lowPercent : Float?
    var highPercent : Float?
    var basePercent : Float?
    var failStacks : Float?
}

struct RNGStatic {
    var lowPercent : Float = 0.500
    var highPercent : Float = 1.500
}

class EnchanterViewController: UIViewController {

    @IBOutlet weak var itemHolder: UIView!
    @IBOutlet weak var labelitem: UILabel!
    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var FailstacksNumber: UILabel!
    @IBOutlet weak var progressBarEnchant: UIView!
    @IBOutlet weak var progressBarEnchantInside: UIProgressView!
    private var rng : RNGPossible?
    private var enchantValue : Int = 0
    private var timer : Timer?
    private var failBefore : Int = 0
    private var fail : Int = 0
    
    var originalValue : Float {
        switch enchantValue {
        case 8: return Float.random(in: 0.005...0.50000)
        case 9: return Float.random(in: 0.07500...0.50000)
        case 10: return Float.random(in: 0.01500...0.50000)
        case 11: return Float.random(in: 0.25000...0.50000)
        case 12: return Float.random(in: 0.45000...0.50000)
        case 13: return Float.random(in: 0.47000...0.50000)
        case 14: return Float.random(in: 0.48000...0.50000)
        default: return 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initializeRNG()
        setupUI()
    }
    
    private func setupUI() {
        imageItem.image = #imageLiteral(resourceName: "ic_weapon")
        labelitem.textDropShadow(withColor: UIColor.orange)
        labelitem.textColor = UIColor.orange
        labelitem.text = "(EPIC) Kzarka Longbow +0"
        itemHolder.backgroundColor = UIColor.init(named: "#393e46")
        itemHolder.setShadow()
    }
    
    private func getBasePercentByEnchant (_enchant : Int) -> Float {
        switch _enchant {
        case 8: return 0.80
        case 9: return 0.50
        case 10: return 0.25
        case 11: return 0.10
        case 12: return 0.075
        case 13: return 0.050
        case 14: return 0.025
        case 15: return 0.02
        default: return 1
        }
    }
    
    private func initializeRNG () {
        rng = RNGPossible.init(lowPercent: RNGStatic.init().lowPercent, highPercent: RNGStatic.init().highPercent, basePercent: 1, failStacks: 0)
    }
    
    private func getRandomValue () -> Float {
        return Float.random(in: -2.0000...2.0000)
    }
    
    @objc private func enchantment () -> Bool {
        let enchantmentStats = getBasePercentByEnchant(_enchant: enchantValue)
        let valueRandom = getRandomValue()
        self.shrinkValue()
        
        if enchantValue >= 15 {
            timer?.invalidate()
        }

        if enchantmentStats == 1 {
            enchantValue += 1
            return true
        } else {
            if let _rng = rng {
                if _rng.lowPercent! <= valueRandom && _rng.highPercent! >= valueRandom {
                    "VALUE RANDOM".createMessage(message: "\(valueRandom)")
                    enchantValue += 1
                    labelitem.text = "(EPIC) Kzarka Longbow + \(enchantValue)"
                    checkSuccessRatio()
                    return true
                } else {
                    
                }
            }
        }
        FailstacksNumber.text = String(fail)
        fail += 1
        return false
    }
    
    private func checkPersentasionSuccess () {
        if rng != nil {
            let computePercent = 100 - ((100 - ((rng!.highPercent! - rng!.lowPercent!) * 100) ) / 100) * 100
            print("Success Percent \(computePercent)% \(rng!.highPercent! - rng!.lowPercent!) \(rng!.highPercent!) \(rng!.lowPercent!)")
        }
    }
    
    private func checkSuccessRatio () {
        let ratio : Float = (Float( fail - failBefore) / 100.0)
        failBefore = fail
        "Hard Ratio".createMessage(message: "\(ratio)% on \(fail) failed attempt - on \(computateFailStacks()) Connection in MS - \(rng!.highPercent!) Graph Maximum \(rng!.lowPercent!) Graph Minimum")
        fail = 0
    }
    
    private func shrinkValue () {
        if rng != nil {
            rng!.lowPercent! = ( RNGStatic().lowPercent + originalValue ) - (computateFailStacks())
            rng!.highPercent! = ( RNGStatic().highPercent - originalValue ) + (computateFailStacks())
            checkPersentasionSuccess ()
        }
    }
    
    private func computateFailStacks () -> Float {
        var failStacksFloat = Float(fail)
        if failStacksFloat > 50 {
            failStacksFloat /= 350.000000
        } else {
            failStacksFloat /= 500.000000
        }
        return failStacksFloat
    }
    
    @IBAction func startEnchant (_ sender: Any) {
        timer?.invalidate()
        enchantValue = 0
        fail = 0
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(enchantment), userInfo: nil, repeats: true)
//        startEnchant()
    }
}
