
#import <Foundation/Foundation.h>
#import "MATViewController.h"

@interface MATWork : NSObject

@property (nonatomic) int remainingWorkTime;

- (id)initWithViewController:(MATViewController *)viewController;
- (void)start;
- (void)reset;

@end
