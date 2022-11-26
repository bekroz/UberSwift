//
//  LocationSearchViewModel.swift
//  UberSwift
//
//  Created by BekRoz on 20/11/22.
//

import Foundation
import MapKit

class LocationSearchViewModel: NSObject, ObservableObject {
    
    // MARK: - Properties
    @Published var results = [MKLocalSearchCompletion]()
    @Published var selectedLocationCoordinate: CLLocationCoordinate2D?
    
    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment: String = "" {
        didSet {
            print("DEBUG: Query fragment is \(queryFragment)")
            searchCompleter.queryFragment = queryFragment
        }
    }
    
    var userlocation: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
        
    }
    
    // MARK: - Helpers
    
    func selectLocation(_ localSearch: MKLocalSearchCompletion) {
        searchLocation(forLocalSearchCompletion: localSearch) {
            response, error in
            if let error = error {
                print("DEBUG: Location search failed with error \(error.localizedDescription)")
                return
            }
            
            guard let item = response?.mapItems.first else { return  }
            let coordinate = item.placemark.coordinate
            self.selectedLocationCoordinate = coordinate
            print("DEBUG: Location coordinates \(coordinate)")
        }
    }
    
    func searchLocation(forLocalSearchCompletion localSearch: MKLocalSearchCompletion, completion: @escaping MKLocalSearch.CompletionHandler ) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = localSearch.title.appending(localSearch.subtitle)
        
        let search = MKLocalSearch(request: searchRequest)
        search.start(completionHandler: completion)
    }
    
    func computeRidePrice(forType type: RideType) -> Double {
        guard let destCoordinate = selectedLocationCoordinate else { return 0.0 }
        guard let userCoordinate = self.userlocation else { return 0.0 }
        let userLocation = CLLocation(latitude: userCoordinate.latitude, longitude: userCoordinate.longitude)
        
        let destination = CLLocation(latitude: destCoordinate.latitude, longitude: destCoordinate.longitude)
        
        let tripDistanceInMeters = userLocation.distance(from: destination)
        return type.computeRidePrice(for: tripDistanceInMeters)
    }
}

// MARK: MKLocalSearchCompleterDelegate

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
         
    }
}
