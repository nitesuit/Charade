//
//  GameViewController.h
//  Charade
//
//  Created by Povilas Staskus on 1/8/16.
//  Copyright © 2016 ItWorksMobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSONHelper.h"

#import <CoreMotion/CoreMotion.h>

#define kCMDeviceMotionUpdateFrequency (1.f/30.f)

@interface GameViewController : UIViewController

@property (nonatomic) Topic *topic;
@property (strong, nonatomic) IBOutlet UILabel *questionLabel;

@end
