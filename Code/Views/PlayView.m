//
//  PlayView.m
//  DropVox
//
//  Created by Niels Joubert on 12/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PlayView.h"
#import <UIKit/UIImage.h>
#import <UIKit/UIImageView.h>
#import "UIPlayPauseButton.h"

@implementation PlayView


- (id)initWithFrame:(CGRect)frame andController:(PlayViewController*)pvController {
    if ((self = [super initWithFrame:frame])) {

		self.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
				
		UIImage* btn_play =			[UIImage imageNamed:@"btn_play.png"];
		UIImage* btn_play_pressed = [UIImage imageNamed:@"btn_play_pressed.png"];
		UIImage* btn_pause =		[UIImage imageNamed:@"btn_pause.png"];
		UIImage* btn_pause_pressed = [UIImage imageNamed:@"btn_pause_pressed.png"];		

		UIImage* btn_next =		[UIImage imageNamed:@"btn_forward.png"];
		UIImage* btn_next_p = [UIImage imageNamed:@"btn_forward_pressed.png"];		

		UIImage* btn_prev =		[UIImage imageNamed:@"btn_back.png"];
		UIImage* btn_prev_p = [UIImage imageNamed:@"btn_back_pressed.png"];		

		
		playPauseButton = [[UIPlayPauseButton alloc] 
						   initWithFrame:CGRectMake(120.0f, 40.0f, 80.0f, 80.0f) 
						   playButton:btn_play 
						   playButtonPressed:btn_play_pressed 
						   pauseButton:btn_pause 
						   pauseButtonPressed:btn_pause_pressed];
		[playPauseButton addTarget:pvController
							action:@selector(playPauseButtonClicked:) 
							forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:playPauseButton];

		
		prevButton = [[UIButton alloc] 
					  initWithFrame:CGRectMake(35.0f, 50.0f, 60.0f, 60.0f)];		
		[prevButton setBackgroundImage:btn_prev forState:UIControlStateNormal];
		[prevButton setBackgroundImage:btn_prev_p forState:UIControlStateHighlighted];
		[prevButton addTarget:pvController
					   action:@selector(prevButtonClicked:) 
			 forControlEvents:UIControlEventTouchUpInside];		
		[self addSubview:prevButton];
		
		
		nextButton = [[UIButton alloc] 
					  initWithFrame:CGRectMake(225.0f, 50.0f, 60.0f, 60.0f)];
		[nextButton setBackgroundImage:btn_next forState:UIControlStateNormal];
		[nextButton setBackgroundImage:btn_next_p forState:UIControlStateHighlighted];		
		[nextButton addTarget:pvController
							action:@selector(nextButtonClicked:) 
							forControlEvents:UIControlEventTouchUpInside];		
		[self addSubview:nextButton];
		  
	}
    return self;	
}

#pragma mark -
#pragma mark PlayerStateCallbackProtocol implementations
-(void) playerStateChanged:(PlayerState)newState {
	[playPauseButton playerStateChanged:newState];
}

#pragma mark -

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (void)dealloc {
	NSLog(@"PlayView dealloc\n");
    [super dealloc];
}


@end