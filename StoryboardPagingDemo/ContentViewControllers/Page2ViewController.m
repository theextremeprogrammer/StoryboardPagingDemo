//
//  Page2ViewController.m
//  StoryboardPagingDemo
//
//  Created by Derek Lee on 2/6/15.
//  Copyright (c) 2015 Derek Lee. All rights reserved.
//

#import "Page2ViewController.h"

@interface Page2ViewController ()

@end

@implementation Page2ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)page1ButtonTapped:(UIBarButtonItem *)sender
{
    [self.rootViewController goToPreviousContentViewController];
}

- (void)page3ButtonTapped:(UIBarButtonItem *)sender
{
    [self.rootViewController goToNextContentViewController];
}

@end
