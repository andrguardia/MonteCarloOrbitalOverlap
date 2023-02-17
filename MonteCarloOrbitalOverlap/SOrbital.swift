//
//  SOrbital.swift
//  MonteCarloOrbitalOverlap
//
//  Created by IIT Phys 440 on 2/17/23.
//

import SwiftUI

class SOrbital: NSObject {
    
    var orbitalRadius: Double = 0.0
    var orbitalVolume: Double = 0.0
    var orbitalCoordinates = [(xPoint: Double, yPoint: Double, zPoint: Double)]()
    
    func calculateSOrbitalVolume(){
        ///This code calculates the volume of the S Orbital
        orbitalVolume = (4.0/3.0)*Double.pi*pow(orbitalRadius, 3.0)
    }
    
    func initializeCoordinates(in xPoint: Double, yPoint: Double, zPoint: Double){
        ///This function initializes the S orbital with center xPoint, yPoint and zPoint in 3D cartesian space.
        let xCoord = xPoint
        let yCoord = yPoint
        let zCoord = zPoint
        orbitalCoordinates = [(xCoord, yCoord, zCoord)]
    }
    
    
    
    

}
