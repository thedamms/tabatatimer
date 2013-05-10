
#import "MATViewController.h"

@interface MATViewController ()

@property (nonatomic) NSTimer *workTimer;
@property (nonatomic) NSTimer *restTimer;
@property (nonatomic) int remainingWorkTime;
@property (nonatomic) int remainingRestTime;
@property (nonatomic) BOOL working;
@property (nonatomic) BOOL resting;
@property (nonatomic) int currentRound;

@end

@implementation MATViewController

int workTime = 2;
int restTime = 2;
int rounds = 2;

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.currentRound = 1;
    [self reset];
}

- (void)viewDidDisappear:(BOOL)animated {
    [self reset];
}

- (IBAction)startStopButtonClicked:(id)sender {
    [self start];
}

- (IBAction)resetButtonClicked:(id)sender {
    self.finishedLabel.text = @"";
    [self reset];
}

- (void)rest {
    self.resting = YES;
    self.working = NO;
    self.workRestLabel.text = @"Resting";
    self.timeLabel.text = [NSString stringWithFormat:@"%d",self.remainingRestTime];
    [self.workTimer invalidate];
    self.restTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(restTimerTicked:) userInfo:nil repeats:YES];
}

- (void)start {
    if (!self.working && !self.resting){
        self.working = YES;
        self.finishedLabel.text = @"";
        self.workRestLabel.text = @"Working";
        [self.startStopButton setTitle:@"Running" forState:UIControlStateDisabled];
        [self.restTimer invalidate];
        self.workTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(workTimerTicked:) userInfo:nil repeats:YES];
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
    self.numberOfRoundsLabel.text = [NSString stringWithFormat:@"%d",self.currentRound];
}

- (void)workTimerTicked:(NSTimer*)timer {
    if (self.remainingWorkTime > 1) {
        self.remainingWorkTime -= 1;
        self.timeLabel.text = [NSString stringWithFormat:@"%d",self.remainingWorkTime];
    }
    else {
        [self rest];
    }
}

- (void)restTimerTicked:(NSTimer*)timer {
    if (self.remainingRestTime > 1) {
        self.remainingRestTime -= 1;
        self.timeLabel.text = [NSString stringWithFormat:@"%d",self.remainingRestTime];
    }
    else {
        self.currentRound = self.currentRound+1;
        if (self.currentRound > rounds) {
            self.finishedLabel.text = @"Finished!";
            self.currentRound = 1;
            [self reset];
        }
        else {
            [self reset];
            [self start];
        }
    }
}

@end
