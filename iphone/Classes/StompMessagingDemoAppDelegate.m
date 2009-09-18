//
//  StompMessagingDemoAppDelegate.m
//  StompMessagingDemo
//
//  Created by Stefan Saasen on 10.09.09.
//  Copyright coravy 2009. All rights reserved.
//

#import "StompMessagingDemoAppDelegate.h"
#import "StompMessagingDemoViewController.h"

@implementation StompMessagingDemoAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
