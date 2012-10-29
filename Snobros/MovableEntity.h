//
//  MovableEntity.h
//  Snobros
//
//  Created by Tanoy Sinha on 10/23/12.
//  Copyright (c) 2012 Tanoy Sinha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movable.h"
#import "Entity.h"

@interface MovableEntity : Entity<Movable> {
 @private
  float      maxSpeed_;
  GLKVector2 velocity_;
  GLKVector2 target_;
}


- (id)   initWithFile:(NSString *)filePath
             position:(GLKVector2)position
                 size:(CGSize)size;
- (void) updateWithElapsedTime:(NSTimeInterval)elapsedTime;
- (void) walkTo:(GLKVector2)target;

@end
