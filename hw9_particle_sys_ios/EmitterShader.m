//
//  EmitterShader.m
//  hw9_particle_sys_ios
//
//  Created by Winnie Zeng on 4/8/14.
//  Copyright (c) 2014 Winnie Zeng. All rights reserved.
//

#import "EmitterShader.h"
#import "ShaderProcessor.h"

// Shaders
#define STRINGIFY(A) #A
#include "SparkEmitter.vsh"
#include "SparkEmitter.fsh"

@implementation EmitterShader

- (void)loadShader
{
    // Program
    ShaderProcessor* shaderProcessor = [[ShaderProcessor alloc] init];
    self.program = [shaderProcessor BuildProgram:EmitterVS with:EmitterFS];
    
    // Attributes
    self.a_pID = glGetAttribLocation(self.program, "a_pID");
    self.a_pRadiusOffset = glGetAttribLocation(self.program, "a_pRadiusOffset");
    self.a_pVelocityOffset = glGetAttribLocation(self.program, "a_pVelocityOffset");
    self.a_pDecayOffset = glGetAttribLocation(self.program, "a_pDecayOffset");
    self.a_pSizeOffset = glGetAttribLocation(self.program, "a_pSizeOffset");
    self.a_pColorOffset = glGetAttribLocation(self.program, "a_pColorOffset");
    
    // Uniforms
    self.u_ProjectionMatrix = glGetUniformLocation(self.program, "u_ProjectionMatrix");
    self.u_Gravity = glGetUniformLocation(self.program, "u_Gravity");
    self.u_Time = glGetUniformLocation(self.program, "u_Time");
    self.u_eRadius = glGetUniformLocation(self.program, "u_eRadius");
    self.u_eVelocity = glGetUniformLocation(self.program, "u_eVelocity");
    self.u_eDecay = glGetUniformLocation(self.program, "u_eDecay");
    self.u_eSizeStart = glGetUniformLocation(self.program, "u_eSizeStart");
    self.u_eSizeEnd = glGetUniformLocation(self.program, "u_eSizeEnd");
    self.u_eColorStart = glGetUniformLocation(self.program, "u_eColorStart");
    self.u_eColorEnd = glGetUniformLocation(self.program, "u_eColorEnd");
    self.u_Texture = glGetUniformLocation(self.program, "u_Texture");
    self.u_ePosition = glGetUniformLocation(self.program, "u_ePosition");
}

@end
