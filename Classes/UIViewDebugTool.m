//
//  UIViewDebugTool.m
//  Browser
//
//  Created by slavik on 2/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIViewDebugTool.h"


#ifdef DEBUG

@implementation UIView(UIViewDebugTool)


- (void)leakSubview:(UIView*)subroot atDepth:(NSUInteger)dep {
	
	DLog( @"trace sub view[%u] %@", dep, [subroot description] );
	for( UIView* v in subroot.subviews ) {
		[self leakSubview:v atDepth:dep+1];
	}
	
}

- (void)leakSelf {
	NSUInteger dep = 0;
	[self leakSubview: self atDepth:dep];
}

@end

#endif
