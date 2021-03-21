//
//  ContentView.swift
//  WeSplit
//
//  Created by FARIT GATIATULLIN on 17.03.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    let tipPercentages = [10, 15, 20, 25, 0]

    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAMount = Double(checkAmount) ?? 0
        
        let tipValue = orderAMount / 100 * tipSelection
        let grandTotal = tipValue + orderAMount
        
        return grandTotal
    }
    
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAMount = Double(checkAmount) ?? 0
        
        let tipValue = orderAMount / 100 * tipSelection
        let grandTotal = tipValue + orderAMount
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    
       var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Total amount")) {
                    Text("$\(grandTotal, specifier: "%.2f")")
                        
                }
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                .navigationBarTitle("WeSplit")
            }
        }
        
                  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
