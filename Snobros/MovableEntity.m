//
//  MovableEntity.m
//  Snobros
//
//  Created by Tanoy Sinha on 10/23/12.
//  Copyright (c) 2012 Tanoy Sinha. All rights reserved.
//

#import "MovableEntity.h"

@implementation MovableEntity


- (id) initWithFile:(NSString *)filePath
           position:(GLKVector2)position
               size:(CGSize)size {
  
  self = [super initWithFile:filePath
                    position:position
                        size:size];
  if(self) {
    maxSpeed_  = 500;
    velocity_  = GLKVector2Make(0, 0);
    target_    = position;
  }
  return self;
}


- (void) teleportTo:(GLKVector2)position {
  position_ = position;
  GLKVector2 destination = GLKVector2Make(position.x-size_.width/2,
                                          position.y-size_.height/2);
  [sprite_ moveTo:destination withSize:size_];
}


- (void) walkTo:(GLKVector2)target {
  GLKVector2 direction;
  direction = GLKVector2Normalize(GLKVector2Subtract(target, position_));
  target_   = target;
  velocity_ = GLKVector2MultiplyScalar(direction, maxSpeed_);
}


- (void) updateWithElapsedTime:(NSTimeInterval)elapsedTime {
  GLKVector2 distance = GLKVector2MultiplyScalar(velocity_, elapsedTime);
  
  if (GLKVector2Length(distance) > 0) {
    [self teleportTo:GLKVector2Add(position_, distance)];
  }
  
  if ([self atTargetAfter:elapsedTime]) {
    velocity_ = GLKVector2Make(0, 0);
    [self teleportTo:target_];
  }
}


- (bool) atTargetAfter:(NSTimeInterval)elapsedTime {
  GLKVector2 distance = GLKVector2Subtract(target_, position_);
  return GLKVector2Length(distance) < (elapsedTime * maxSpeed_);
}

@end