//
//  CascadeScrollViewViewController.h
//  CascadeScrollView
//
//  Created by Slavik on 11-3-6.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UICascadeScrollView;

@interface CascadeScrollViewViewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {

	UIView* contentLevel1;
	UIView* contentLevel2;
	
	UICascadeScrollView* scrollViewLevel1;
	UICascadeScrollView* scrollViewLevel2;
	
	NSArray* nameList;

}

@property(nonatomic,retain) IBOutlet UIView* contentLevel1;
@property(nonatomic,retain) IBOutlet UIView* contentLevel2;

@property(nonatomic,retain) IBOutlet UICascadeScrollView* scrollViewLevel1;
@property(nonatomic,retain) IBOutlet UICascadeScrollView* scrollViewLevel2;

@property(nonatomic,retain) NSArray* nameList;

@end

