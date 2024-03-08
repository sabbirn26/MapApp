//
//  LocationView.swift
//  MapApp
//
//  Created by Sabbir Nasir on 5/11/23.
//

import SwiftUI
import MapKit

struct LocationView: View {
    //@StateObject private var vm = LocationViewModel()
    @EnvironmentObject private var vm: LocationViewModel
    //    @State private var mapRegion: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    var body: some View {
        ZStack(alignment: .top){
            //            Map(coordinateRegion: $vm.mapRegion)
            //                .ignoresSafeArea()
            mapSection
                .ignoresSafeArea()
            VStack(spacing: 0){
                HStack(alignment: .top, spacing: 0) {
                    if !vm.showSearchField {
                        header
                            .padding()
                    } else {
                        VStack(spacing: 0) {
                            searchField
                                .padding()
                        }
                    }
                    searchBtn
                        .padding(.top)
                        .padding(.trailing, 10)
                }
                Spacer()
                mapPreviewSection
            }
        }
        .sheet(item: $vm.showLocationDetails, onDismiss: nil) { location in
            LocationDetailsView(location: location)
        }
        .onChange(of: vm.searchQuery){ newValue in
            vm.searchResults = vm.searchLocations(byQuery: vm.searchQuery)
        }
    }
}
extension LocationView{
    //MARK: VIEW PARTS
    private var header: some View{
        VStack {
            Button(action: vm.toggleLocationList){
                HStack {
                    Image(systemName:"arrow.down")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding()
                        .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                    
                    Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(1)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .offset(x: -15)
                    .animation(.none, value: vm.mapLocation)
                    Spacer()
                }
            }
            .overlay(alignment: .leading){
                
                
            }
            if vm.showLocationsList {
                LocationListView()
            }
        }
        .background(.thinMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
    private var searchField : some View {
        VStack(spacing: 0){
            TextField("Search here...", text: $vm.searchQuery)
                .font(.headline)
                .frame(height: 55)
                .padding(.horizontal, 20)
                .background(.thinMaterial)
                .cornerRadius(10)
                //.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
                
                //.border(.pink)
            Divider()
            if vm.showFilteredList {
                if vm.searchQuery.isEmpty, vm.showFilteredList == true {
                    VStack {
                        LocationListView()
                            .cornerRadius(10)
                    }
                } else if !vm.searchQuery.isEmpty, vm.showFilteredList == true {
                    VStack {
                        FilteredLocationListView()
                            .background(.thinMaterial)
                    }
                }
            }
        }
        .background(.thinMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
    private var mapSection : some View {
        Map(coordinateRegion: $vm.mapRegion, annotationItems: vm.locations, annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates){
                LocationMapAnnotionView()
                    .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                    .shadow(radius: 10)
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                    }
            }
        })
    }
    
    private var mapPreviewSection : some View {
        ZStack{
            ForEach(vm.locations){ location in
                if vm.mapLocation == location{
                    LocationPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .padding()
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
            }
        }
    }
    
    private var searchBtn : some View {
        Button{
            vm.searchBtnPressed()
            vm.showFilteredListToggle()
            withAnimation(.easeInOut){
                vm.showLocationsList = false
            }
        }label: {
            Image(systemName: vm.showSearchField ? "xmark" : "magnifyingglass")
                .font(.headline)
                .fontWeight(.bold)
                .frame(width: 55, height: 55)
                .background(.thinMaterial)
                .foregroundColor(.primary)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
        }
    }
}
struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
            .environmentObject(LocationViewModel())
    }
}
