//
//  SBMovableEntity.h
//  Snobros
//
//  Created by Tanoy Sinha on 10/23/12.
//  Copyright (c) 2012 Tanoy Sinha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBMovable.h"
#import "SBEntity.h"

@interface SBMovableEntity : SBEntity <SBMovable> {
    float max_speed;
}

-(id) initWithFile:(NSString *)filePath andPosition:(GLKVector2)p andSize:(CGSize)s;

@end
