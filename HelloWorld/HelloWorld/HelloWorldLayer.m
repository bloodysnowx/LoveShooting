//
// HelloWorldLayer.m
// HelloWorld
//
// Created by Atsushi Iwasa on 2012/12/02.
// Copyright __MyCompanyName__ 2012年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "ImageScene.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+ (CCScene*)scene {
	// 'scene' is an autorelease object.
	CCScene* scene = [CCScene node];

	// 'layer' is an autorelease object.
	HelloWorldLayer* layer = [HelloWorldLayer node];

	// add layer as a child to scene
	[scene addChild:layer];

	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
- (id)init {
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self = [super init]) ) {
		CGSize winSize = [[CCDirector sharedDirector] winSize];
		CCLabelTTF* label = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"W:%.2f, H:%.2f", winSize.width, winSize.height] fontName:@"Marker Felt" fontSize:40];

		label.position = CGPointMake(winSize.width / 2, winSize.height * 3 / 4);
		[self addChild:label];

		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];

		//
		// Leaderboards and Achievements
		//

		// Default font size will be 28 points.
		[CCMenuItemFont setFontSize:28];

		// Achievement Menu Item using blocks
		// CCMenuItem *itemAchievement = [CCMenuItemFont itemWithString:@"Achievements" block:^(id sender) {
		CCMenuItem* itemAchievement = [CCMenuItemFont itemWithString:@"Ranks" block:^(id sender) {
		                                   GKAchievementViewController* achivementViewController = [[GKAchievementViewController alloc] init];
		                                   achivementViewController.achievementDelegate = self;

		                                   AppController* app = (AppController*)[[UIApplication sharedApplication] delegate];

		                                   [[app navController] presentModalViewController:achivementViewController animated:YES];

		                                   [achivementViewController release];
									   }

		    ];

		// Leaderboard Menu Item using blocks
		// CCMenuItem *itemLeaderboard = [CCMenuItemFont itemWithString:@"Leaderboard" block:^(id sender) {
		CCMenuItem* itemLeaderboard = [CCMenuItemFont itemWithString:@"LB" block:^(id sender) {
		                                   GKLeaderboardViewController* leaderboardViewController = [[GKLeaderboardViewController alloc] init];
		                                   leaderboardViewController.leaderboardDelegate = self;

		                                   AppController* app = (AppController*)[[UIApplication sharedApplication] delegate];

		                                   [[app navController] presentModalViewController:leaderboardViewController animated:YES];

		                                   [leaderboardViewController release];
									   }

		    ];

		CCMenuItemFont* item = [CCMenuItemFont itemWithString:@"To imageScene" block:^(id sender) {
		                            CCTransitionTurnOffTiles* tiles = [CCTransitionTurnOffTiles transitionWithDuration:2.0 scene:[ImageScene scene]];
		                            [[CCDirector sharedDirector] replaceScene:tiles];
		                            // [[CCDirector sharedDirector] replaceScene:[ImageScene scene]];
								}];
        
        NSArray* toggleMenuItems = [NSArray arrayWithObjects:[CCMenuItemFont itemWithString:@"ON"], [CCMenuItemFont itemWithString:@"OFF"], nil];
        CCMenuItemToggle* itemToggle = [CCMenuItemToggle itemWithItems:toggleMenuItems block:^(id sender) {
            CCLOG(@"toggle");
        }];

		CCMenu* menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, item, itemToggle, nil];

		// [menu alignItemsHorizontallyWithPadding:20];
        [menu alignItemsVerticallyWithPadding:10];
		[menu setPosition:ccp(size.width / 2, size.height / 2 - 50)];

		// Add the menu to the layer
		[self addChild:menu];
        
        CCSprite* sampleSprite = [CCSprite spriteWithFile:@"Icon@2x.png"];
        sampleSprite.anchorPoint = CGPointMake(0, 0);
        sampleSprite.position = CGPointMake(0, 0);
        [self addChild:sampleSprite];
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void)dealloc {
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)

	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GameKit delegate

- (void)achievementViewControllerDidFinish:(GKAchievementViewController*)viewController {
	AppController* app = (AppController*)[[UIApplication sharedApplication] delegate];

	[[app navController] dismissModalViewControllerAnimated:YES];
}

- (void)leaderboardViewControllerDidFinish:(GKLeaderboardViewController*)viewController {
	AppController* app = (AppController*)[[UIApplication sharedApplication] delegate];

	[[app navController] dismissModalViewControllerAnimated:YES];
}

@end
