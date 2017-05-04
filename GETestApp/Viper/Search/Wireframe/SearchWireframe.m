//
//  SearchWireframe.m
//  GETestApp
//
//  Created by Avenue Brazil on 02/05/17.
//  Copyright © 2017 Lucio. All rights reserved.
//

#import "SearchWireframe.h"
#import "SearchViewController.h"
#import "SearchInteractor.h"
#import "SearchPresenter.h"

@implementation SearchWireframe
 
#pragma mark - Public
    
+ (void)presentScreenFromViewController:(UIViewController *)viewController {
    UIViewController *presentingViewController = [self setupViewController];
    [viewController.navigationController pushViewController:presentingViewController animated:YES];
}

/*
 The method below use to be private. But in this case we expose it once it is the initial viewController
 on AppDelegate
 */
+ (UIViewController *)setupViewController {
    SearchPresenter *presenter = [SearchPresenter new];
    SearchWireframe *wireframe = [SearchWireframe new];
    SearchInteractor *interactor = [SearchInteractor new];
    
    SearchViewController *viewController = [[SearchViewController alloc] initWithNibName:NSStringFromClass(SearchViewController.class) bundle:nil];
    viewController.presenter = presenter;
    
    presenter.wireframe = wireframe;
    presenter.view = viewController;
    presenter.interactor = interactor;
    
    wireframe.viewController = viewController;
    
    return viewController;
}
    
@end
