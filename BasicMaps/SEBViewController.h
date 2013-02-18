//
//  SEBViewController.h
//  BasicMaps
//
//  Created by Sebs on 2/12/13.
//  Copyright (c) 2013 Sebs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface SEBViewController : UIViewController <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@end
