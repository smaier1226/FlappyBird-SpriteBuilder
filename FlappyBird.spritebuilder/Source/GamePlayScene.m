#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    character = (Character*)[CCBReader load:@"Character"];
    [physicsNode addChild:character];
    
    // Add obstacle
    [self addObstacle];
    
    timeSinceObstacle = 0.0f;
}

-(void)update:(CCTime)delta
{
    // Increment the time since the last obstacle was added
    timeSinceObstacle += delta;
    
    // Check to see if two seconds have passed
    if(timeSinceObstacle > 2.0f)
    {
        // Add new obstacle
        [self addObstacle];
        
        // Rest the timer
        timeSinceObstacle = 0.0f;
    }
}

// put new methods here
- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    [character flap];
}

@end
