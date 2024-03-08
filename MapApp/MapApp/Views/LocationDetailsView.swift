//
//  LocationDetailsView.swift
//  MapApp
//
//  Created by Sabbir Nasir on 6/11/23.
//

import SwiftUI
import MapKit

struct LocationDetailsView: View {
    @EnvironmentObject private var vm: LocationViewModel
    let location: Location
    var body: some View {
        ScrollView {
            VStack{
                imageSection
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                VStack(alignment: .leading, spacing: 16.0){
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapSection
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                //.background(Color.red)
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(backBtn, alignment: .topLeading)
    }
}
extension LocationDetailsView{
    //MARK: VIEW PARTS
    
    private var imageSection: some View {
        TabView{
            ForEach(location.imageNames, id: \.self){ imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8.0){
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.title3)
                .foregroundColor(.secondary)
        }
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 16){
            Text(location.description)
                .font(.subheadline)
                .foregroundColor(Color.secondary)
            if let url = URL(string: location.link){
                Link("Read more on Wikipedia", destination: url)
                    .font(.headline)
                    .tint(Color.blue)
            }
        }
    }
    private var mapSection : some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: location.coordinates, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))), annotationItems: [location]){ location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotionView()
                    .shadow(radius: 10)
            }
            
        }
        .allowsHitTesting(false)
        .aspectRatio(1, contentMode: .fit)
        .cornerRadius(30)
    }
    
    private var backBtn: some View {
        Button{
            vm.showLocationDetails = nil
        }label: {
            Image(systemName: "arrow.left")
                .font(.headline)
                .padding(16)
                .foregroundColor(Color.primary)
                .background(.thickMaterial).opacity(0.8)
                .cornerRadius(10)
                .shadow(radius: 10)
                .padding()
        }
    }
}
struct LocationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailsView(location: LocationsDataService.locations.first!)
            .environmentObject(LocationViewModel())
    }
}
