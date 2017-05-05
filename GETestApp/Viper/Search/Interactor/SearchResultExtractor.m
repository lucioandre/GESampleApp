//
//  SearchResultExtractor.m
//  GETestApp
//
//  Created by Avenue Brazil on 05/05/17.
//  Copyright © 2017 Lucio. All rights reserved.
//

#import "SearchResultExtractor.h"

@interface SearchResultExtractor ()
@property (nonatomic) NSArray <TransportationOption *> *response;
@end

@implementation SearchResultExtractor

- (instancetype)initWithResponse:(NSArray <TransportationOption *> *)response {
    if (self = [super init]) {
        _response = response;
    }
    return self;
}

- (NSArray<SearchResult *> *)searchResults {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setMaximumFractionDigits:2];
    [formatter setMinimumFractionDigits:2];
    [formatter setRoundingMode: NSNumberFormatterRoundCeiling];
    
    NSMutableArray *results = [NSMutableArray new];
    for (TransportationOption *option in self.response) {
        NSString *logo = [option.providerLogo stringByReplacingOccurrencesOfString:@"{size}" withString:@"63"];
        SearchResult *result = [[SearchResult alloc] initWithIdentifier:[option.identifier stringValue]
                                                    vendorIconUrlString:logo
                                                           priceInEuros:[formatter stringFromNumber:option.priceInEuros]
                                                          departureTime:option.departureTime
                                                            arrivalTime:option.arrivalTime
                                                          numberOfStops:[option.numberOfStops floatValue]];
        [results addObject:result];
    }
    
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"departureDate"
                                                 ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedArray = [results sortedArrayUsingDescriptors:sortDescriptors];
    
    return sortedArray;
}

@end
