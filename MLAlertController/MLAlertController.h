//
//  MLAlertController.h
//  MLAlertController
//
//  Created by Matthias Ludwig on 19.08.16.
//  Copyright © 2016 Matthias Ludwig. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UIAlertCompletionBlock) (UIAlertController *alertViewController, NSInteger buttonIndex);
extern NSInteger const kAlertActionCancel;
extern NSInteger const kAlertActionOther;

@interface MLAlertController : NSObject

+ (MLAlertController *)sharedInstance;


- (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
         cancelButtonTitle:(NSString *)cancelButtonTitle
         otherButtonTitles:(NSString *)otherButtonTitle
                completion:(UIAlertCompletionBlock)completion;


- (void)showAlertWithColor:(UIColor *)color
                     title:(NSString *)title
                   message:(NSString *)message
         cancelButtonTitle:(NSString *)cancelButtonTitle
         otherButtonTitles:(NSString *)otherButtonTitle
                completion:(UIAlertCompletionBlock)completion;

@end
