//
//  SearchInteractor.m
//  GETestApp
//
//  Created by Avenue Brazil on 02/05/17.
//  Copyright © 2017 Lucio. All rights reserved.
//

#import "SearchInteractor.h"
#import "SearchResultExtractor.h"

@interface SearchInteractor ()
@property (nonatomic) id<SearchResultsProviderProtocol> searchResultsProvider;
@end

@implementation SearchInteractor

#pragma mark - Initialization

- (instancetype)initWithSearchResultsProvider:(id<SearchResultsProviderProtocol>)searchResultsProvider {
    if (self = [super init]) {
        self.searchResultsProvider = searchResultsProvider;
    }
    return self;
}

#pragma mark - Protocol

- (void)searchTrainResultsOnCompletion:(void(^)(NSArray <SearchResult*> *results, NSError *error))completion {
    [self.searchResultsProvider fetchTrainsWithCompletion:^(NSArray <TransportationOption *> *response, NSError *error) {
        if (error) {
            completion(nil, error);
        }
        else {
            SearchResultExtractor *extrator = [[SearchResultExtractor alloc] initWithResponse:response];
            completion([extrator searchResults], nil);
        }
    }];
}

- (void)searchBusesResultsOnCompletion:(void(^)(NSArray <SearchResult*> *results, NSError *error))completion {
    [self.searchResultsProvider fetchBusesWithCompletion:^(NSArray <TransportationOption *> *response, NSError *error) {
        if (error) {
            completion(nil, error);
        }
        else {
            SearchResultExtractor *extrator = [[SearchResultExtractor alloc] initWithResponse:response];
            completion([extrator searchResults], nil);
        }
    }];
}

- (void)searchFlightsResultsOnCompletion:(void(^)(NSArray <SearchResult*> *, NSError *error))completion {
    [self.searchResultsProvider fetchFlightsWithCompletion:^(NSArray <TransportationOption *> *response, NSError *error) {
        if (error) {
            completion(nil, error);
        }
        else {
            SearchResultExtractor *extrator = [[SearchResultExtractor alloc] initWithResponse:response];
            completion([extrator searchResults], nil);
        }
    }];
}
    
@end
