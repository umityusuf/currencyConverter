//
//  ViewController.swift
//  currencyConvert
//
//  Created by ümit yusuf erdem on 20.03.2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func getRatesClicked(_ sender: Any) {
        
        // 1 ) Request & Session url ye gitmek, oraya bir istek yollamak
        
        // 2 ) İsteği almak Response & Data
        
        // 3 ) Datayı işlemek Parsing & JSON Serialization
        
        // Url yi tanımla
        
        
        
        
        // 1 )
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=4a990ae1cc0ef5a920e4c7e9eeb1123c")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            } else {
                
                // 2 ) Veriyi almak
                if data != nil {
                    // JSON Result Objesi oluştur.
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        DispatchQueue.main.async {
                            if let rates = jsonResponse["rates"] as? [String: Any] {
                               // print(rates)
                                
                                if let cad = rates["CAD"] as? Double {
                                    self.cadLabel.text = "CAD: \(cad)"
                                }
                                
                                if let chf = rates["CHF"] as? Double {
                                    self.chfLabel.text = "CHF: \(chf)"
                                }
                                
                                if let gbp = rates["GBP"] as? Double {
                                    self.gbpLabel.text = "GBP: \(gbp)"
                                }
                                
                                
                                if let jpy = rates["JPY"] as? Double {
                                    self.jpyLabel.text = "JPY: \(jpy)"
                                }
                                
                                if let usd = rates["USD"] as? Double {
                                    self.usdLabel.text = "USD: \(usd)"
                                }
                                
                                if let TRY = rates["TRY"] as? Double {
                                    if TRY > Double(20.30) {
                                        self.tryLabel.textColor = UIColor.green
                                        self.tryLabel.text = "TRY: \(TRY)"
                                    }
                                    
                                }
                                
                                
                            }
                        }
                    } catch {
                        print("Error")
                    }
                }
            }
        }
        
        task.resume()
        
        
        
        
        
    }
    

}

