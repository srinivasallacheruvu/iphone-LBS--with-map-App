//
//  HelloWorldViewController.h
//  LBS
//
//  Created by Karthik on 09/05/13.
//  Copyright (c) 2013 Karthik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface HelloWorldViewController: UIViewController<CLLocationManagerDelegate>
@property (strong, nonatomic) IBOutlet UITextField *accuracy;
@property (strong, nonatomic) IBOutlet UITextField *latitude;
@property (strong, nonatomic) IBOutlet UITextField *longitute;
@property (strong, nonatomic) IBOutlet MKMapView *mapview;
@property(strong,nonatomic) CLLocationManager *location;
@end
