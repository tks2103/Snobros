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
    }
    return self;
}

@end
