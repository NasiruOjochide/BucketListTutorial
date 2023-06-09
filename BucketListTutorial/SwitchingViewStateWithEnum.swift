//
//  SwitchingViewStateWithEnum.swift
//  BucketListTutorial
//
//  Created by Danjuma Nasiru on 16/02/2023.
//

import SwiftUI


enum LoadingState{
    case loading, success, failed
}

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}


struct SwitchingViewStateWithEnum: View {
    
    var loadingState = LoadingState.loading
    
    var body: some View {
        switch loadingState {
        case .loading:
            LoadingView()
        case .success:
            SuccessView()
        case .failed:
            FailedView()
        }
    }
}

struct SwitchingViewStateWithEnum_Previews: PreviewProvider {
    static var previews: some View {
        SwitchingViewStateWithEnum()
    }
}
