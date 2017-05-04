//
//  SearchWireframe.h
//  GETestApp
//
//  Created by Avenue Brazil on 02/05/17.
//  Copyright © 2017 Lucio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "SearchProtocols.h"

@class SearchViewController;

@interface SearchWireframe : NSObject<SearchWireframeProtocol>

@property(nonatomic, weak) SearchViewController *viewController;

+ (void)presentScreenFromViewController:(UIViewController *)viewController;
+ (UIViewController *)setupViewController;

@end
