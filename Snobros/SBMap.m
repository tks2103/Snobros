//
//  SBMap.m
//  Snobros
//
//  Created by Tanoy Sinha on 10/23/12.
//  Copyright (c) 2012 Tanoy Sinha. All rights reserved.
//

#import "SBMap.h"

@implementation SBMap

-(id) initWithFile:(NSString *)filePath {
    self = [super init];
    if (self) {
        mapSprite = [[SBRectangle alloc] initWithFile:filePath andRectangle:CGRectMake(0, 0, 480, 320)];
    }
    return self;
}

-(void) render {
    [mapSprite render];
}

-(void) update {
    [mapSprite update];
}

@end
