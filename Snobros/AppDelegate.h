//
//  AppDelegate.h
//  Snobros
//
//  Created by Tanoy Sinha on 10/23/12.
//  Copyright (c) 2012 Tanoy Sinha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import "SBViewController.h"
#import "SBEntity.h"
#import "SBMovableEntity.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, GLKViewControllerDelegate, GLKViewDelegate> {
    SBEntity           *map;
    SBMovableEntity    *bro;
    NSDate             *lastUpdate;
}

@property (strong, nonatomic) UIWindow *window;

#pragma mark GLKViewControllerDelegate
- (void)glkViewControllerUpdate:(GLKViewController *)controller;

#pragma mark GLKViewDelegate
- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect;

@end
