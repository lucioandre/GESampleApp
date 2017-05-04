//
//  SearchPresenter.h
//  GETestApp
//
//  Created by Avenue Brazil on 02/05/17.
//  Copyright © 2017 Lucio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchProtocols.h"

@interface SearchPresenter : NSObject<SearchPresenterProtocol>

@property(nonatomic, weak) id<SearchViewProtocol> view;
@property(nonatomic) id<SearchWireframeProtocol> wireframe;
@property(nonatomic) id<SearchInteractorProtocol> interactor;

@end
