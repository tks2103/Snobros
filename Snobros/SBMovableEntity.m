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
      target = GLKVector2Make(240, 160);
    }
    return self;
}

-(void) moveTo:(GLKVector2)p {
    position = p;
    [sprite moveTo:p withSize:size];
}


-(void) walkWithHeading:(GLKVector2)h withElapsedTime:(NSTimeInterval)e {
    float magnitude = e * max_speed;
    GLKVector2 displacement = GLKVector2MultiplyScalar(GLKVector2Normalize(h), magnitude);
    [self moveTo:GLKVector2Add(position, displacement)];
}


-(void) updateWithElapsedTime:(NSTimeInterval)e {
    if ([self atTargetAfter:e]) {
        int x = arc4random()%480 - 240;
        int y = arc4random()%320 - 160;
        target = GLKVector2Make(x, y);
    }
    [self walkWithHeading:GLKVector2Subtract(target, position) withElapsedTime: e];
}

-(bool) atTargetAfter:(NSTimeInterval)e {
    return GLKVector2Length(GLKVector2Subtract(target, position)) < (e * max_speed);
}

@end
