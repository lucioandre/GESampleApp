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
@end

@implementation SearchPresenter

#pragma mark - Public Protocol Methods

- (void)viewDidLoadEvent {
    
}

- (void)viewDidAppearEvent {
    [self.view updateLayoutForSelectedOption:SelectedOptionTrain animated:NO];
    //[self.view showProgressIndicator];
    
    SearchResult *search1 = [[SearchResult alloc] initWithIdentifier:@"id" vendorIconUrlString:@"http://cdn-goeuro.com/static_content/web/logos/63/megabus.png" priceInEuros:@"60.39" departureTime:@"9:58" arrivalTime:@"19:13" numberOfStops:3.0];
    SearchResult *search2 = [[SearchResult alloc] initWithIdentifier:@"id2" vendorIconUrlString:@"http://cdn-goeuro.com/static_content/web/logos/63/deutsche_bahn.png" priceInEuros:@"81.7" departureTime:@"1:23" arrivalTime:@"13:17" numberOfStops:0];
    SearchResult *search3 = [[SearchResult alloc] initWithIdentifier:@"id2" vendorIconUrlString:@"http://cdn-goeuro.com/static_content/web/logos/63/postbus.png" priceInEuros:@"81.7" departureTime:@"1:22" arrivalTime:@"13:17" numberOfStops:0];
    [self.view updateSearchResults:@[search1, search2, search3]];
    
}

- (void)orientationChangeEvent {
    [self.view updateLayoutForSelectedOption:self.selectedOption animated:NO];
}

- (void)didSelectOption:(SelectedOption)option {
    self.selectedOption = option;
    [self.view updateLayoutForSelectedOption:self.selectedOption animated:YES];
}

@end
