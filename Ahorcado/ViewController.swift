//
//  ViewController.swift
//  Ahorcado
//
//  Created by Cetys on 04/11/2020.
//  Copyright © 2020 Cetys. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //declaramos una variable de instancia para almacenar la palabra que se tiene que averiguar y inicio la instancia
    let palabraSecreta : String = "cetyssss"
    var numeroFallos = 0;

    @IBOutlet var palabraOculta: UILabel!
    
    @IBOutlet var imagenesAhorcado: UIImageView!
    @IBAction func letraPulsada(_ sender: UIButton) {
        //vamos a guardar el primer elemento del título botón(la letra)
        let letra = Array(sender.currentTitle!)[0]
        //nos muestra el valor por consola
        print(letra);
        if chequeaLetra(letra: letra) == 0{
            numeroFallos+=1;
        }
            print(numeroFallos)
        if partidaGanada() {
            numeroFallos = 3000
        }
        cambiaMonigote(numeroImagen: numeroFallos)
        sender.isHidden = true
    }
    func chequeaLetra(letra : Character) -> Int {
        var aciertos:Int = 0;
        var auxiliar = ""
        var posicion:Int = 0;
        for p in palabraSecreta.characters{
            if p == letra{
                print("SI ESTA")
                aciertos+=1;
                auxiliar.append(letra)
            }
            else{
                auxiliar.append(Array((palabraOculta.text!).characters)[2*posicion])
            }
            auxiliar = auxiliar + " "
            posicion+=1;
        }
        
        palabraOculta.text = auxiliar
        return aciertos
    }
    
    func poneGuionesEnLabel(){
        var auxiliar = ""
        for p in palabraSecreta.characters{
            auxiliar = auxiliar + "_ "
        }
        palabraOculta.text = auxiliar
    }
    func cambiaMonigote(numeroImagen:Int) {
        switch numeroImagen {
        case 0: imagenesAhorcado.image = UIImage(named: "ahorcado0.png")
        case 1: imagenesAhorcado.image = UIImage(named: "ahorcado1.png")
        case 2: imagenesAhorcado.image = UIImage(named: "ahorcado2.png")
        case 3: imagenesAhorcado.image = UIImage(named: "ahorcado3.png")
        case 4: imagenesAhorcado.image = UIImage(named: "ahorcado4.png")
        case 5: imagenesAhorcado.image = UIImage(named: "ahorcado5.png")
        case 3000: imagenesAhorcado.image = UIImage(named: "win.png")
            
        
        default: imagenesAhorcado.image = UIImage(named: "ahorcado6.png")
            <#code#>
        }
    }
    func partidaGanada() -> Bool {
        var ganada = true
        for p in (palabraOculta.text!).characters{
            if p == "_" {
                ganada = false
            }
        }
        return ganada
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        poneGuionesEnLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

