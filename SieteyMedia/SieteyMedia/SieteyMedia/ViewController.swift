//
//  ViewController.swift
//  SieteyMedia
//
//  Created by Yaser  on 28/11/2020.
//  Copyright © 2020 Yaser . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var juego = Juego()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.suscribirse()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func nuevaPartida(_ sender: Any) {
        juego.comenzarPartida()
    }
    
    @IBAction func pedirCarta(_ sender: Any) {
        juego.jugadorPideCarta()
    }
    
    @IBAction func plantarse(_ sender: Any) {
        juego.jugadorSePlanta()
    }
    
    private func suscribirse() {
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(self.recibir), name: NSNotification.Name(rawValue: "resultado"), object: nil)
    }
    
    @objc func recibir(notification: Notification) {
        if let userInfo = notification.userInfo {
            let mensaje = userInfo["mensaje"] as! String
            mostrarResultado(mensaje: mensaje)
        }
    }
    
    private func mostrarResultado(mensaje: String) {
        let alert = UIAlertController(title: "Resultado de la partida", message: mensaje, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) {
            action in
        }
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
}

