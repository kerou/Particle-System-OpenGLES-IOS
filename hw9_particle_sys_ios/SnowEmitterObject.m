//
//  SnowEmitterObject.m
//  hw9_particle_sys_ios
//
//  Created by Winnie Zeng on 4/9/14.
//  Copyright (c) 2014 Winnie Zeng. All rights reserved.
//

#import "SnowEmitterObject.h"
#import "EmitterShader.h"

#define NUM_PARTICLES 200

typedef struct Particle
{
    float       pID;
    float       pRadiusOffset;
    float       pVelocityOffset;
    float       pDecayOffset;
    float       pSizeOffset;
    GLKVector3  pColorOffset;
}
Particle;

typedef struct Emitter
{
    Particle    eParticles[NUM_PARTICLES];
    float       eRadius;
    float       eVelocity;
    float       eDecay;
    float       eSizeStart;
    float       eSizeEnd;
    GLKVector2  ePosition;
    GLKVector3  eColorStart;
    GLKVector3  eColorEnd;
}
Emitter;

@implementation SnowEmitterObject

@end
