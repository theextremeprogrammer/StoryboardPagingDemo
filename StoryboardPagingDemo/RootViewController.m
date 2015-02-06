//
//  RootViewController.m
//  StoryboardPagingDemo
//
//  Created by Derek Lee on 2/6/15.
//  Copyright (c) 2015 Derek Lee. All rights reserved.
//

#import "RootViewController.h"
#import "BaseContentViewController.h"

@interface RootViewController ()

#pragma mark - Private Properties
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *contentPageRestorationIDs; // NSString

@end

@implementation RootViewController

@synthesize contentPageRestorationIDs = _contentPageRestorationIDs;


#pragma mark - Setters and Getters
- (NSArray *)contentPageRestorationIDs
{
    if (!_contentPageRestorationIDs) {
        _contentPageRestorationIDs = @[@"Page1VC", @"Page2VC", @"Page3VC"];
    }
    
    return _contentPageRestorationIDs;
}


#pragma mark - View Controller Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    // Create the page view controller.
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    // Instantiate the first view controller.
    UIViewController *startingViewController = [self viewControllerAtIndex:0];
    
    [self.pageViewController setViewControllers:@[startingViewController]
                                      direction:UIPageViewControllerNavigationDirectionForward
                                       animated:NO
                                     completion:^(BOOL finished) {
                                         // Completion code
                                     }];
    
    // Add the page view controller to this root view controller.
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Public Methods
- (void)goToPreviousContentViewController
{
    // Get index of current view controller
    UIViewController *currentViewController = [self.pageViewController.viewControllers objectAtIndex:0];
    NSString *vcRestorationID = currentViewController.restorationIdentifier;
    NSUInteger index = [self.contentPageRestorationIDs indexOfObject:vcRestorationID];
    
    UIViewController *previousViewController = [self viewControllerAtIndex:index - 1];
    
    [self.pageViewController setViewControllers:@[previousViewController]
                                      direction:UIPageViewControllerNavigationDirectionReverse
                                       animated:YES
                                     completion:^(BOOL finished) {
                                         // Completion code
                                     }];
}

- (void)goToNextContentViewController
{
    // Get index of current view controller
    UIViewController *currentViewController = [self.pageViewController.viewControllers objectAtIndex:0];
    NSString *vcRestorationID = currentViewController.restorationIdentifier;
    NSUInteger index = [self.contentPageRestorationIDs indexOfObject:vcRestorationID];
    
    UIViewController *nextViewController = [self viewControllerAtIndex:index + 1];
    
    [self.pageViewController setViewControllers:@[nextViewController]
                                      direction:UIPageViewControllerNavigationDirectionForward
                                       animated:YES
                                     completion:^(BOOL finished) {
                                         // Completion code
                                     }];
}


#pragma mark - UIPageViewControllerDataSource
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return self.contentPageRestorationIDs.count;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSString *vcRestorationID = viewController.restorationIdentifier;
    NSUInteger index = [self.contentPageRestorationIDs indexOfObject:vcRestorationID];
    
    if (index == 0) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index - 1];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSString *vcRestorationID = viewController.restorationIdentifier;
    NSUInteger index = [self.contentPageRestorationIDs indexOfObject:vcRestorationID];
    
    if (index == self.contentPageRestorationIDs.count - 1) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index + 1];
}


#pragma mark - Private Methods
- (UIViewController *)viewControllerAtIndex:(NSUInteger)index
{
    // Only process a valid index request.
    if (index >= self.contentPageRestorationIDs.count) {
        return nil;
    }
    
    // Create a new view controller.
    BaseContentViewController *contentViewController = (BaseContentViewController *)[self.storyboard instantiateViewControllerWithIdentifier:self.contentPageRestorationIDs[index]];

    // Set any data needed by the VC here
    contentViewController.rootViewController = self;
    
    return contentViewController;
}

@end
