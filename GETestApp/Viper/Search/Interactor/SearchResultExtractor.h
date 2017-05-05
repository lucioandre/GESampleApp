//
//  SearchResultExtractor.h
//  GETestApp
//
//  Created by Avenue Brazil on 05/05/17.
//  Copyright © 2017 Lucio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIMappingModel.h"
#import "SearchResult.h"

@interface SearchResultExtractor : NSObject

- (instancetype)initWithResponse:(NSArray <TransportationOption *> *)response;
- (NSArray<SearchResult *> *)searchResults;

@end
