//
// main.m
// HelloWorld
//
// Created by Atsushi Iwasa on 2012/12/02.
// Copyright __MyCompanyName__ 2012年. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char* argv[]) {
	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
	int retVal = UIApplicationMain(argc, argv, nil, @"AppController");

	[pool release];
	return retVal;
}

