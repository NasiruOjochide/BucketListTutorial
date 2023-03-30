//
//  FileManagerExtension.swift
//  BucketListTutorial
//
//  Created by Danjuma Nasiru on 16/02/2023.
//

import Foundation

extension FileManager{
    func writeData(_ str: String){
        guard let bundleURL = Bundle.main.url(forResource: str, withExtension: nil) else{
            fatalError("failed to locate \(str) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: bundleURL) else{
            fatalError("failed to locate \(str) in bundle.")
        }
        
        
        do {
            let appDirectory = try self.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent(str)
            
            try data.write(to: appDirectory)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func readData<T : Codable>(_ str : String) -> T{
        guard let appDirectory = try? self.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent(str) else {
            fatalError("couldn't locate \(str) directory")
        }
        
        
        guard let data = try? Data(contentsOf: appDirectory) else{
            fatalError("could not read data")
        }
            
            let formatter = DateFormatter()
            formatter.dateFormat = "y-MM-dd"
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(formatter)
            
        guard let decodedData = try? decoder.decode(T.self, from: data) else{
            fatalError("decoding failed")
        }
        
        
        return decodedData
    }
}
