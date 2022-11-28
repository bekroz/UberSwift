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
        .padding(.bottom, 24)
        .background(Color.theme.backgroundColor)
        .cornerRadius(12)
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
    @EnvironmentObject var locationVM: LocationSearchViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            HStack {
                if let location = locationVM.selectedUberLocation {
                    Text(location.title)
                        .font(.system(size: 16, weight: .semibold))
                }
                
                Spacer()
                
                Text(locationVM.pickupTime ?? "")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.gray)
            }
            .padding(.bottom, 10)
            
            HStack {
                Text("Stacbucks Coffee")
                    .font(.system(size: 16, weight: .semibold))
                
                Spacer()
                
                Text(locationVM.dropOffTime ?? "")
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
            .padding(.top, 8)
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
    @State private var selectedOption: RideType = .uberX
    @EnvironmentObject var locationVM: LocationSearchViewModel
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 12) {
                ForEach(RideType.allCases) {
                    type in VStack(alignment: .leading) {
                        Image(type.imageName)
                            .resizable()
                            .scaledToFit()
                        VStack(alignment: .leading, spacing: 4) {
                            Text(type.description)
                                .font(.system(size: 14, weight: .semibold))
                            Text(locationVM.computeRidePrice(forType: type).toCurrency())
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .padding()
                    }
                    .frame(width: 125, height: 140)
                    .foregroundColor(type == selectedOption ? .white : Color.theme.primaryTextColor)
                    .background(type ==
                        selectedOption ?
                        .blue : Color.theme.secondaryBackgroundColor)
                    .scaleEffect(type == selectedOption ? 1.2 : 1.0)
                    .cornerRadius(10)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selectedOption = type
                        }
                    }
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
        .background(Color.theme.secondaryBackgroundColor)
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
