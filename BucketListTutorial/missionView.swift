//
//  missionView.swift
//  BucketListTutorial
//
//  Created by Danjuma Nasiru on 16/02/2023.
//

import SwiftUI

struct missionView: View {
    
    let savedMissions = FileManager.default.writeData("missions.json")
    
    let missions : [Mission] = FileManager.default.readData("missions.json")
    
    var body: some View {
        List{
            ForEach(missions){mission in
                Text(mission.displayName)
            }
        }
    }
}

struct missionView_Previews: PreviewProvider {
    static var previews: some View {
        missionView()
    }
}
