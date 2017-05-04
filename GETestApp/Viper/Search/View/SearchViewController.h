//
//  SearchViewController.h
//  GETestApp
//
//  Created by Avenue Brazil on 02/05/17.
//  Copyright © 2017 Lucio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchProtocols.h"

@interface SearchViewController : UIViewController<SearchViewProtocol>

@property(nonatomic) id<SearchPresenterProtocol> presenter;

@end
