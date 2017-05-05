//
//  APIClientProtocol.h
//  GETestApp
//
//  Created by Avenue Brazil on 05/05/17.
//  Copyright © 2017 Lucio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIMappingModel.h"

@protocol SearchResultsProviderProtocol <NSObject>
- (void)fetchBusesWithCompletion:(void(^)(NSArray <TransportationOption *>* response, NSError *error))completion;
- (void)fetchTrainsWithCompletion:(void(^)(NSArray <TransportationOption *>* response, NSError *error))completion;
- (void)fetchFlightsWithCompletion:(void(^)(NSArray <TransportationOption *>* response, NSError *error))completion;
@end
