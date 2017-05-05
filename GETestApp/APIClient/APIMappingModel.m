//
//  APIMappingModel.m
//  GETestApp
//
//  Created by Avenue Brazil on 05/05/17.
//  Copyright © 2017 Lucio. All rights reserved.
//

#import "APIMappingModel.h"

@implementation TransportationOption
+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    NSMutableDictionary *mapping = [[NSDictionary mtl_identityPropertyMapWithModel:self] mutableCopy];
    mapping[@"identifier"] = @"id";
    mapping[@"providerLogo"] = @"provider_logo";
    mapping[@"priceInEuros"] = @"price_in_euros";
    mapping[@"departureTime"] = @"departure_time";
    mapping[@"arrivalTime"] = @"arrival_time";
    mapping[@"numberOfStops"] = @"number_of_stops";
    return mapping;
}

+ (NSValueTransformer *)priceInEurosJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        if ([value isKindOfClass:[NSNumber class]]) {
            return value;
        }
        else {
            NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
            numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
            return [numberFormatter numberFromString:value];
        }
    }];
}

@end

