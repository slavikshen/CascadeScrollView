//
//  UIViewDebugTool.h
//  Browser
//
//  Created by slavik on 2/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifdef DEBUG

@interface UIView(UIViewDebugTool)

- (void)leakSubview:(UIView*)subroot atDepth:(NSUInteger)dep;
- (void)leakSelf;

@end

#endif