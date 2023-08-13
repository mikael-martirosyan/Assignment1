//
//  ProfileView.swift
//  Assignment1
//
//  Created by Микаэл Мартиросян on 04.08.2023.
//

import CoreLocation
import SwiftUI

struct ProfileView: View {
    // MARK: - Properties
    @State private var annotationTitle: String?
    @State private var coordinate: CLLocationCoordinate2D?
    
    let user: User
    
    private var url: URL? {
        URL(string: user.picture.large)
    }
    
    // MARK: Body
    var body: some View {
        ScrollView {
            VStack() {
                // MARK: Map
                MapView(annotationTitle: $annotationTitle,
                        coordinate: $coordinate,
                        address: user.address.fullAddress)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 250)
                
                HStack {
                    // MARK: Avatar image
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 100, height: 100)
                    } placeholder: {}
                    
                    // MARK: Name
                    Text(user.fullName)
                        .foregroundColor(Color.black)
                        .font(Font.robotoMonoFont(.bold, size: 29.0))
                        .multilineTextAlignment(.center)
                }
                .padding()
                
                VStack(alignment: .center) {
                    // MARK: Email
                    Text(user.email)
                        .foregroundColor(Color.black)
                        .font(Font.robotoMonoFont(.regular, size: 18.0))
                    
                    // MARK: Address
                    Text(user.address.fullAddress)
                        .foregroundColor(Color.black)
                        .font(Font.latoFont(.regular, size: 18.0))
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                    
                    // MARK: Links
                    HStack {
                        ForEach(LinkLogos.allCases) { Image($0.description) }
                    }
                }
            }
            .navigationTitle(user.fullName)
            .navigationBarTitleDisplayMode(.inline)
            
            Spacer()
        }
        .onAppear {
            geocodeAddress()
        }
    }

    private func geocodeAddress() {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(user.address.shortAddress) { placemarks, error in
            if let error = error {
                print("Geocoding error: \(error)")
            }
            
            if let placemark = placemarks?.first {
                self.coordinate = placemark.location?.coordinate
                self.annotationTitle = placemark.locality // City name
            }
        }
    }
}
