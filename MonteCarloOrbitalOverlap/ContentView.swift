//
//  ContentView.swift
//  MonteCarloOrbitalOverlap
//
//  Created by IIT Phys 440 on 2/17/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var interAtomicSpacingString: String = "0.0"
    ///Atom 1 Variables
    @State var AtomOneSRadiusString: String = "0.0"
    @State var AtomOneXCenterString: String = "0.0"
    @State var AtomOneYCenterString: String = "0.0"
    @State var AtomOneZCenterString: String = "0.0"
    
    ///Atom 2 Variables
    @State var AtomTwoSRadiusString: String = "0.0"
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
            HStack{
                
                HStack {
                    Text("Atom One X Center:")
                    TextField("", text: $AtomOneXCenterString)
                }
                HStack {
                    Text("Atom One Y Center:")
                    TextField("", text: $AtomOneYCenterString)
                }
                HStack {
                    Text("Atom One Y Center:")
                    TextField("", text: $AtomOneZCenterString)
                }
            }
            
            HStack {
                Text("Atom One S Orbital Radius:")
                TextField("", text: $AtomOneSRadiusString)
            }
            
            HStack {
                Text("Interatomic Spacing:")
                TextField("", text: $interAtomicSpacingString)
            }
            
            HStack{
                Button("Compute", action: {self.calculate()})
                Button("Clear", action: {self.clear()})
            }
            
        }
        .padding()
    }
    
    func calculate(){
        print("Calculating...")
        ///Initialize First S Orbital
        var sorbitalOne = SOrbital()
        ///Define the First Atom Orbital
        sorbitalOne.orbitalRadius = Double(AtomOneSRadiusString)!
        ///Initialize Orbital One Center Coordinates
        sorbitalOne.orbitalCoordinates = [(Double(AtomOneXCenterString)!,Double(AtomOneYCenterString)! , Double(AtomOneZCenterString)!)]
        
        ///Initialize Second S Orbital
        var sorbitalTwo = SOrbital()
        ///Define the Second Atom Orbital
        sorbitalTwo.orbitalRadius = Double(AtomTwoSRadiusString)!
        ///Initialize Orbital Two Center Coordinates at a distance of "Interatomic Distance' in the x axis
        sorbitalTwo.orbitalCoordinates = [(Double(AtomOneXCenterString)!+Double(interAtomicSpacingString)!,Double(AtomOneYCenterString)! , Double(AtomOneZCenterString)!)]
    }
    
    /// NOW ADD THE MONTECARLO CALCULATION FUNCTION HERE!!!!!!!!!!
    
    
    
    
    
    
    
    
    
    func clear(){
        print("Clearing...")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
