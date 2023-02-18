//
//  WaveFunction.swift
//  MonteCarloOrbitalOverlap
//
//  Created by IIT Phys 440 on 2/17/23.
//

import SwiftUI
import Foundation

class WaveFunction: ObservableObject {
    var Z:Double = 1.0 ///Effective Atomic Charge of Hydrogen
    var bohrRadius = 0.529177210903
    
    //https://chem.libretexts.org/Bookshelves/Physical_and_Theoretical_Chemistry_Textbook_Maps/Map%3A_Physical_Chemistry_for_the_Biosciences_(Chang)/11%3A_Quantum_Mechanics_and_Atomic_Structure/11.10%3A_The_Schrodinger_Wave_Equation_for_the_Hydrogen_Atom
    
    
    func s_OrbitalWaveFunction(x:Double, y:Double, z:Double, xCenter:Double, yCenter:Double, zCenter:Double)->Double{
        ///This function calculates the wave function for the S orbital of Hydrogen. Returns the value of the wave function at that point
        let r = sqrt((pow(x-xCenter,2.0)+pow(y-yCenter,2.0)+pow(z-zCenter,2.0)))///in angstrom
        let principalquantumnumber = 1.0 ///For the S orbital
        let rho = 2.0*Z*r/principalquantumnumber
        let psi = pow(Z/bohrRadius, (3.0/2.0))*(1.0/sqrt(Double.pi))*exp(-Z*r/bohrRadius)
        
        return psi
    }

}
