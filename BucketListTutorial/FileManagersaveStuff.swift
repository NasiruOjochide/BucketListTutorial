//
//  FileManagersaveStuff.swift
//  BucketListTutorial
//
//  Created by Danjuma Nasiru on 16/02/2023.
//

import SwiftUI

struct FileManagersaveStuff: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                let str = "Test Message"
                let url = getDocumentsDirectory().appendingPathComponent("message.txt")
                
                do{
                    try str.write(to: url, atomically: true, encoding: .utf8)
                    let input = try String(contentsOf: url)
                    print(input)
                }
                catch{
                    print(error.localizedDescription)
                }
            }
    }
    
    func getDocumentsDirectory() -> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

struct FileManagersaveStuff_Previews: PreviewProvider {
    static var previews: some View {
        FileManagersaveStuff()
    }
}
