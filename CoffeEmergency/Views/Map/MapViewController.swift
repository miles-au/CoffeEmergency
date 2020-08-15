//
//  MapViewController.swift
//  CoffeEmergency
//
//  Created by Miles Au on 2020-08-13.
//  Copyright © 2020 Miles Au. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    // CafeInfo
    @IBOutlet weak var cafeInfoView: UIView!
    @IBOutlet weak var cafeInfoViewVerticalConstraint: NSLayoutConstraint! // anchors cafe info view to bottom of the screen, we need it to animate the slide in effect
    @IBOutlet weak var cafeInfoViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var cafeInfoLabel: UILabel!
    @IBOutlet weak var cafeInfoImageView: UIImageView!
    let cafeInfoViewHeight = CGFloat(250)
    var cafeInfoViewIsActive = false
    
    var viewModel: MapViewModel? {
        willSet {
            viewModel?.viewDelegate = nil
        }
        didSet {
            viewModel?.viewDelegate = self
        }
    }
    
    var selectedCafe: CafeModel?
    var cafes = [CafeModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.mapType = .mutedStandard
        
        // set region to selected cafe location if exists
        if let latitude = selectedCafe?.latitude, let longitude = selectedCafe?.longitude{
            zoomMap(to: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
        }else{
            zoomMap(to: CLLocationCoordinate2D())
        }
        
        setUpCafeInfoView()
        loadCafes()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        viewModel?.viewDidFinish()
    }
    
    func zoomMap(to coordinates: CLLocationCoordinate2D){
        let viewRegion = MKCoordinateRegion(center: coordinates, latitudinalMeters: 200, longitudinalMeters: 200)
        mapView.setRegion(viewRegion, animated: true)
    }
    
    func loadCafes(){
        var selectedAnnotation: CafeAnnotation?
        var annotations = [CafeAnnotation]()
        for cafe in cafes{
            let annotation = CafeAnnotation(cafe: cafe)
            if cafe == selectedCafe{
                selectedAnnotation = annotation
            }
            annotations.append(annotation)
        }
        mapView.addAnnotations(annotations)
        
        if selectedAnnotation != nil{
            mapView.selectAnnotation(selectedAnnotation!, animated: true)
            showCafeInfoView()
        }
    }
    
    func setUpCafeInfoView(){
        cafeInfoView.layer.cornerRadius = 10
        cafeInfoView.translatesAutoresizingMaskIntoConstraints = false
        
        // top constraint
        cafeInfoViewVerticalConstraint.constant = -cafeInfoViewHeight + additionalSafeAreaInsets.bottom - 20
        
        // width constraints
        let cafeInfoViewWidth = UIScreen.main.bounds.width > 420 ? 400 : UIScreen.main.bounds.width - 20
        cafeInfoViewWidthConstraint.constant = cafeInfoViewWidth
    }
    
    func showCafeInfoView(){
        // check to make sure a cafe has been selected
        guard let cafe = selectedCafe else { return }
        
        // update cafeInfoView information
        cafeInfoViewIsActive = true
        cafeInfoLabel.text = cafe.name
        cafeInfoImageView.downloaded(from: cafe.imageURL)
        
        // set position
        cafeInfoViewVerticalConstraint.constant = additionalSafeAreaInsets.bottom + 20
        updateCafeInfoView()
    }
    
    func hideCafeInfoView(){
        cafeInfoViewVerticalConstraint.constant = -cafeInfoViewHeight + additionalSafeAreaInsets.bottom - 20
        updateCafeInfoView()
        cafeInfoViewIsActive = false
    }
    
    func updateCafeInfoView(){
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
    }
}

// MARK: - Receive updates from Map View Model
extension MapViewController: MapViewModelViewDelegate{
    
}
