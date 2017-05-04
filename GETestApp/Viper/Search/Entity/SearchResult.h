//
//  SearchResult.h
//  GETestApp
//
//  Created by Avenue Brazil on 03/05/17.
//  Copyright © 2017 Lucio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchResult : NSObject

@property (nonatomic, copy, readonly) NSString *identifier;
@property (nonatomic, copy, readonly) NSString *vendorIconUrlString;
@property (nonatomic, copy, readonly) NSString *priceInEuros;
@property (nonatomic, copy, readonly) NSString *departureTime;
@property (nonatomic, copy, readonly) NSString *arrivalTime;
@property (nonatomic, assign, readonly) NSInteger numberOfStops;

- (instancetype)initWithIdentifier:(NSString *)identifier
               vendorIconUrlString:(NSString *)vendorIconUrlString
                      priceInEuros:(NSString *)priceInEuros
                     departureTime:(NSString *)departureTime
                       arrivalTime:(NSString *)arrivalTime
                     numberOfStops:(NSInteger)numberOfStops;

- (NSString *)formattedPrice;

- (NSString *)formattedTimeInterval;

- (NSString *)formattedRouteInformation;

@end
