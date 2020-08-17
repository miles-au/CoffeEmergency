//
//  MapViewController.swift
//  CoffeEmergency
//
//  Created by Miles Au on 2020-08-13.
//  Copyright © 2020 Miles Au. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    // CafeInfo
    @IBOutlet weak var cafeInfoView: UIView!
    @IBOutlet weak var cafeInfoViewVerticalConstraint: NSLayoutConstraint! // anchors cafe info view to bottom of the screen, we need it to animate the slide in effect
    @IBOutlet weak var cafeInfoViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var cafeInfoLabel: UILabel!
    @IBOutlet weak var cafeInfoImageView: UIImageView!
    @IBOutlet weak var toRouteButton: UIButton!
    let cafeInfoViewHeight = CGFloat(250)
    var cafeInfoViewIsActive = false
    
    var viewModel: MapViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup map view - on map view loaded is in the delegate
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.mapType = .mutedStandard
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // set region to selected cafe location if exists
        if let latitude = viewModel?.selectedCafe?.latitude, let longitude = viewModel?.selectedCafe?.longitude{
            zoomMap(to: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), animated: false)
        }else{
            zoomMap(to: mapView.userLocation.coordinate, animated: false, distance: 1000)
        }
        
        setUpCafeInfoView()
        loadCafes()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        viewModel?.viewDidFinish()
    }
    
    func zoomMap(to coordinates: CLLocationCoordinate2D, animated: Bool = true, distance: Double = 200){
        let viewRegion = MKCoordinateRegion(center: coordinates, latitudinalMeters: distance, longitudinalMeters: distance)
        mapView.setRegion(viewRegion, animated: animated)
    }
    
    func loadCafes(){
        guard let cafes = viewModel?.cafes else { return }
        
        // setup annotations
        var selectedAnnotation: CafeAnnotation?
        var annotations = [CafeAnnotation]()
        
        // loop through cafes
        for cafe in cafes{
            let annotation = CafeAnnotation(cafe: cafe)
            if cafe == viewModel?.selectedCafe{
                selectedAnnotation = annotation
            }
            annotations.append(annotation)
        }
        
        // add annotations to map view
        mapView.addAnnotations(annotations)
        
        // if a cafe has been selected, select it's annotation and zoom to it
        if selectedAnnotation != nil{
            mapView.selectAnnotation(selectedAnnotation!, animated: true)
            showCafeInfoView()
        }
    }
    
    func setUpCafeInfoView(){
        cafeInfoView.layer.cornerRadius = 10
        cafeInfoView.layer.borderWidth = 2.5
        cafeInfoView.layer.borderColor = UIColor(named: "BrandLightBrown")?.cgColor
        toRouteButton.layer.cornerRadius = 10
        cafeInfoView.translatesAutoresizingMaskIntoConstraints = false
        
        // top constraint
        cafeInfoViewVerticalConstraint.constant = -cafeInfoViewHeight + additionalSafeAreaInsets.bottom - 20
        
        // width constraints
        let cafeInfoViewWidth = UIScreen.main.bounds.width > 420 ? 400 : UIScreen.main.bounds.width - 20
        cafeInfoViewWidthConstraint.constant = cafeInfoViewWidth
    }
    
    func showCafeInfoView(){
        // check to make sure a cafe has been selected
        guard let cafe = viewModel?.selectedCafe else { return }
        
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
    
    @IBAction func toRouteButtonPressed(_ sender: UIButton) {
        viewModel?.openLocationInMap()
    }
}
