//
//  Order.swift
//  CupcakeCorner
//
//  Created by slava bily on 6/4/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import SwiftUI

class Order: ObservableObject {
    
    struct Details: Codable {
        var type: Int = 0
        var quantity: Int = 3
        
        var extraFrosting: Bool = false
        var addSprinkles: Bool = false
        
        var name: String = ""
        var streetAddress: String = ""
        var city: String = ""
        var zip: String = ""
        
        var specialRequestEnabled = false {
            didSet {
                if specialRequestEnabled == false {
                    extraFrosting = false
                    addSprinkles = false
                }
            }
        }
        
        var hasValidAddress: Bool {
            if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
                return false
            }
            
            // validation of white spaces absense
            if (" "..."                                           ").contains(name) ||
                (" "..."                                          ").contains(streetAddress) ||
                (" "..."                                          ").contains(city) ||
                (" "..."                                          ").contains(zip) {
                return false
            }
            return true
        }
        
        var cost: Double {
               // $2 per cake
               var cost = Double(quantity) * 2
               // complicated cakes cost more
               cost += Double(type) / 2
               // $1/cake for extra frosting
               if extraFrosting {
                   cost += Double(quantity)
               }
               // $0.50/cake for sprinkles
               if addSprinkles {
                   cost += Double(quantity) / 2
               }
               return cost
           }
    }
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var item = Details()
    
}

    
 
