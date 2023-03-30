//
//  ViewController.swift
//  userdefault
//
//  Created by Josaphat Campos Pereira on 30/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var themeSwitch: UISwitch!
    
    let themekey:String = "isDark"
    
    let defaults = UserDefaults.standard
    
    @IBAction func switchFlipped(sender:Any){
        defaults.set(themeSwitch.isOn, forKey: themekey)
        changeTheme(themeSwitch.isOn)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let isDark = defaults.value(forKey: themekey){
            if isDark as! Bool{
                changeTheme(isDark as! Bool)
            }
        }
        
        sandBoxFIle()
    }
    
    func changeTheme(_ value:Bool){
        themeSwitch.setOn(value, animated: false)
        overrideUserInterfaceStyle = value ? .dark : .light
    }
    
    func sandBoxFIle(){
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.txt")
        
        do{
            try "Olá Mundo!".write(to: url!, atomically: true, encoding: .utf8)
        }catch{
            print("Erro ao tentar escrever no arquivo")
        }
        
        do{
            let content = try String(contentsOf: url!, encoding: String.Encoding.utf8)
            
            if content == "Olá Mundo!"{
                print("Deu certo \(content)")
            }else{
                print("nao")
            }
        }catch{
            print("Não conseguiu ler conteudo")
        }
    }


}

