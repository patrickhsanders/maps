//
//  MapViewDataAbstraction.h
//  
//
//  Created by Patrick Sanders on 22.11.15.
//
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapViewDataAbstraction : NSObject

@property (nonatomic) CLLocationCoordinate2D centerCoordinate;
@property (nonatomic) double xSpanDelta;
@property (nonatomic) double ySpanDelta;
@property (nonatomic) double cameraHeading;
@property (nonatomic) NSUInteger mapType;
//@property (nonatomic, strong) NSMutableArray *annotations;

+ (id)sharedManager;
- (NSString *)description;
//http://stackoverflow.com/questions/2081753/getting-the-bounds-of-an-mkmapview

@end
