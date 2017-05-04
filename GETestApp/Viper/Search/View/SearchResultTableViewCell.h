//
//  SearchResultTableViewCell.h
//  GETestApp
//
//  Created by Avenue Brazil on 03/05/17.
//  Copyright © 2017 Lucio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *vendorIcon;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeIntervalLabel;
@property (weak, nonatomic) IBOutlet UILabel *connectionAndDurationLabel;

@end
