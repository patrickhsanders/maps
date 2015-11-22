//
//  SecondViewController.m
//  Maps
//
//  Created by Aditya Narayan on 11/20/15.
//  Copyright © 2015 turntotech.io. All rights reserved.
//

#import "SecondViewController.h"
@import GoogleMaps;

@interface SecondViewController ()

@end

@implementation SecondViewController
{
    GMSMapView *mapView_;
    UISegmentedControl *mapType;
}
- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
    
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:40.741448
                                                            longitude:-73.989969
                                                                 zoom:17];
    mapView_ = [GMSMapView mapWithFrame:self.view.bounds camera:camera];
    mapView_.myLocationEnabled = YES;
    [self.view addSubview:mapView_];
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(40.741448, -73.989969);
    marker.title = @"TurnToTech";
    marker.snippet = @"is awesome!";
    marker.map = mapView_;
    
    mapType = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Map",@"Hybrid",@"Sat",@"Terrain",nil]];
    mapType.frame = CGRectMake(6, self.view.bounds.size.height-85, 225, 29);
    [mapType addTarget:self action:@selector(changeMapType:) forControlEvents:UIControlEventValueChanged];
    mapType.selectedSegmentIndex = 0;
    [self.view addSubview:mapType];
    
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)changeMapType:(UISegmentedControl *)sender {
    switch (((UISegmentedControl *)sender).selectedSegmentIndex) {
        case 0:
            mapView_.mapType = kGMSTypeNormal;
            break;
            
        case 1:
            mapView_.mapType = kGMSTypeHybrid;
            break;
            
        case 2:
            mapView_.mapType = kGMSTypeSatellite;
            break;
            
        case 3:
            mapView_.mapType = kGMSTypeTerrain;
            break;
            
        default:
            break;
    }
}

@end
