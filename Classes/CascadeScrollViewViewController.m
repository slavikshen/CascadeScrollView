//
//  CascadeScrollViewViewController.m
//  CascadeScrollView
//
//  Created by Slavik on 11-3-6.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CascadeScrollViewViewController.h"
#import "UICascadeScrollView.h"

@implementation CascadeScrollViewViewController


@synthesize scrollViewLevel1;
@synthesize scrollViewLevel2;
@synthesize contentLevel1;
@synthesize contentLevel2;
@synthesize nameList;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [nameList count];
}


- (void)configureCell:(UITableViewCell *)cell
	atIndexPath:(NSIndexPath *)indexPath 
	forTable:(UITableView*)tableView {
    
	NSString* name = [nameList objectAtIndex:indexPath.row];
	
    cell.textLabel.text = name;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell.
    [self configureCell:cell atIndexPath:indexPath forTable:tableView];
    
    return cell;
}



- (void)loadList {
	NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"names" ofType:@"plist"];
    self.nameList = [NSArray arrayWithContentsOfFile:dataPath];
}

- (void)setupContentScrollView {
	
	CGSize scrollViewSizeLevel1 = scrollViewLevel1.bounds.size;
	CGSize contentSizeLevel1 = CGSizeMake( scrollViewSizeLevel1.width+68.0, scrollViewSizeLevel1.height );
	scrollViewLevel1.contentSize = contentSizeLevel1;
	CGRect contentFrameLevel1 = CGRectMake( 68.0f, 0.0f, scrollViewSizeLevel1.width, scrollViewSizeLevel1.height );
	contentLevel1.frame = contentFrameLevel1;
	CGRect scrollViewFrameLevel2 = CGRectMake( 0.0f, 0.0f, contentFrameLevel1.size.width, contentFrameLevel1.size.height );
	scrollViewLevel2.frame = scrollViewFrameLevel2;
	CGSize scrollViewSizeLevel2 = scrollViewLevel2.bounds.size;
	CGSize contentSizeLevel2 = 	CGSizeMake( scrollViewSizeLevel2.width+68.0, scrollViewSizeLevel2.height );
	scrollViewLevel2.contentSize = contentSizeLevel2;
	CGRect contentFrameLevel2 = CGRectMake( 68.0f, 0.0f, scrollViewSizeLevel2.width, scrollViewSizeLevel2.height );
	contentLevel2.frame = contentFrameLevel2;

}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[self loadList];
	[self setupContentScrollView];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration {
	// resize the content scroller
	[self setupContentScrollView];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)releaseAll {
	
	self.contentLevel1 = nil;
	self.contentLevel2 = nil;
	self.scrollViewLevel1 = nil;
	self.scrollViewLevel2 = nil;
	self.nameList = nil;

}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	[self releaseAll];
}

- (void)dealloc {
	[self releaseAll];
    [super dealloc];
}

@end
