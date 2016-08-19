//
//  ViewController.m
//  MLAlertController
//
//  Created by Matthias Ludwig on 19.08.16.
//  Copyright © 2016 Matthias Ludwig. All rights reserved.
//

#import "ViewController.h"
#import "FakeAPI.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)fetch:(id)sender {
    [[FakeAPI new] fetch];
}

- (IBAction)fetchWithColor:(id)sender {
    [[FakeAPI new] fetchWithColor];
}


@end
