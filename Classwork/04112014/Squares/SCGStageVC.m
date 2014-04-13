//
//  SCGStageVC.m
//  Squares
//
//  Created by Jisha Obukwelu on 4/11/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "SCGStageVC.h"
#import "SCGSquare.h"


@implementation SCGStageVC
{
    int gameSize;
    
    NSArray * playerColors;
    
    int playerTurn;
    
    NSMutableDictionary * tappedDots;
    
    NSMutableDictionary * allSquares;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        playerColors = @[BLUE_COLOR, ORANGE_COLOR];
        
        playerTurn = 0;
        
        tappedDots = [@{} mutableCopy];
        
        allSquares = [@{} mutableCopy];
    }

    return self;
}


- (void)viewDidLoad
//self.view for the ViewController actually loads on the screen
{
    [super viewDidLoad];
    gameSize = 4;
    
    float circleWidth = SCREEN_WIDTH / gameSize;
    float squareWidth = circleWidth/ 2;
    
    //create squares
    for(int sRow = 0; sRow <gameSize - 1; sRow++)
    {
        for (int sCol = 0; sCol < gameSize - 1; sCol++)
        {
            float squareX = ((circleWidth - squareWidth) * 1.5) + (circleWidth * sCol);
            float squareY = ((circleWidth - squareWidth) * 1.5) + (circleWidth * sRow) + ((SCREEN_HEIGHT - SCREEN_WIDTH) / 2);
            
            SCGSquare * square = [[SCGSquare alloc] initWithFrame:CGRectMake(squareX, squareY, squareWidth, squareWidth)];
            
            square.backgroundColor = [UIColor lightGrayColor];
            
            NSString * key = [NSString stringWithFormat:@"c%dr%d", sCol, sRow];//0,1 c0r1
            
            allSquares[key] = square;
            
            [self.view addSubview:square];
        }
    }
    
    for (int row = 0; row < gameSize; row++)
    {
        for (int col = 0; col < gameSize; col++)
        {
            float circleX = circleWidth * col;
            float circleY = (circleWidth * row) + ((SCREEN_HEIGHT - SCREEN_WIDTH)/2);
        
    
        SCGCircle * circle = [[SCGCircle alloc] initWithFrame: CGRectMake(circleX, circleY, circleWidth, circleWidth)];
        
        circle.position = (CGPoint){col, row};
        circle.delegate = self;
        
        NSString * key = [NSString stringWithFormat:@"c%dr%d", col, row];//0,1 c0r1
        
        tappedDots[key] =@2;
        
        [self.view addSubview:circle];
        }
    }
}

- (UIColor *)circleTappedWithPosition:(CGPoint)position
{
    //get tappedDots key from position
    NSString * key = [NSString stringWithFormat:@"c%dr%d", (int)position.x, (int)position.y];

    //set player num to value in tappedDots
    tappedDots[key] = @(playerTurn);
    
    //check for square
    [self checkForSquareAroundPosition:position];
    
    UIColor * currentColor = playerColors[playerTurn];
    
    playerTurn = (playerTurn) ? 0 : 1;
    
    return currentColor;
};


- (void)checkForSquareAroundPosition:(CGPoint)position
{
    //x = column and y = row
    
    int pX = position.x;
    int pY = position.y;
    
    BOOL above = (pY > 0);
    BOOL below = (pY < gameSize - 1);
    BOOL right = (pX > 0);
    BOOL left =  (pX < gameSize - 1);
    
    if (above && left)
    {
        //check top left quadrant
        //position 1
        //0,0 0,1 1,0 1,1
        
        for (UIColor * color in playerColors)
        {
            int player = [playerColors indexOfObject:color];
            // -1,-1 0, -1,0, 0,0
            
            NSString * topLeftDot = [NSString stringWithFormat:@"c%dr%d",pX-1, pY-1];
            NSString * topRightDot = [NSString stringWithFormat:@"c%dr%d",pX, pY-1];
            NSString * bottomLeftDot = [NSString stringWithFormat:@"c%dr%d",pX-1, pY];
            NSString * bottomRightDot = [NSString stringWithFormat:@"c%dr%d",pX, pY];
           
            //checks if top left and top right are the same
            BOOL topDotsSame = ([tappedDots[topLeftDot] isEqualToValue:tappedDots[topRightDot]]);
            
            //checks if bottom left and bottom right are the same
            BOOL bottomDotsSame = ([tappedDots[bottomLeftDot] isEqualToValue:tappedDots[bottomRightDot]]);
            
            //checks if top left and bottom left are the same
            BOOL leftDotsSame = ([tappedDots[topLeftDot] isEqualToValue:tappedDots[bottomLeftDot]]);
            
            //if top, left, & bottom dots the same as player... then they own the square
            if(topDotsSame && bottomDotsSame && leftDotsSame && [tappedDots[topLeftDot] isEqual:@(player)])
            {
                SCGSquare * currentSquare = allSquares[topLeftDot];
                
                NSLog(@"%@",topLeftDot);
                
                currentSquare.backgroundColor = color;
                
                ///player owns the square
            }
        }
        
    }
    if (above && right)
    {
        //check top right quadrant
    }
    if (below && left)
    {
        //check bottom left quadrant
    }
    if (below && right)
    {
        //check bottom right quadrant
    }
}

- (BOOL)prefersStatusBarHidden {return YES;}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
