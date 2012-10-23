//
//  SBMap.h
//  Snobros
//
//  Created by Tanoy Sinha on 10/23/12.
//  Copyright (c) 2012 Tanoy Sinha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SBRenderable.h"
#import "SBRectangle.h"

@interface SBMap : NSObject <SBRenderable> {
    SBRectangle     *mapSprite;
}

-(id) initWithFile:(NSString *) filePath;

@end
