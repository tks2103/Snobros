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

-(id) initWithFile:(NSString *)filePath andPosition:(GLKVector2)p andSize:(CGSize)s {
    self = [super initWithFile:filePath andPosition:p andSize:s];
    if(self) {
        max_speed = 500;
        target = position;
    }
    return self;
}

-(void) moveTo:(GLKVector2)p {
    position = p;
    GLKVector2 dest = GLKVector2Make(position.x-size.width/2, position.y-size.height/2);
    [sprite moveTo:dest withSize:size];
}


-(void) walkWithHeading:(GLKVector2)h withElapsedTime:(NSTimeInterval)e {
    float magnitude = e * max_speed;
    h = GLKVector2Normalize(h);
    GLKVector2 displacement = GLKVector2MultiplyScalar(h, magnitude);
    [self moveTo:GLKVector2Add(position, displacement)];
}


-(void) updateWithElapsedTime:(NSTimeInterval)e {
    if (!GLKVector2AllEqualToVector2(target, position)) {
        [self walkWithHeading:GLKVector2Subtract(target, position) withElapsedTime: e];
    }
    if ([self atTargetAfter:e]) {
        [self moveTo:target];
    }
}

-(bool) atTargetAfter:(NSTimeInterval)e {
    return GLKVector2Length(GLKVector2Subtract(target, position)) < (e * max_speed);
}

@end
