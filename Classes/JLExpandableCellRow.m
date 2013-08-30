#import "JLExpandableCellRow"


@implementation JLExpandableCellRow {
    
    CGFloat tallestElementSoFar;
}
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        tallestElementSoFar = 0;
    }
    
    return self;
}

- (void)addSubview:(UIView *)view {
    [super addSubview:view];
    CGFloat totalHeight = view.frame.origin.y + view.frame.size.height;
    if(totalHeight > tallestElementSoFar){
        tallestElementSoFar = totalHeight + 10;
        CGRect newFrame = self.frame;
        newFrame.size.height = tallestElementSoFar;
        self.frame = newFrame;
    }
}

@end