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
    
    @State var isCheckedS_AtomOne: Bool = false
    @State var isCheckedP_AtomOne: Bool = false
    @State var isCheckedS_AtomTwo: Bool = false
    @State var isCheckedP_AtomTwo: Bool = false
    
    
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
            
            HStack {
                Text("First Orbital: ")
                Button(action: {
                            self.isCheckedS_AtomOne.toggle()
                        }) {
                            HStack(alignment: .center, spacing: 10) {
                                Image(systemName: isCheckedS_AtomOne ? "checkmark.square" : "square")
                                Text("S Orbital")
                            }
                        }
                
                Button(action: {
                            self.isCheckedP_AtomOne.toggle()
                        }) {
                            HStack(alignment: .center, spacing: 10) {
                                Image(systemName: isCheckedP_AtomOne ? "checkmark.square" : "square")
                                Text("P Orbital")
                            }
                        }
            }
            
            HStack {
                Text("Second Orbital: ")
                Button(action: {
                            self.isCheckedS_AtomTwo.toggle()
                        }) {
                            HStack(alignment: .center, spacing: 10) {
                                Image(systemName: isCheckedS_AtomTwo ? "checkmark.square" : "square")
                                Text("S Orbital")
                            }
                        }
                
                Button(action: {
                            self.isCheckedP_AtomTwo.toggle()
                        }) {
                            HStack(alignment: .center, spacing: 10) {
                                Image(systemName: isCheckedP_AtomTwo ? "checkmark.square" : "square")
                                Text("P Orbital")
                            }
                        }
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
        
        
        if isCheckedS_AtomOne==true && isCheckedP_AtomOne==false && isCheckedS_AtomTwo==true && isCheckedP_AtomTwo==false{
            myMonteCarlo.computeAllSbyS()
        }
        else if isCheckedS_AtomOne==false && isCheckedP_AtomOne==true && isCheckedS_AtomTwo==true && isCheckedP_AtomTwo==false{
            myMonteCarlo.computeAllSbyP()
        }
        else if isCheckedS_AtomOne==true && isCheckedP_AtomOne==false && isCheckedS_AtomTwo==false && isCheckedP_AtomTwo==true{
            myMonteCarlo.computeAllSbyP()
        }
        else if isCheckedS_AtomOne==false && isCheckedP_AtomOne==true && isCheckedS_AtomTwo==false && isCheckedP_AtomTwo==true {
            myMonteCarlo.computeAllPbyP()
        }
        else{
            print("error, check each box once for each orbital")
        }
        
        computedIntegralValue = myMonteCarlo.integralValue
        
    }
    
    func clear(){
        computedIntegralValue = 0.0
        interAtomicSpacingString = "0.0"
        nString = "0.0"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
