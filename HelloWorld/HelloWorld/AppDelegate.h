//
// AppDelegate.h
// HelloWorld
//
// Created by Atsushi Iwasa on 2012/12/02.
// Copyright __MyCompanyName__ 2012年. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"

@interface AppController : NSObject <UIApplicationDelegate, CCDirectorDelegate>
{
	UIWindow* window_;
	UINavigationController* navController_;

	/* weak ref */
	CCDirectorIOS* director_;
}

@property (nonatomic, retain) UIWindow* window;
@property (readonly) UINavigationController* navController;
@property (readonly) CCDirectorIOS* director;

@end
