//
//  SearchResultsTableViewDataSource.h
//  GETestApp
//
//  Created by Avenue Brazil on 03/05/17.
//  Copyright © 2017 Lucio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SearchResult.h"

@interface SearchResultsTableViewDataSource : NSObject

- (instancetype)initWithTableView:(UITableView *)tableView;
@property(nonatomic) NSArray<SearchResult *> *results;

@end
