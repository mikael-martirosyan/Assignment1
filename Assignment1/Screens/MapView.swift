//
//  MapView.swift
//  Assignment1
//
//  Created by Микаэл Мартиросян on 11.08.2023.
//

import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    @Binding var annotationTitle: String?
    @Binding var coordinate: CLLocationCoordinate2D?

    var address: String

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        if let coordinate = coordinate {
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = annotationTitle
            
            uiView.removeAnnotations(uiView.annotations)
            uiView.addAnnotation(annotation)
            
            let region = MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
            uiView.setRegion(region, animated: true)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    final class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView

        init(_ parent: MapView) {
            self.parent = parent
        }

        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: nil)
            annotationView.canShowCallout = true
            return annotationView
        }
    }
}
