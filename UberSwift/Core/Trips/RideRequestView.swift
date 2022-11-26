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

            TripInfoContainerView()
            
            RideSuggestionHeaderView()
            
            RideOptionView()
            
            Divider()
                .padding(.vertical, 8)
            
            PaymentOptionView()

            RequestRideBtnView()
        }
        .background(.white)
    }
}

struct TripInfoContainerView: View {
    var body: some View {
        HStack {
            IndicatorView()
            NavigationInfoView()
        }
        .padding()
        
        Divider()
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

struct RideSuggestionHeaderView: View {
    var body: some View {
        Text("Suggested Rides")
            .font(.subheadline)
            .fontWeight(.semibold)
            .padding()
            .foregroundColor(.gray)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct RideOptionView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 12) {
                ForEach(0 ..< 3, id: \.self) {
                    _ in VStack(alignment: .leading) {
                        Image(systemName: "uber-x")
                            .resizable()
                            .scaledToFit()
                        VStack {
                            Text("Uber X")
                                .font(.system(size: 14, weight: .semibold))
                            Text("$22.04")
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .padding(8)
                    }
                    .frame(width: 125, height: 140)
                    .background(Color(.systemGroupedBackground))
                    .cornerRadius(10)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct PaymentOptionView: View {
    var body: some View {
        HStack(spacing: 12) {
            Text("Visa")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(6)
                .background(.blue)
                .cornerRadius(4)
                .foregroundColor(.white)
                .padding(.leading)
            
            Text("**** 134")
                .fontWeight(.bold)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .imageScale(.medium)
                .padding()
        }
        .frame(height: 50)
        .background(Color(.systemGroupedBackground))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

struct RequestRideBtnView: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Confirm Ride")
                .fontWeight(.bold)
                .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                .background(.blue)
                .cornerRadius(10)
                .foregroundColor(.white)
        }
    }
}
struct RideRequestView_Previews: PreviewProvider {
    static var previews: some View {
        RideRequestView()
    }
}
