//
//  SearchResult.m
//  GETestApp
//
//  Created by Avenue Brazil on 03/05/17.
//  Copyright © 2017 Lucio. All rights reserved.
//

#import "SearchResult.h"

@interface SearchResult ()
@property (nonatomic) NSString *duration;
@end

@implementation SearchResult

- (instancetype)initWithIdentifier:(NSString *)identifier
               vendorIconUrlString:(NSString *)vendorIconUrlString
                      priceInEuros:(NSString *)priceInEuros
                     departureTime:(NSString *)departureTime
                       arrivalTime:(NSString *)arrivalTime
                     numberOfStops:(NSInteger)numberOfStops {
    self = [super init];
    if (self) {
        _identifier = identifier;
        _vendorIconUrlString = vendorIconUrlString;
        _priceInEuros = priceInEuros;
        _departureTime = departureTime;
        _arrivalTime = arrivalTime;
        _numberOfStops = numberOfStops;
        _departureDate = [[self dateFormatter] dateFromString:departureTime];
    }
    return self;
}

- (NSString *)formattedPrice {
    return [NSString stringWithFormat:@"€%@", self.priceInEuros];
}

- (NSString *)formattedTimeInterval {
    return [NSString stringWithFormat:@"%@ - %@", self.departureTime, self.arrivalTime];
}

- (NSString *)formattedRouteInformation {
    NSString *stopInformation = (self.numberOfStops ? [NSString stringWithFormat:@"%ld Stops", (long)self.numberOfStops] : @"Directly");
    return [NSString stringWithFormat:@"%@    %@", stopInformation, self.duration];
}

#pragma mark - private

- (NSString *)duration {
    NSDate *departureDate = [[self dateFormatter] dateFromString:self.departureTime];
    NSDate *arrivalDate = [[self dateFormatter] dateFromString:self.arrivalTime];
    NSTimeInterval interval = [arrivalDate timeIntervalSinceDate:departureDate];
    NSInteger minutes = ((int)interval / 60) % 60;
    NSInteger hours = (interval / 3600);
    return [NSString stringWithFormat:@"%ld:%ldh", (long)hours, (long)minutes];
}

- (NSDateFormatter *)dateFormatter {
    static NSDateFormatter *formatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"HH.mm"; // twitter date format
    });
    return formatter;
}

@end
