//
//  SearchInteractor.h
//  GETestApp
//
//  Created by Avenue Brazil on 02/05/17.
//  Copyright © 2017 Lucio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchProtocols.h"
#import "APIClientProtocol.h"

@interface SearchInteractor : NSObject<SearchInteractorProtocol>

- (instancetype)initWithSearchResultsProvider:(id<SearchResultsProviderProtocol>)searchResultsProvider;

@end
