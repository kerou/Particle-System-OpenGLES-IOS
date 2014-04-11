//
//  EmitterShader.h
//  hw9_particle_sys_ios
//
//  Created by Winnie Zeng on 4/8/14.
//  Copyright (c) 2014 Winnie Zeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

@interface EmitterShader : NSObject

// Program Handle
@property (readwrite) GLuint    program;

// Attribute Handles
@property (readwrite) GLint     a_pID;
@property (readwrite) GLint     a_pRadiusOffset;
@property (readwrite) GLint     a_pVelocityOffset;
@property (readwrite) GLint     a_pDecayOffset;
@property (readwrite) GLint     a_pSizeOffset;
@property (readwrite) GLint     a_pColorOffset;

// Uniform Handles
@property (readwrite) GLuint    u_ProjectionMatrix;
@property (readwrite) GLint     u_Gravity;
@property (readwrite) GLint     u_Time;
@property (readwrite) GLint     u_eRadius;
@property (readwrite) GLint     u_eVelocity;
@property (readwrite) GLint     u_eDecay;
@property (readwrite) GLint     u_eSizeStart;
@property (readwrite) GLint     u_eSizeEnd;
@property (readwrite) GLint     u_eColorStart;
@property (readwrite) GLint     u_eColorEnd;
@property (readwrite) GLint     u_Texture;
@property (readwrite) GLint     u_ePosition;
// Methods
- (void)loadShader;

@end
