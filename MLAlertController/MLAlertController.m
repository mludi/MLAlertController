//
//  MLAlertController.m
//  MLAlertController
//
//  Created by Matthias Ludwig on 19.08.16.
//  Copyright © 2016 Matthias Ludwig. All rights reserved.
//

#import "MLAlertController.h"

NSInteger const kAlertActionCancel = 0;
NSInteger const kAlertActionOther = 1;

@interface MLAlertController()
@property (nonatomic, strong) NSMutableArray *alertsToShow;
@property (nonatomic) BOOL alertIsPresented;
@end

@implementation MLAlertController

+ (MLAlertController *)sharedInstance {
    static MLAlertController *_shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[self alloc] init];
    });
    return _shared;
}


- (instancetype)init {
    if (self = [super init]) {
        self.alertsToShow = [NSMutableArray array];
        self.alertIsPresented = NO;
    }
    return self;
}


- (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
         cancelButtonTitle:(NSString *)cancelButtonTitle
         otherButtonTitles:(NSString *)otherButtonTitle
                completion:(UIAlertCompletionBlock)completion {
    
    
    UIAlertController *alertController = [self alertControllerWithTitle:title message:message cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitle color:nil completion:completion];
    [self showAlert:alertController];
    
    
}


- (void)showAlertWithColor:(UIColor *)color
                     title:(NSString *)title
                   message:(NSString *)message
         cancelButtonTitle:(NSString *)cancelButtonTitle
         otherButtonTitles:(NSString *)otherButtonTitle
                completion:(UIAlertCompletionBlock)completion {
    
    
    
    UIAlertController *alertController = [self alertControllerWithTitle:title message:message cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitle color:color completion:completion];
    [self showAlert:alertController];
    
}


- (void)showAlert:(UIAlertController *)inAlertController {
    
    [self.alertsToShow addObject:inAlertController];
    
    if (!self.alertIsPresented) {
        [self showAlertIfNessecary];
    }
    
}

- (UIAlertController *)alertControllerWithTitle:(NSString *)inTitle message:(NSString *)inMessage cancelButtonTitle:(NSString *)inCancelButtonTitle otherButtonTitles:(NSString *)inOtherButtonTitles color:(UIColor *)inColor completion:(UIAlertCompletionBlock)inCompletion {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:inTitle message:inMessage preferredStyle:UIAlertControllerStyleAlert];
    if (inColor != nil) {
        UIView *theSubview = [[[alertController view] subviews] lastObject];
        UIView *theAlertContentView = [[theSubview subviews] lastObject];
        theAlertContentView.backgroundColor = inColor;
    }
    
    if (inCancelButtonTitle != nil) {
        
        UIAlertAction *cancelButtonAction = [UIAlertAction
                                             actionWithTitle:inCancelButtonTitle
                                             style:UIAlertActionStyleCancel
                                             handler:^(UIAlertAction *action)
                                             {
                                                 [self showAlertIfNessecary];
                                                 if (inCompletion != nil) {
                                                     inCompletion(alertController, kAlertActionCancel);
                                                 }
                                                 
                                             }];
        [alertController addAction:cancelButtonAction];
        
    }
    
    if (inOtherButtonTitles != nil) {
        
        UIAlertAction *otherButtonAction = [UIAlertAction
                                            actionWithTitle:inOtherButtonTitles
                                            style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction *action)
                                            {
                                                [self showAlertIfNessecary];
                                                if (inCompletion != nil) {
                                                    inCompletion(alertController, kAlertActionOther);
                                                }
                                                
                                            }];
        
        [alertController addAction:otherButtonAction];
    }
    return alertController;
}


- (void)showAlertIfNessecary {
    if ([self.alertsToShow count] == 0) {
        self.alertIsPresented = NO;
        return;
    }
    
    self.alertIsPresented = YES;
    
    UIAlertController *alertController = self.alertsToShow[0];
    [self.alertsToShow removeObjectAtIndex:0];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
        if ([rootViewController isKindOfClass:[UINavigationController class]]) {
            rootViewController= [[((UINavigationController *)rootViewController) viewControllers] firstObject];
        }
        if ([rootViewController isKindOfClass:[UITabBarController class]]) {
            
        }
        
        if ([rootViewController presentedViewController]) {
            UIViewController *presentVC = rootViewController.presentedViewController;
            [presentVC presentViewController:alertController animated:YES completion:nil];
        }
        else {
            [rootViewController presentViewController:alertController animated:YES completion:nil];
        }
        
    });
    
}


@end
