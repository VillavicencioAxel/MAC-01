//
//  Pregunta.swift
//  Color_Quizz_Axel
//
//  Created by Carlos Villavicencio Vasquez on 5/01/23.
//

import Foundation

struct GeneradorPreguntas {
    static let preguntas = [
        "¿La pasiva de Ursa atravieza armadura?",
        "¿Monkey King tiene 3 golpes de pasiva al cargarla?",
        "¿Legion Comander al ganar duelos gana daño?",
        "¿Nigth Stalker pierde vida de día?"
    ]
    
    static func obtenerPregunta(numeroPregunta: Int) -> String {
        return preguntas [numeroPregunta]
    }
    
    static func esUltimaPregunta(numeroPregunta: Int) -> Bool {
        return numeroPregunta == preguntas.count - 1
    }
}
