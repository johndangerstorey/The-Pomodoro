//
//  POTimerViewController.m
//  The Pomodoro
//
//  Created by John D. Storey on 6/3/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "POTimerViewController.h"

@interface POTimerViewController ()
@property (strong, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UIButton *button;

@property (strong,nonatomic) NSTimer *timer;
@property (nonatomic) int remainingCounts;

-(void) startTimer;
@end

@implementation POTimerViewController

- (IBAction)buttonTapped:(id)sender {
    [self startTimer];
}


-(void) startTimer{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"RoundStartedNotification" object:nil userInfo:nil];
    NSLog(@"Timer Started");
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                             target:self
                                           selector:@selector(countDown)
                                           userInfo:nil
                                            repeats:YES];
    self.remainingCounts = 60;
}

-(void)countDown {
    if (--self.remainingCounts == 0) {
        NSLog(@"you ran out of counts");
        [[NSNotificationCenter defaultCenter] postNotificationName:@"RoundCompleteNotification" object:nil userInfo:nil];
        [self.timer invalidate];
    } else {
        NSLog(@"remaining counts: %d", self.remainingCounts);
        self.label.text = [NSString stringWithFormat:@"%i", self.remainingCounts];
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
