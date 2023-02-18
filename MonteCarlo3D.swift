//
//  MonteCarlo3D.swift
//  MonteCarloOrbitalOverlap
//
//  Created by IIT Phys 440 on 2/17/23.
//

import SwiftUI

class MonteCarlo3D: NSObject {
    
    /// Psi1*Psi2
    /// Average all values
    /// Multiply average times bounding box volume
    ///
    
    let myWaveFunction = WaveFunction()
    var interAtomicSpacing:Double = 0.0
    
    var sum: Double = 0.0
    var total: Double = 0.0
    
    var n: Int = 0 ///Sample Size
    
    var lowerXBound:Double = -10.0
    var lowerYBound:Double = -10.0
    var lowerZBound:Double = -10.0
    
    var upperXBound:Double = 10.0
    var upperYBound:Double = 10.0
    var upperZBound:Double = 10.0
    
    var integralValue: Double = 0.0

    var boundingVolume:Double = 0.0
    
    ///Initiatiate randomization variables
    var randX:Double = 0.0
    var randY:Double = 0.0
    var randZ:Double = 0.0
    
    func calculateBoundingVolume(){
        boundingVolume = (upperXBound - lowerXBound)*(upperYBound - lowerYBound)*(upperZBound-lowerZBound)
    }
    
    func randomize(){
        randX = Double.random(in: lowerXBound...upperXBound)
        randY = Double.random(in: lowerYBound...upperYBound)
        randZ = Double.random(in: lowerZBound...upperZBound)
    }
    
    func calculateWaveFunctionMultiplication(){
        self.randomize()
        
        let wavefunctionOne = myWaveFunction.s_OrbitalWaveFunction(x: randX, y: randY, z: randZ, xCenter: (-0.5)*interAtomicSpacing, yCenter: 0, zCenter: 0)
        
        let wavefunctionTwo = myWaveFunction.s_OrbitalWaveFunction(x: randX, y: randY, z: randZ, xCenter: 0.5*interAtomicSpacing, yCenter: 0, zCenter: 0)
        
        sum = sum + wavefunctionOne*wavefunctionTwo
        total = total + 1.0
    }
    
    func calculateIntegral(){
        ///let average = sum/total
        ///
        let average = sum/Double(n)
        self.calculateBoundingVolume()
        integralValue = boundingVolume*average
        print(average)
    }
    
    func computeAll(){
        ///This function computes all of the wavefunction multiplications, averages them and multiplies that value times the bounding box volume
        for _ in 0..<n {
            self.calculateWaveFunctionMultiplication()
        }
        self.calculateIntegral()
    }
    
    

    
    
}
