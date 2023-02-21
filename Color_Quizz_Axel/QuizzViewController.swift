//
//  QuizzViewController.swift
//  Color_Quizz_Axel
//
//  Created by Carlos Villavicencio Vasquez on 5/01/23.
//

import UIKit

class QuizzViewController: UIViewController {
    
    var numeroPregunta: Int
    
    var preguntaLabel = UILabel()
    
    var yesButton = UIButton(type: .system)
    
    var noButton = UIButton(type: .system)
    
   static var respuestas = [false, false, false, false]
    
    
    init(numeroPregunta: Int){
        self.numeroPregunta = numeroPregunta
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder : NSCoder) {
        numeroPregunta = 0
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemRed
        preguntaLabel.textColor = .black
        preguntaLabel.font = preguntaLabel.font.withSize(20)
        preguntaLabel.numberOfLines = 0
        
        
        yesButton.setTitle("SI", for: .normal)
        yesButton.setTitleColor(.black, for: .normal)
        yesButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        yesButton.addTarget(self, action: #selector(QuizzViewController.seleccionarSi), for: UIControl.Event.touchUpInside)
        
        noButton.setTitle("NO", for: .normal)
        noButton.setTitleColor(.black, for: .normal)
        noButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        noButton.addTarget(self, action: #selector(QuizzViewController.seleccionarNo), for: UIControl.Event.touchUpInside)
        
        preguntaLabel.text = GeneradorPreguntas.obtenerPregunta(numeroPregunta: numeroPregunta)
        
        
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        
        view.addSubview(preguntaLabel)
        preguntaLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            preguntaLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            preguntaLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            preguntaLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -16.0)
        ])
        
        view.addSubview(yesButton)
        yesButton.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate( [
        yesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor , constant: 0),
        yesButton.centerYAnchor.constraint(equalTo: view.centerYAnchor , constant:  -40)
        ])
        
        
        view.addSubview(noButton)
        noButton.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate( [
        noButton.centerXAnchor.constraint(equalTo: view.centerXAnchor , constant: 0),
        noButton.centerYAnchor.constraint(equalTo: view.centerYAnchor , constant:  40)
        ])
    }

    @objc func seleccionarSi(){
        QuizzViewController.respuestas[numeroPregunta] = true
        siguientePantalla()
    }
    
    @objc func seleccionarNo(){
        QuizzViewController.respuestas[numeroPregunta] = false
        siguientePantalla()
        
    }
    
    func siguientePantalla(){
        if GeneradorPreguntas.esUltimaPregunta(numeroPregunta: numeroPregunta){
            //Queremos ir a un controlador nuevo con los resultados
            navigationController?.pushViewController(ResultsViewController(), animated: true)
        }else{
            //Queremos desplegar una nueva pregunta
            navigationController?.pushViewController(QuizzViewController(numeroPregunta: numeroPregunta + 1), animated: true)

        }
    }
}
