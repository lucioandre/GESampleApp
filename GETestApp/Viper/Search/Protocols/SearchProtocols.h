//
//  SearchProtocols.h
//  GETestApp
//
//  Created by Avenue Brazil on 02/05/17.
//  Copyright © 2017 Lucio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchResult.h"

typedef NS_ENUM(NSInteger, SelectedOption){
    SelectedOptionTrain,
    SelectedOptionBus,
    SelectedOptionFlight
};

@protocol SearchViewProtocol <NSObject>
- (void)showProgressIndicator;
- (void)hideProgressIndicator;
- (void)updateSearchResults:(NSArray<SearchResult *> *)results;
- (void)updateLayoutForSelectedOption:(SelectedOption)selectedOption animated:(BOOL)animated;
@end

@protocol SearchPresenterProtocol <NSObject>
- (void)viewDidLoadEvent;
- (void)viewDidAppearEvent;
- (void)orientationChangeEvent;
- (void)didSelectOption:(SelectedOption)option;
@end

@protocol SearchWireframeProtocol <NSObject>

@end

@protocol SearchInteractorProtocol <NSObject>

@end
