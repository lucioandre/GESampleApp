//
//  SearchPresenter.m
//  GETestApp
//
//  Created by Avenue Brazil on 02/05/17.
//  Copyright © 2017 Lucio. All rights reserved.
//

#import "SearchPresenter.h"

@interface SearchPresenter ()
@property (assign, nonatomic) SelectedOption selectedOption;
@property (nonatomic) NSArray<SearchResult *> *busResults;
@property (nonatomic) NSArray<SearchResult *> *trainResults;
@property (nonatomic) NSArray<SearchResult *> *flightsResults;
@end

@implementation SearchPresenter

#pragma mark - Public Protocol Methods

- (void)viewDidLoadEvent {
    
}

- (void)viewDidAppearEvent {
    [self.view updateLayoutForSelectedOption:SelectedOptionTrain animated:NO];
    //[self.view showProgressIndicator];

    [self.interactor searchBusesResultsOnCompletion:^(NSArray<SearchResult *> *results, NSError *error) {
        if (!error) {
            self.busResults = [NSArray arrayWithArray:results];
        }
        else {
            self.busResults = [NSArray new];
        }
        
        [self checkAllInformationLoaded];
    }];
    
    [self.interactor searchTrainResultsOnCompletion:^(NSArray<SearchResult *> *results, NSError *error) {
        if (!error) {
            self.trainResults = [NSArray arrayWithArray:results];
        }
        else {
            self.trainResults = [NSArray new];
        }
        
        [self checkAllInformationLoaded];
    }];
    
    [self.interactor searchFlightsResultsOnCompletion:^(NSArray<SearchResult *> *results, NSError *error) {
        if (!error) {
            self.flightsResults = [NSArray arrayWithArray:results];
        }
        else {
            self.flightsResults = [NSArray new];
        }
        
        [self checkAllInformationLoaded];
    }];
    
}

- (void)orientationChangeEvent {
    [self.view updateLayoutForSelectedOption:self.selectedOption animated:NO];
}

- (void)didSelectOption:(SelectedOption)option {
    self.selectedOption = option;
    [self.view updateLayoutForSelectedOption:self.selectedOption animated:YES];
    
    switch (option) {
        case SelectedOptionBus: {
            [self.view updateSearchResults:self.busResults];
            break;
        }
        case SelectedOptionTrain: {
            [self.view updateSearchResults:self.trainResults];
            break;
        }
        case SelectedOptionFlight: {
            [self.view updateSearchResults:self.flightsResults];
            break;
        }
    }
}

#pragma mark - private method

- (void)checkAllInformationLoaded {
    if (self.flightsResults && self.busResults && self.trainResults) {
        [self.view hideProgressIndicator];
        [self didSelectOption:self.selectedOption];
    }
}

@end
