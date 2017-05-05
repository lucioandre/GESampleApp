//
//  SearchViewController.m
//  GETestApp
//
//  Created by Avenue Brazil on 02/05/17.
//  Copyright © 2017 Lucio. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchResultsTableViewDataSource.h"
#import "MBProgressHUD.h"

@interface SearchViewController ()
@property (weak, nonatomic) IBOutlet UIButton *trainButton;
@property (weak, nonatomic) IBOutlet UIButton *busButton;
@property (weak, nonatomic) IBOutlet UIButton *flightButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *underlineViewLeadingConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *underlineViewWidthConstraint;

@property (nonatomic) SearchResultsTableViewDataSource *dataSource;
@end

@implementation SearchViewController

#pragma mark - View Controller Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[SearchResultsTableViewDataSource alloc] initWithTableView:self.tableView];
    [self.presenter viewDidLoadEvent];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.presenter viewDidAppearEvent];
}

#pragma mark - Orientation Change

//Using deprecated to be compatible with iOS 7 and 8
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [self.presenter orientationChangeEvent];
}

#pragma mark - Actions

- (IBAction)didTapButton:(id)sender {
    if ([sender isEqual:self.trainButton]) {
        [self.presenter didSelectOption:SelectedOptionTrain];
    }
    else if ([sender isEqual:self.busButton]) {
        [self.presenter didSelectOption:SelectedOptionBus];
    }
    else if ([sender isEqual:self.flightButton]) {
        [self.presenter didSelectOption:SelectedOptionFlight];
    }
}

#pragma mark - Protocol

- (void)showProgressIndicator {
    [MBProgressHUD showHUDAddedTo:self.tableView animated:YES];
    
}

- (void)hideProgressIndicator {
    [MBProgressHUD hideHUDForView:self.tableView animated:YES];
}

- (void)updateSearchResults:(NSArray<SearchResult *> *)results {
    [self.dataSource setResults:results];
}

- (void)updateLayoutForSelectedOption:(SelectedOption)selectedOption animated:(BOOL)animated {
    UIButton *selectedButton;
    switch (selectedOption) {
        case SelectedOptionBus: {
            selectedButton = self.busButton;
            break;
        }
        case SelectedOptionTrain: {
            selectedButton = self.trainButton;
            break;
        }
        case SelectedOptionFlight: {
            selectedButton = self.flightButton;
            break;
        }
    }
    if (animated) {
        [UIView animateWithDuration:0.3 delay:0.15 usingSpringWithDamping:0.4 initialSpringVelocity:0.4 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.underlineViewLeadingConstraint.constant = selectedButton.frame.origin.x;
            self.underlineViewWidthConstraint.constant = selectedButton.frame.size.width;
            [self.view layoutIfNeeded];
        } completion:nil];
    }
    else {
        self.underlineViewLeadingConstraint.constant = selectedButton.frame.origin.x;
        self.underlineViewWidthConstraint.constant = selectedButton.frame.size.width;
    }
}

@end
