//
//  DeviceManager.m
//  BNB
//
//  Created by Sean Soper on 12/27/11.
//  Copyright (c) 2011 Sean Soper. All rights reserved.
//

// Shared instance code courtesy of @lukeredpath
// http://lukeredpath.co.uk/blog/a-note-on-objective-c-singletons.html

#import "DeviceManager.h"

@implementation DeviceManager

@synthesize ipad, iphone, ios4, ios5;

+ (id)defaultManager {
  static dispatch_once_t pred = 0;
  __strong static id _sharedObject = nil;
  dispatch_once(&pred, ^{
    _sharedObject = [[self alloc] init];
  });

  return _sharedObject;
}

- (id) init {
  self = [super init];
  if (self) {
    ios4 = YES;
    ios5 = NO;
    if ([[UINavigationBar class] respondsToSelector:@selector(appearance)]) {
      ios4 = NO;
      ios5 = YES;
    }

    ipad = NO;
    iphone = YES;
    if ([[UIDevice currentDevice] respondsToSelector:@selector(userInterfaceIdiom)] &&
        [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
      ipad = YES;
      iphone = NO;
    }
  }

  return self;
}

@end
