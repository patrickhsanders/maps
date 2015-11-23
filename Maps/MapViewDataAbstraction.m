//
//  MapViewDataAbstraction.m
//  
//
//  Created by Patrick Sanders on 22.11.15.
//
//
//
#import "MapViewDataAbstraction.h"

@implementation MapViewDataAbstraction

- (instancetype) init {
    self = [super init];
    
    self.centerCoordinate = CLLocationCoordinate2DMake(0, 0);
    self.xSpanDelta = 0;
    self.ySpanDelta = 0;
    self.cameraHeading = 0;
    self.mapType = 0;
    
    return self;
}


+ (id)sharedManager {
    static MapViewDataAbstraction *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

//- (id)init {
//    if (self = [super init]) {
//        someProperty = [[NSString alloc] initWithString:@"Default Property Value"];
//    }
//    return self;
//}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

- (NSString *)description {
    return [NSString stringWithFormat:@"center (%f,%f) span <%f,%f> heading %f type %lu",self.centerCoordinate.latitude,self.centerCoordinate.longitude,self.xSpanDelta,self.ySpanDelta,self.cameraHeading,self.mapType];
}

@end
