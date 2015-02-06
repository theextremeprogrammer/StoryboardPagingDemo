//
//  Page1ViewController.m
//  StoryboardPagingDemo
//
//  Created by Derek Lee on 2/6/15.
//  Copyright (c) 2015 Derek Lee. All rights reserved.
//

#import "Page1ViewController.h"

@interface Page1ViewController ()

@end

@implementation Page1ViewController

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

- (IBAction)page2ButtonTapped:(UIBarButtonItem *)sender
{
    [self.rootViewController goToNextContentViewController];
}

@end
