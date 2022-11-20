//
//  LocationSearchView.swift
//  UberSwift
//
//  Created by BekRoz on 20/11/22.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var startlocationText = ""
    @Binding var showLocationSearchView: Bool
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        VStack {
            // MARK: Header
            HStack {
                VStack {
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6, height: 6)
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 24)
                    Rectangle()
                        .fill(.black)
                        .frame(width: 6, height: 6)
                }
                
                VStack {
                    TextField("Current location", text: $startlocationText)
                        .frame(height: 32)
                        .padding(.leading, 10)
                        .background(Color(.systemGroupedBackground))
                        .padding(.trailing)
                    
                    TextField("Where to?", text: $viewModel.queryFragment)
                        .frame(height: 32)
                        .padding(.leading, 10)
                        .background(Color(.systemGray4))
                        .padding(.trailing)
                        
                }
            }
            .padding(.horizontal)
            .padding(.top, 64)
            
            Divider()
                .padding(.vertical)
            
            // MARK: List
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.results, id: \.self) {
                        result in LocationSearchResultCell(title: result.title, subtitle: result.subtitle) .onTapGesture {
                            withAnimation(.spring()) {
                                viewModel.selectLocation(result)
                                showLocationSearchView.toggle()
                            }
                        }
                    }
                }
            }
        }
        .background(.white)
    }
}


struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView(showLocationSearchView: .constant(true))
    }
}
