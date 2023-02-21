//
//  ResultsViewController.swift
//  Color_Quizz_Axel
//
//  Created by Carlos Villavicencio Vasquez on 9/01/23.
//

import UIKit

class ResultsViewController: UIViewController {
    var resultadotLabel = UILabel()
    var reiniciarButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemRed;

        
        resultadotLabel.text = obtenerResultado()
        resultadotLabel.textColor = .black
        resultadotLabel.font = resultadotLabel.font.withSize(20)
        resultadotLabel.numberOfLines = 0
        
        reiniciarButton.setTitle("Reiniciar", for: .normal)
        reiniciarButton.setTitleColor(.black, for: .normal)
        reiniciarButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        reiniciarButton.addTarget(self, action: #selector(ResultsViewController.reiniciar), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder : NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewWillLayoutSubviews() {
        view.addSubview(resultadotLabel)
        
        resultadotLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resultadotLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            resultadotLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            resultadotLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -16)
            
        ])
        
        
        view.addSubview(reiniciarButton)
        reiniciarButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            reiniciarButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant:  0),
            reiniciarButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
        ])
    }
    
    
    @objc func reiniciar (){
        //Regresar a nuestro controlador principal
        navigationController?.popToRootViewController(animated: true)
        
    }
    
    func obtenerResultado() -> String{
        
        var puntaje = 0
        var resultado = ""
        
        for respuesta in QuizzViewController.respuestas{
            if respuesta == true{
                puntaje += 1
            }
        }
        
        if puntaje >= 3 {
            resultado =  "Jugar Dota es para tí"
        }else{
            resultado =  "Dota es difil pero no impocible"
        }
        return resultado
    }

}
