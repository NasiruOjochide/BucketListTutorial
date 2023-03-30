//
//  ContentView.swift
//  BucketListTutorial
//
//  Created by Danjuma Nasiru on 16/02/2023.
//

import SwiftUI


struct User: Identifiable, Comparable {
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
    
    let id = UUID()
    let firstName: String
    let lastName: String
}


struct ContentView: View {
    
    let users = [
            User(firstName: "Arnold", lastName: "Rimmer"),
            User(firstName: "Kristine", lastName: "Kochanski"),
            User(firstName: "David", lastName: "Lister"),
    ].sorted()
    
    let values = [1, 5, 3, 6, 2, 9].sorted()
    
    var body: some View {
//        List(values, id: \.self) {
//                    Text(String($0))
//                }
        
        List(users) { user in
                    Text("\(user.lastName), \(user.firstName)")
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
