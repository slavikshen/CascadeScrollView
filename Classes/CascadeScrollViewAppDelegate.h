//
//  CascadeScrollViewAppDelegate.h
//  CascadeScrollView
//
//  Created by Slavik on 11-3-6.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CascadeScrollViewViewController;

@interface CascadeScrollViewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CascadeScrollViewViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CascadeScrollViewViewController *viewController;

@end

