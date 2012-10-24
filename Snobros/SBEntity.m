//
//  SBEntity.m
//  Snobros
//
//  Created by Tanoy Sinha on 10/23/12.
//  Copyright (c) 2012 Tanoy Sinha. All rights reserved.
//

#import "SBEntity.h"

@implementation SBEntity

-(void) render {
    [sprite render];
}

-(id) initWithFile:(NSString *)filePath andPosition:(GLKVector2)p andSize:(CGSize)s {
    self = [super init];
    if (self) {
        sprite = [[SBSprite alloc] initWithFile:filePath andPosition:p andSize:s];
        position = p;
        size = s;
        max_velocity = 10;
    }
    return self;
}

-(void) moveTo:(GLKVector2)p {
    position = p;
    [sprite moveTo:p withSize:size];
}

-(void) walkWithHeading:(GLKVector2)h withElapsedTime:(NSTimeInterval)e {
    float magnitude = e * max_velocity;
    GLKVector2 displacement = GLKVector2MultiplyScalar(GLKVector2Normalize(h), magnitude);
    [self moveTo:GLKVector2Add(position, displacement)];
}

@end
