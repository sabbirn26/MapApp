//
//  LocationPreviewView.swift
//  MapApp
//
//  Created by Sabbir Nasir on 5/11/23.
//

import SwiftUI

struct LocationPreviewView: View {
    @EnvironmentObject private var vm: LocationViewModel
    let location: Location
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16.0) {
                
                imageSection
                titleSection
            }
            //.background(Color.blue)
            VStack(spacing: 8){
                learnMoreBtn
                nextBtn
                
            }
        }
        .padding(20)
        //
        .background{
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        }
        .cornerRadius(10)
        //.clipped()
    }
}

extension LocationPreviewView {
    private var imageSection: some View {
        ZStack{
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    private var titleSection : some View {
        VStack(alignment: .leading) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        //.background(Color.blue)
    }
    
    private var learnMoreBtn : some View {
        Button{
            vm.showLocationDetails = location
        }label: {
            Text("Learn more")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.borderedProminent)
        //.background(Color.accentColor)
    }
    
    private var nextBtn : some View {
        Button{
            vm.nextButtonPressed()
        }label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.bordered)
    }
}
struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            LocationPreviewView(location: LocationsDataService.locations.first!)
                .padding()
            
        }
        .environmentObject(LocationViewModel())
    }
}
