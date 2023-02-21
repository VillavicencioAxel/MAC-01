//
//  ViewController.swift
//  Color_Quizz_Axel
//
//  Created by Carlos Villavicencio Vasquez on 4/01/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemRed;
    }

    @IBAction func mostrarQuizz(_ sender: Any) {
        
        navigationController?.pushViewController(QuizzViewController(numeroPregunta: 0), animated: true)
        
    }
    
}

