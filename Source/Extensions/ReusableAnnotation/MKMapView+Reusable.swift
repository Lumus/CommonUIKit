//
//  MKMapView+Reusable.swift
//  CommonUIKit
//
//  Created by Matt Croxson on 6/9/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import MapKit.MKMapView

public extension MKMapView {

    /// Registers a `ReusableAnnotation` object with the map view.
    /// - Parameter reusableAnnotation: Object to be registered.
    func register(_ reusableAnnotation: ReusableAnnotation.Type?) {
        guard let reusableAnnotation = reusableAnnotation else { return }
        self.register(reusableAnnotation.self,
                      forAnnotationViewWithReuseIdentifier: reusableAnnotation.reuseIdentifier)
    }
}
