//
//  SBMovable.h
//  Snobros
//
//  Created by Tanoy Sinha on 10/23/12.
//  Copyright (c) 2012 Tanoy Sinha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

@protocol SBMovable <NSObject>
-(void) moveTo:(GLKVector2)p;
-(void) walkWithHeading:(GLKVector2)h withElapsedTime:(NSTimeInterval)e;
@end
