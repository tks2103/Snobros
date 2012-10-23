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

@interface SBRectangle : NSObject <SBRenderable> {
    GLKVector2      *positionCoords;
    GLKVector2      *textureCoords;
    CGRect          rectangleInfo;
    UIImage         *image;
    GLKBaseEffect   *effect;
    GLKTextureInfo  *texture;
}

@property (readonly) GLKVector2 *positionCoords;
@property (readonly) GLKVector2 *textureCoords;

-(id) initWithFile:(NSString*) filePath;
-(id) initWithFile:(NSString *)filePath andRectangle:(CGRect) rect;

-(void) precalculateCoords;
-(void) precalculatePosition;
-(void) precalculateTexture;

@end
