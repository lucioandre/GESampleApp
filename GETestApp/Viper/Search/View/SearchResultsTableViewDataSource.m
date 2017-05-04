//
//  SearchResultsTableViewDataSource.m
//  GETestApp
//
//  Created by Avenue Brazil on 03/05/17.
//  Copyright © 2017 Lucio. All rights reserved.
//

#import "SearchResultsTableViewDataSource.h"
#import "SearchResultTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface SearchResultsTableViewDataSource () <UITableViewDataSource>
@property (nonatomic, weak) UITableView *tableView;
@end

@implementation SearchResultsTableViewDataSource

- (instancetype)initWithTableView:(UITableView *)tableView {
    self = [super init];
    if (self) {
        self.tableView = tableView;
        
    }
    return self;
}

- (void)setTableView:(UITableView *)tableView {
    _tableView = tableView;
    _tableView.dataSource = self;
    _tableView.estimatedRowHeight = 102;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    
    NSString *searchResultNibName = NSStringFromClass(SearchResultTableViewCell.class);
    [_tableView registerNib:[UINib nibWithNibName:searchResultNibName bundle:nil] forCellReuseIdentifier:searchResultNibName];
}

- (void)setResults:(NSArray<SearchResult *> *)results {
    _results = results;
    [self.tableView reloadData];
}

#pragma mark - Table View Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //TODO: Do logic to show No results cell
    return self.results.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SearchResultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(SearchResultTableViewCell.class) forIndexPath:indexPath];
    if (indexPath.row < self.results.count) {
        SearchResult *result = self.results[indexPath.row];
        [cell.vendorIcon sd_setImageWithURL:[NSURL URLWithString:result.vendorIconUrlString]];
        cell.timeIntervalLabel.text = [result formattedTimeInterval];
        cell.connectionAndDurationLabel.text = [result formattedRouteInformation];
        cell.priceLabel.text = [result formattedPrice];
    }
    return cell;
}

@end
