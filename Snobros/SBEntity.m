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

-(id) initWithFile:(NSString *)filePath andPosition:(CGPoint)pos andSize:(CGSize)s {
    self = [super init];
    if (self) {
        sprite = [[SBSprite alloc] initWithFile:filePath andPosition:pos andSize:s];
    }
    return self;
}

@end
