//
//  Page3ViewController.m
//  StoryboardPagingDemo
//
//  Created by Derek Lee on 2/6/15.
//  Copyright (c) 2015 Derek Lee. All rights reserved.
//

#import "Page3ViewController.h"

@interface Page3ViewController ()

@end

@implementation Page3ViewController

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

- (void)page2ButtonTapped:(UIBarButtonItem *)sender
{
    [self.rootViewController goToPreviousContentViewController];
}

@end
