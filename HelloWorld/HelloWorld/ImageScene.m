//
// ImageScene.m
// HelloWorld
//
// Created by Atsushi Iwasa on 2012/12/05.
// Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "ImageScene.h"
#import "HelloWorldLayer.h"

@implementation ImageScene

+ (CCScene*)scene {
	CCScene* scene = [CCScene node];
	ImageScene* layer = [ImageScene node];

	[scene addChild:layer];

	return scene;
}

- (id)init {
	if(self = [super init]) {
		CCLayer* imageLayer = [CCLayer node];
		[self addChild:imageLayer];
		CCSprite* louiseSprite = [CCSprite spriteWithFile:@"Louise.jpg"];
		CGSize winSize = [[CCDirector sharedDirector] winSize];
		louiseSprite.position = CGPointMake(winSize.width / 2, winSize.height / 2);
		[imageLayer addChild:louiseSprite];
		id rotate = [CCRotateBy actionWithDuration:10 angle:360];
		id roop = [CCRepeatForever actionWithAction:rotate];
		[imageLayer runAction:roop];

		CCLayer* menuLayer = [CCLayer node];
		[self addChild:menuLayer];
		[CCMenuItemFont setFontName:@"Helvetica-BoldOblique"];
		[CCMenuItemFont setFontSize:40];
		CCMenuItemFont* item = [CCMenuItemFont itemWithString:@"back" block:^(id sender) {
		                            CCTransitionRotoZoom* zoom = [CCTransitionRotoZoom transitionWithDuration:2.0 scene:[HelloWorldLayer scene]];
		                            CCTransitionFade* tran = [CCTransitionFade transitionWithDuration:2.0 scene:[HelloWorldLayer scene] withColor:ccc3(0, 0, 0)];
		                            [[CCDirector sharedDirector] replaceScene:zoom];
								}];
		CCMenu* menu = [CCMenu menuWithItems:item, nil];
		[menuLayer addChild:menu];
		// [imageLayer addChild:menu];
	}

	return self;
}

@end
