//
//  MainViewController.m
//  hw9_particle_sys_ios
//
//  Created by Winnie Zeng on 4/8/14.
//  Copyright (c) 2014 Winnie Zeng. All rights reserved.
//

#import "MainViewController.h"
#import "EmitterObject.h"

@interface MainViewController ()

// Properties
@property (strong) NSMutableArray*  emitters;

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set up context
    EAGLContext* context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    [EAGLContext setCurrentContext:context];
    
    // Set up view
    GLKView* view = (GLKView*)self.view;
    view.context = context;
    
    // Set up Emitters
    self.emitters = [NSMutableArray array];
}

#pragma mark - GLKViewDelegate

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    // Set the background color (dark)
    // midnightblue (25, 25, 112) rgb
    glClearColor(0.098039f, 0.098039f, 0.2392156f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT);
    
    // Set the blending function (normal w/ premultiplied alpha)
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
    // Create Projection Matrix
    float aspectRatio = view.frame.size.width / view.frame.size.height;
    GLKMatrix4 projectionMatrix = GLKMatrix4MakeScale(1.0f, aspectRatio, 1.0f);
    
    // Render Emitters
    if([self.emitters count] != 0)
    {
        for(EmitterObject* emitter in self.emitters)
        {
            [emitter renderWithProjection:projectionMatrix];
        }
    }
}

- (void)update
{
    // Update Emitters
    if([self.emitters count] != 0)
    {
        NSMutableArray* deadEmitters = [NSMutableArray array];
        
        for(EmitterObject* emitter in self.emitters)
        {
            BOOL alive = [emitter updateLifeCycle:self.timeSinceLastUpdate];
            
            if(!alive)
                [deadEmitters addObject:emitter];
        }
        
        for(EmitterObject* emitter in deadEmitters)
            [self.emitters removeObject:emitter];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 1
    // Get touch point and screen information
    CGPoint touchPoint = [touches.anyObject locationInView:self.view];
    CGPoint glPoint = CGPointMake(touchPoint.x/self.view.frame.size.width, touchPoint.y/self.view.frame.size.height);
    
    // 2
    // Convert touch point to GL position
    float aspectRatio = self.view.frame.size.width / self.view.frame.size.height;
    float x = (glPoint.x * 2.0f) - 1.0f;
    float y = ((glPoint.y * 2.0f) - 1.0f) * (-1.0f/aspectRatio);
    
    // 3
    // Create a new emitter object
    EmitterObject* emitter = [[EmitterObject alloc] initWithTexture:@"pump_star_03.png" at:GLKVector2Make(x, y)];
    //EmitterObject* emitter = [[EmitterObject alloc] initWithTexture:@"snowflake-transparent-5.png" at:GLKVector2Make(0.0f, 1.5f)];
    [self.emitters addObject:emitter];
}

@end
