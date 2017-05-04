//
//  SearchProtocols.h
//  GETestApp
//
//  Created by Avenue Brazil on 02/05/17.
//  Copyright © 2017 Lucio. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SelectedOption){
    SelectedOptionBus,
    SelectedOptionTrain,
    SelectedOptionFlight
};

@protocol SearchViewProtocol <NSObject>
- (void)updateLayoutForSelectedOption:(SelectedOption)selectedOption animated:(BOOL)animated;
@end

@protocol SearchPresenterProtocol <NSObject>
- (void)viewDidLoadEvent;
- (void)viewDidAppearEvent;
- (void)didSelectOption:(SelectedOption)option;
@end

@protocol SearchWireframeProtocol <NSObject>

@end

@protocol SearchInteractorProtocol <NSObject>

@end
