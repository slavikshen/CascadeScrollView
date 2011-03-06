//
//  UICascadeScrollView.h
//  Browser
//
//  Created by Slavik on 11-1-18.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UICascadeScrollView : UIScrollView {
	UIView* passthroughView_;
}

@property(nonatomic,assign) IBOutlet UIView* passthroughView;

@end
