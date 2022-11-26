//
//  RideRequestView.swift
//  UberSwift
//
//  Created by BekRoz on 26/11/22.
//

import SwiftUI

struct RideRequestView: View {
    var body: some View {
        VStack {
            ModalTopCapsuleView()
            // MARK: Trip info view
            HStack {
                IndicatorView()
                NavigationInfoView()
            }
            .padding()
            
            Divider()
            
            // MARK: ride type selection view
        }
            // MARK: payment option view
            
            // MARK: request ride button
    }
}

struct IndicatorView: View {
    var body: some View {
        VStack {
            Circle()
                .fill(Color(.systemGray3))
                .frame(width: 8, height: 8)
            Rectangle()
                .fill(Color(.systemGray3))
                .frame(width: 1, height: 32)
            Rectangle()
                .fill(.black)
                .frame(width: 8, height: 8)
        }
    }
}

struct NavigationInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            HStack {
                Text("Current location")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.gray)
                
                Spacer()
                
                Text("1:30 PM")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.gray)
            }
            .padding(.bottom, 10)
            
            HStack {
                Text("Stacbucks Coffee")
                    .font(.system(size: 16, weight: .semibold))
                
                Spacer()
                
                Text("1:30 PM")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.gray)
            }
        }
        .padding(.leading, 8)
    }
}


struct ModalTopCapsuleView: View {
    var body: some View {
        Capsule()
            .foregroundColor(Color(.systemGray5))
            .frame(width: 48, height: 6)
    }
}

struct RideRequestView_Previews: PreviewProvider {
    static var previews: some View {
        RideRequestView()
    }
}
