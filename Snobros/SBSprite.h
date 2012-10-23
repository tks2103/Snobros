//
//  SBRectangle.h
//  Snobros
//
//  Created by Tanoy Sinha on 10/23/12.
//  Copyright (c) 2012 Tanoy Sinha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
#import "SBRenderable.h"
#import "SBMovable.h"

@interface SBSprite : NSObject <SBRenderable, SBMovable> {
    GLKVector2      *positionCoords;
    GLKVector2      *textureCoords;
    UIImage         *image;
    GLKBaseEffect   *effect;
    GLKTextureInfo  *texture;
    CGPoint         position;
    CGSize          size;
}

@property (readonly) GLKVector2 *positionCoords;
@property (readonly) GLKVector2 *textureCoords;

-(id) initWithFile:(NSString *)filePath andPosition:(CGPoint)pos andSize:(CGSize)s;

-(void) precalculateCoords;
-(void) precalculatePosition;
-(void) precalculateTexture;
-(void) updatePosition:(CGPoint)pos;

@end
