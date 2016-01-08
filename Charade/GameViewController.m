//
//  GameViewController.m
//  Charade
//
//  Created by Povilas Staskus on 1/8/16.
//  Copyright © 2016 ItWorksMobile. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@property UIInterfaceOrientation orientationLast, orientationAfterProcess;
@property CMMotionManager *motionManager;
@property bool isInCorrectState;
@property bool isInFalseState;
@property NSMutableArray *questions;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isInCorrectState = NO;
    _isInFalseState = NO;
    _questions = _topic.questions;
    _questionLabel.text = [self nextQuestion];
    
        [self initializeMotionManager];
    // Do any additional setup after loading the view.
}
- (void)viewDidAppear:(BOOL)animated {
    [self becomeFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)orientationChanged:(NSNotification *)notification {
    // Respond to changes in device orientation
}


- (BOOL)canBecomeFirstResponder {
    return YES;
}
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake)
    {
        
        NSLog(@"shake");
    }
}

- (void)initializeMotionManager{
    _motionManager = [[CMMotionManager alloc] init];
    _motionManager.accelerometerUpdateInterval = .2;
    _motionManager.gyroUpdateInterval = .2;
    
    [_motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
                                        withHandler:^(CMAccelerometerData  *accelerometerData, NSError *error) {
                                            if (!error) {
                                                [self outputAccelertionData:accelerometerData.acceleration];
                                            }
                                            else{
                                                NSLog(@"%@", error);
                                            }
                                        }];
}
- (void)outputAccelertionData:(CMAcceleration)acceleration{
    if (acceleration.z >=0.5) {
        
        _isInCorrectState = YES;
    }
    else  if (acceleration.z <=-0.5) {
        
        _isInFalseState = YES;
        
    }
        if (_isInCorrectState && acceleration.z<=0.15) {
            _questionLabel.text = [self nextQuestion];
                    _isInCorrectState = NO; // Runs the code after the correct answer
        }
        if (_isInFalseState && acceleration.z>=-0.15) {
            _questionLabel.text = [self nextQuestion];
            _isInFalseState = NO; // Runs the code after incorrect answer
        }
    
}

- (NSString*) nextQuestion {
    
    NSString *question;
    if (_questions.count>0) {
        int size = [_questions count]-1;
        int r = arc4random_uniform(size);
        question = _questions[r];
    
        // also need to remove integer
        
    }
    else  {NSLog(@"no more unique questions"); }
    
    return question;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
