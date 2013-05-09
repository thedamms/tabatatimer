
#import "MATViewController.h"

@interface MATViewController ()

@property (nonatomic) NSTimer *workTimer;
@property (nonatomic) NSTimer *restTimer;
@property (nonatomic) int remainingWorkTime;
@property (nonatomic) int remainingRestTime;
@property (nonatomic) BOOL working;
@property (nonatomic) BOOL resting;

@end

@implementation MATViewController

int workTime = 4;
int restTime = 2;

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self reset];
}

- (void)viewDidDisappear:(BOOL)animated {
    [self reset];
}

- (IBAction)startStopButtonClicked:(id)sender {
    [self start];
}

- (IBAction)resetButtonClicked:(id)sender {
    [self reset];
}

- (void)rest {
    self.resting = YES;
    self.working = NO;
    self.workRestLabel.text = @"Resting";
    self.timeLabel.text = [NSString stringWithFormat:@"%d",self.remainingRestTime];
    [self.workTimer invalidate];
    self.restTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                      target:self
                                                    selector:@selector(restTimerTicked:)
                                                    userInfo:nil
                                                     repeats:YES];
}

- (void)start {
    if (!self.working && !self.resting){
        self.working = YES;
        self.workRestLabel.text = @"Working";
        [self.startStopButton setTitle:@"Running" forState:UIControlStateDisabled];
        [self.restTimer invalidate];
        self.workTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                          target:self
                                                        selector:@selector(workTimerTicked:)
                                                        userInfo:nil
                                                         repeats:YES];
    }   
}

- (void)stop {
    [self.workTimer invalidate];
    [self.restTimer invalidate];
    [self.startStopButton setTitle:@"Start" forState:UIControlStateNormal];
}

- (void)reset {
    [self stop];
    self.working = NO;
    self.resting = NO;
    self.workRestLabel.text = @"Stopped";
    self.remainingWorkTime = workTime;
    self.remainingRestTime = restTime;
    self.timeLabel.text = [NSString stringWithFormat:@"%d",self.remainingWorkTime];
    
}

- (void)workTimerTicked:(NSTimer*)timer {
    if (self.remainingWorkTime > 0) {
        self.remainingWorkTime -= 1;
        self.timeLabel.text = [NSString stringWithFormat:@"%d",self.remainingWorkTime];
    }
    else {
        
        [self rest];
    }
}

- (void)restTimerTicked:(NSTimer*)timer {
    if (self.remainingRestTime > 0) {
        self.remainingRestTime -= 1;
        self.timeLabel.text = [NSString stringWithFormat:@"%d",self.remainingRestTime];
    }
    else {
        [self reset];
    }
}

@end
