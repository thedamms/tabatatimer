
#import "MATViewController.h"
#import "MATWork.h"

@interface MATViewController ()

@property (nonatomic) MATWork *work;

@end

@implementation MATViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (self.work) {
        [self.work reset];
    }
    else {
        self.work = [[MATWork alloc] initWithViewController:self];
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    if (self.work) {
        [self.work reset];
    }
}

- (IBAction)startStopButtonClicked:(id)sender {
    if (self.work) {
        [self.work start];
    }
}

- (IBAction)resetButtonClicked:(id)sender {
    if (self.work) {
        [self.work reset];
    }
}

@end
