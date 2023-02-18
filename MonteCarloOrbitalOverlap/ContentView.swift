//
//  ContentView.swift
//  MonteCarloOrbitalOverlap
//
//  Created by IIT Phys 440 on 2/17/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var interAtomicSpacingString: String = "0.0"
    @State var nString: String = "0.0"
    @State var computedIntegralValue: Double = 0.0
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Orbital Overlap Integration Through Monte Carlo Technique")
            
            
            
            HStack {
                Text("Interatomic Spacing:")
                TextField("", text: $interAtomicSpacingString)
            }
            
            HStack {
                Text("Sample Size:")
                TextField("", text: $nString)
            }
            
            HStack{
                Button("Compute", action: {self.calculate()})
                Button("Clear", action: {self.clear()})
            }
            
            HStack {Text("Integral Value:")
                Text("\(self.computedIntegralValue, specifier: "%.30f")")
            }
            
        }
        .padding()
    }
    
    func calculate(){
        print("Calculating...")
        let myMonteCarlo = MonteCarlo3D()
        myMonteCarlo.n = Int(nString)!
        myMonteCarlo.interAtomicSpacing = Double(interAtomicSpacingString)!
        myMonteCarlo.computeAll()
        
        computedIntegralValue = myMonteCarlo.integralValue
    }
    
    
    
    
    
    
    
    
    
    func clear(){
        print("Clearing...")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
