//
//  SnowEmitterObject.h
//  hw9_particle_sys_ios
//
//  Created by Winnie Zeng on 4/9/14.
//  Copyright (c) 2014 Winnie Zeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

@interface SnowEmitterObject : NSObject
-(id) initWithTexture:(NSString *)fileName at:(GLKVector2) position;
-(void) renderWithProjection:(GLKMatrix4) projectionMatrix;
-(BOOL) updateLifeCycle:(float) timeElapsed;

@end
