//
//  UICascadeScrollView.m
//  Browser
//
//  Created by Slavik on 11-1-18.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UICascadeScrollView.h"

@implementation UICascadeScrollView

@synthesize passthroughView = passthroughView_;

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
		for( UIView* v in self.subviews ) {
				if( CGRectContainsPoint( v.frame, point ) ) {
						// one of the sub view could accept the touch event
						return [super hitTest:point withEvent:event];
				}
		}
		// pass the event to the passthroughView and its subviews
		CGPoint newPoint = [self convertPoint:point toView:passthroughView_];
		return [passthroughView_ hitTest:newPoint withEvent:event];
}

- (void)dealloc {
		self.passthroughView = nil;
    [super dealloc];
}


@end
