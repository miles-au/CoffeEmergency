//
//  MapViewController+MapViewDelegate.swift
//  CoffeEmergency
//
//  Created by Miles Au on 2020-08-14.
//  Copyright © 2020 Miles Au. All rights reserved.
//

import Foundation
import MapKit

extension MapViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // MARK: Handle the annotation that shows user's location
        if annotation.isKind(of: MKUserLocation.self) {
            return nil // use default annotation for user location
        }

        // MARK: Handle if NOT CafeAnnotation, use default pin
        if !annotation.isKind(of: CafeAnnotation.self) {
            // dequeue a default pin
            var pinAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "DefaultPinView")
            if pinAnnotationView == nil {
                // if we don't have a default pin, create a new one
                pinAnnotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "DefaultPinView")
            }
            return pinAnnotationView
        }

        // MARK: Handle Custom CafeAnnotation
        // dequeue a custom CafeAnnotation
        var view: CafeAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: "CafeAnnotationView") as? CafeAnnotationView
        if view == nil {
            // if we don't have a custom annotation, create a new one
            view = CafeAnnotationView(annotation: annotation, reuseIdentifier: "CafeAnnotationView")
        }

        // setup CafeAnnotation
        if let annotation = annotation as? CafeAnnotation, let imageUrl = URL(string: annotation.cafe.imageURL){
            UIImage.downloaded(from: imageUrl) { image in
                DispatchQueue.main.async {
                    view?.image = image
                }
            }
        }
        view?.annotation = annotation

        return view
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let cafeAnnotation = view.annotation as? CafeAnnotation{
            selectedCafe = cafeAnnotation.cafe
            zoomMap(to: cafeAnnotation.coordinate)
        }
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        selectedCafe = nil
    }
}

