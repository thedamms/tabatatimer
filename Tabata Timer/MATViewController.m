
#import "MATViewController.h"

@interface MATViewController ()
@property (nonatomic, strong) NSTimer *timer;

- (void)timerTicked:(NSTimer*)timer;
- (void)resetTime;
@end

@implementation MATViewController

int timevalue;

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self resetTime];
}

- (void)viewDidDisappear:(BOOL)animated {
    [self.timer invalidate];
    [super viewDidDisappear:animated];
}

- (void)timerTicked:(NSTimer*)timer {
    if (timevalue > 0) {
        timevalue -= 1;
    }
    else {
        [self.timer invalidate];
    }
    self.timeLabel.text = [NSString stringWithFormat:@"%d",timevalue];
}

- (IBAction)startStopButtonClicked:(id)sender {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                  target:self
                                                selector:@selector(timerTicked:)
                                                userInfo:nil
                                                 repeats:YES];
}

- (IBAction)resetButtonClicked:(id)sender {
    [self.timer invalidate];
    [self resetTime];
}

- (void)resetTime {
    timevalue = 30;
    self.timeLabel.text = [NSString stringWithFormat:@"%d",timevalue];
}

@end
