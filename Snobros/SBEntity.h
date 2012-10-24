//
//  SBEntity.h
//  Snobros
//
//  Created by Tanoy Sinha on 10/23/12.
//  Copyright (c) 2012 Tanoy Sinha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBRenderable.h"
#import "SBSprite.h"

@interface SBEntity : NSObject <SBRenderable> {
    GLKVector2  position;
    CGSize      size;
    SBSprite    *sprite;
}

-(id) initWithFile:(NSString *)filePath andPosition:(GLKVector2)p andSize:(CGSize)s;

@end
