//
//  StompMessagingDemoAppDelegate.h
//  StompMessagingDemo
//
//  Created by Stefan Saasen on 10.09.09.
//  Copyright coravy 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StompMessagingDemoViewController;

@interface StompMessagingDemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    StompMessagingDemoViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet StompMessagingDemoViewController *viewController;

@end

