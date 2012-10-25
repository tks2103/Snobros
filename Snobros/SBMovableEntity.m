//
//  SBMovableEntity.m
//  Snobros
//
//  Created by Tanoy Sinha on 10/23/12.
//  Copyright (c) 2012 Tanoy Sinha. All rights reserved.
//

#import "SBMovableEntity.h"

@implementation SBMovableEntity

@synthesize target;


- (id) initWithFile:(NSString *)filePath
        andPosition:(GLKVector2)p
            andSize:(CGSize)s {
    self = [super initWithFile:filePath andPosition:p andSize:s];
    if(self) {
        maxSpeed = 500;
        velocity  = GLKVector2Make(0, 0);
        target    = position;
    }
    return self;
}


- (void) teleportTo:(GLKVector2)p {
    position = p;
    GLKVector2 dest = GLKVector2Make(position.x-size.width/2,
                                     position.y-size.height/2);
    [sprite moveTo:dest withSize:size];
}


- (void) walkTo:(GLKVector2)point {
    GLKVector2 direction;
    target    = point;
    direction = GLKVector2Normalize(GLKVector2Subtract(target, position));
    velocity  = GLKVector2MultiplyScalar(direction, maxSpeed);
}


- (void) updateWithElapsedTime:(NSTimeInterval)e {
    GLKVector2 distance = GLKVector2MultiplyScalar(velocity, e);

    if (GLKVector2Length(distance) > 0) {
        [self teleportTo:GLKVector2Add(position, distance)];
    }

    if ([self atTargetAfter:e]) {
        velocity = GLKVector2Make(0, 0);
        [self teleportTo:target];
    }
}


- (bool) atTargetAfter:(NSTimeInterval)e {
    GLKVector2 distance = GLKVector2Subtract(target, position);
    return GLKVector2Length(distance) < (e * maxSpeed);
}

@end