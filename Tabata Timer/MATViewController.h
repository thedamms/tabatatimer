
#import <UIKit/UIKit.h>

@interface MATViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *numberOfRoundsLabel;
@property (weak, nonatomic) IBOutlet UILabel *workRestLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *startStopButton;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;
@property (weak, nonatomic) IBOutlet UILabel *finishedLabel;

- (IBAction)startStopButtonClicked:(id)sender;
- (IBAction)resetButtonClicked:(id)sender;

@end
