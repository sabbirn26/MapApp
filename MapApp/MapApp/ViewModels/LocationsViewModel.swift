//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by Sabbir Nasir on 5/11/23.
//

import Foundation
import MapKit
import SwiftUI
class LocationViewModel: ObservableObject {
    @Published var locations : [Location]
    @Published var mapLocation: Location {
        didSet{
            updateMapRegion(location: mapLocation)
        }
    }
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    //show list of locations
    @Published var showLocationsList : Bool = false
    
    @Published var showLocationDetails : Location? = nil
    
    //Search Button
    @Published var showSearchField : Bool = false
    @Published var searchQuery: String = ""
    @Published var searchResults: [Location]?
    @Published var showFilteredList: Bool = false
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location){
        withAnimation(.easeInOut){
            mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)
        }
    }
    
    func toggleLocationList(){
        withAnimation(.easeInOut){
            showLocationsList = !showLocationsList
        }
    }
    
    func showNextLocation(location: Location){
        withAnimation(.easeInOut){
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed(){
        //current index
        
//        let currentIndex = locations.firstIndex { location in
//            return location == mapLocation
//        }
        
        guard let currentIndex = locations.firstIndex(where: {
            $0 == mapLocation
        }) else {
            print("Can't find current location index!")
            return
        }
        
        //check current index valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            //next index is not valid so
            //start from the 0
            let firstLocation = locations.first!
            showNextLocation(location: firstLocation)
            return
        }
        
        //next index is valid
        let nextlocation = locations[nextIndex]
        showNextLocation(location: nextlocation)
    }
    func searchBtnPressed(){
        withAnimation(.easeInOut){
            showSearchField = !showSearchField
        }
    }
    //Searchbar
    func searchLocations(byQuery query: String) -> [Location] {
        let lowercaseQuery = query.lowercased()
        let filteredLocations = locations.filter { location in
            let lowercaseName = location.name.lowercased()
            let lowercaseCityName = location.cityName.lowercased()
            
            return lowercaseName.contains(lowercaseQuery) || lowercaseCityName.contains(lowercaseQuery)
        }
        
        return filteredLocations
    }
    
    func showFilteredListToggle(){
        withAnimation(.easeInOut){
            showFilteredList = !showFilteredList
        }
    }
}
