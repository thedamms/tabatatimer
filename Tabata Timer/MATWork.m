
#import "MATWork.h"
#import "MATViewController.h"

@interface MATWork()

@property (nonatomic) NSTimer *timer;
@property (nonatomic, weak) MATViewController *viewController;
@property (nonatomic) BOOL working;

- (void)setTimeLabel;
- (void)setStartStopButtonLabel:(NSString *)label;

@end

@implementation MATWork

int workTime = 20;

- (id)initWithViewController:(MATViewController *)viewController
{
    self = [super init];
    if (self) {
        self.working = NO;
        self.viewController = viewController;
        self.remainingWorkTime = workTime;
        [self setTimeLabel];
    }
    return self;
}

- (void)start {
    if (self.working) {
        self.working = NO;
        [self.timer invalidate];
        [self setStartStopButtonLabel:@"Start"];
    }
    else {
        self.working = YES;
        [self setStartStopButtonLabel:@"Stop"];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                      target:self
                                                    selector:@selector(timerTicked:)
                                                    userInfo:nil
                                                     repeats:YES];
    }
}

- (void)reset {
    [self.timer invalidate];
    self.remainingWorkTime = workTime;
    [self setTimeLabel];
    [self setStartStopButtonLabel:@"Start"];
}

- (void)timerTicked:(NSTimer*)timer {
    if (self.remainingWorkTime > 0) {
        self.remainingWorkTime -= 1;
    }
    else {
        [self.timer invalidate];
    }
    [self setTimeLabel];
}

- (void)setTimeLabel {
    self.viewController.timeLabel.text = [NSString stringWithFormat:@"%d",self.remainingWorkTime];
}

- (void)setStartStopButtonLabel:(NSString *)label {
    [self.viewController.startStopButton setTitle:label forState:UIControlStateNormal];
}

@end
