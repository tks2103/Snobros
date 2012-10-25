//
//  Entity.m
//  Snobros
//
//  Created by Tanoy Sinha on 10/23/12.
//  Copyright (c) 2012 Tanoy Sinha. All rights reserved.
//

#import "Entity.h"

@implementation Entity


- (void) render {
  [sprite_ render];
}


- (id) initWithFile:(NSString *)filePath
           position:(GLKVector2)position
               size:(CGSize)size {
  
  self = [super init];
  
  if (self) {
    sprite_ = [[Sprite alloc] initWithFile:filePath
                                  position:position
                                      size:size];
    position_ = position;
    size_     = size;
  }
  
  return self;
}

@end