//
//  FakeAPI.m
//  MLAlertController
//
//  Created by Matthias Ludwig on 19.08.16.
//  Copyright © 2016 Matthias Ludwig. All rights reserved.
//

#import "FakeAPI.h"
#import "MLAlertController.h"

@implementation FakeAPI


- (void)fetch {
    [[MLAlertController sharedInstance] showAlertWithTitle:@"Fetch" message:@"My API" cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok" completion:^(UIAlertController *alertViewController, NSInteger buttonIndex) {
        if (buttonIndex == kAlertActionCancel) {
            NSLog(@"cancelled!");
        }
        else if (buttonIndex == kAlertActionOther) {
            NSLog(@"other!");
        }
    }];
}

- (void)fetchWithColor {
    [[MLAlertController sharedInstance] showAlertWithColor:[UIColor redColor] title:@"Fetch with Color" message:@"Cool!" cancelButtonTitle:@"Ok" otherButtonTitles:nil completion:nil];
}

@end
