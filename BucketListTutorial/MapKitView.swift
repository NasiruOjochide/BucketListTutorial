//
//  MapKitView.swift
//  BucketListTutorial
//
//  Created by Danjuma Nasiru on 18/02/2023.
//

import MapKit
import SwiftUI


struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}


struct MapKitView: View {
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    let locations = [
        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    
    var body: some View {
        NavigationView{
            Map(coordinateRegion: $mapRegion, annotationItems: locations, annotationContent: {location in
                //MapMarker(coordinate: location.coordinate)
                
                //                MapAnnotation(coordinate: location.coordinate, content: {
                //                    Circle()
                //                        .stroke(.red, lineWidth: 2)
                //                        .frame(width: 40, height: 40)
                //                        .onTapGesture {
                //                            print("\(location.name) tapped")
                //                        }
                //                })
                
                MapAnnotation(coordinate: location.coordinate, content: {
                    NavigationLink{
                        Text(location.name)
                    } label: {
                        Circle()
                            .stroke(.red, lineWidth: 3)
                            .frame(width: 44, height: 44)
                    }
                })
            })
            .navigationTitle("London Explorer")
        }
    }
}

struct MapKitView_Previews: PreviewProvider {
    static var previews: some View {
        MapKitView()
    }
}
