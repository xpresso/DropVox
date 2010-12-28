//
//  DropVoxViewController.m
//  DropVox
//
//  Created by Niels Joubert on 12/26/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "PlayerManager.h"
#import "PlayerManager.h"
#import "PlayViewController.h"
#import "PlayView.h"
#import "DropboxLoginViewController.h"

@implementation PlayViewController

#pragma mark -
#pragma mark Initialization

- (PlayViewController*) initWithPlayerManager:(PlayerManager*)pm {
	self = [super init];
	if (self) {
		_playerManager = [pm retain];
	}
	return self;
}

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	NSLog(@"PlayViewController loadView");

	_playView = [[PlayView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] andController:self];
	self.view = _playView;
	
	//register callbacks
	[_playerManager registerPlayerStateCallback:_playView];
	
}

- (void) viewDidLoad {
	NSLog(@"PlayViewController viewDidLoad");

}

#pragma mark -
#pragma mark Click Handling


-(void)playPauseButtonClicked:(id)sender {
	[_playerManager pb_togglePlayPause];
	[self showDropboxLoginController];
}
-(void)prevButtonClicked:(id)sender {
	[_playerManager pb_prev];
}
-(void)nextButtonClicked:(id)sender {
	[_playerManager pb_next];
}


#pragma mark -
#pragma mark Presenting Subviews

-(void)showDropboxLoginController {	
	DropboxLoginViewController* c = [[[DropboxLoginViewController alloc] init] autorelease];
	[self presentModalViewController:c animated:YES];
	
}


#pragma mark -
#pragma mark Built-ins


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)dealloc {
	[_playerManager release];
	[_playView release];
    [super dealloc];
}

@end