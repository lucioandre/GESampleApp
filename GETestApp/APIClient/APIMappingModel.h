//
//  APIMappingModel.h
//  GETestApp
//
//  Created by Avenue Brazil on 05/05/17.
//  Copyright © 2017 Lucio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mantle.h"

@interface TransportationOption : MTLModel <MTLJSONSerializing>
@property (nonatomic, copy, readonly) NSNumber *identifier;
@property (nonatomic, copy, readonly) NSString *providerLogo;
@property (nonatomic, copy, readonly) NSNumber *priceInEuros;
@property (nonatomic, copy, readonly) NSString *departureTime;
@property (nonatomic, copy, readonly) NSString *arrivalTime;
@property (nonatomic, copy, readonly) NSNumber *numberOfStops;
@end
