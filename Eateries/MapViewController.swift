//
//  MapViewController.swift
//  Eateries
//
//  Created by Arthur on 07.02.2019.
//  Copyright © 2019 Arthur. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    var restraunt: Restaurant!
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(restraunt.location!) { (placemarks, error) in
            guard  error == nil else { return }
            guard let placemarks  = placemarks  else { return }
            
            let placemark = placemarks.first!
            
            let annotation = MKPointAnnotation()
            annotation.title = self.restraunt.name
            annotation.subtitle = self.restraunt.type
            
            guard let location = placemark.location else { return }
            annotation.coordinate = location.coordinate
            self.mapView.showAnnotations([annotation], animated: true)
            self.mapView.selectAnnotation(annotation, animated: true)
        }
        // Do any additional setup after loading the view.
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else { return nil }
        
        let annotationIdentifier = "restAnnotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) as? MKPinAnnotationView
        if annotationView == nil {
           annotationView = MKPinAnnotationView (annotation:  annotation, reuseIdentifier: annotationIdentifier)
            annotationView?.canShowCallout = true
        }
        let rightImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        rightImage.image = UIImage(data: restraunt.image! as Data)
        annotationView?.rightCalloutAccessoryView = rightImage
        
        annotationView?.pinTintColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        return annotationView
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
