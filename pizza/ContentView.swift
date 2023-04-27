//
//  ContentView.swift
//  pizza
//
//  Created by Jane Cui on 2023-04-26.
//

import SwiftUI

// enum of type PizzaSize
enum PizzaSize: String, CaseIterable, Identifiable {
  case eight, twelve, twenty
  var id: Self { self }
}

struct ContentView: View {
    @State var name = ""
    @State var inputAddress = ""
    @State var selectedSize = PizzaSize.eight
    @State var forPickup = true
    @State var isVegetarian = true
    
    func placeOrder() {
        print("Order placed!")
    }
    
    var body: some View {
        Form {
          Section { /* name and address */
              TextField("Name", text: $name)
              TextField("Address", text: $inputAddress)
          }
          Section { /* pickup or delivery */
              Toggle("Pick up or delivery", isOn: $forPickup)
          }
          Section { /* Pizza size and vege */
              Picker("Pizza Size", selection: $selectedSize, content: {
                    Text("8\"").tag(PizzaSize.eight)
                    Text("12\"").tag(PizzaSize.twelve)
                    Text("20\"").tag(PizzaSize.twenty)
                  })
                  Toggle("Vegetarian", isOn: $isVegetarian)
          }
          Section { /* order summary */
              // Display the name
              Text("\(name) ordered")
              // Display selectedSize need to use the rawValue
              Text("\(selectedSize.rawValue) inch pizza")
              // Display isVegetarian, use a ternary
              Text("is vegetarian \(isVegetarian ? "Yes" : "No")")
              //
          }
          Section { /* place order button */
              Button("Place order", action: placeOrder)
          }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
