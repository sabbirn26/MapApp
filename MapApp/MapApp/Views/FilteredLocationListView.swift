//
//  FilteredLocationListView.swift
//  MapApp
//
//  Created by Sabbir Nasir on 8/11/23.
//

import SwiftUI

struct FilteredLocationListView: View {
    @EnvironmentObject private var vm: LocationViewModel
    var body: some View {
        List{
            ForEach(vm.searchResults ?? []){ location in
                Button{
                    vm.showNextLocation(location: location)
                    withAnimation(.easeInOut){
                        vm.showFilteredList = false
                        vm.showSearchField = false
                    }
                } label: {
                    listRowView(location: location)
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())
    }
}
extension FilteredLocationListView{
    //MARK: VIEW PARTS
    private func listRowView(location: Location) -> some View{
        HStack{
            if let imageName = location.imageNames.first{
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            VStack(alignment: .leading){
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
struct FilteredLocationListView_Previews: PreviewProvider {
    static var previews: some View {
        FilteredLocationListView()
            .environmentObject(LocationViewModel())
    }
}
