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

- (void)viewDidLoadEvent {
    
}

- (void)viewDidAppearEvent {
    [self.view updateLayoutForSelectedOption:SelectedOptionTrain animated:NO];
}


- (void)didSelectOption:(SelectedOption)option {
    [self.view updateLayoutForSelectedOption:option animated:YES];
}

@end
